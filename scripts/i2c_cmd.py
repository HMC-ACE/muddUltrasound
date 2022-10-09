"""
Alec Vercruysse
2021-04-29

API to do low-level interfacing with the i2c channel.
Run this script with interactive mode `-i` if running it as main.
This module contains all the methods that involve direct interaction
with the array itself, and it defines the ``PhasedArray`` and 
`ChannelBoard`` objects in order to do so.
"""
from pyftdi import i2c
from crccheck.crc import Crc32
import numpy as np
import matplotlib.pyplot as plt
import time
import copy

import phaseshifts
import das_scan

URL = 'ftdi://ftdi:ft2232h/1'
"""
Default ftdi url for the entire phased array bus.
See `pyftdi` documentation for how this works. 
Channel 2 is used for the psf board as of 2021-07-17.
"""


class BoardApi:
    """
    API mapping actions to the bytes to send to the channel board via i2c.
    """
    
    RESET_BUFFERIDX = 0  # set bufferidx to 0
    SET_BUFFERIDX = 1    # immediately followed by the bufferidx (one byte)
    RESTART_CAPTURE = 2  # for debug (high latency)
    START_PWM = 3        # for debug (high latency)
    STOP_PWM = 4         # for debug (high latency)
    TX_MODE = 42         # for debug (high latency)
    RX_MODE = 43         # for debug (high latency)
    SET_MUXDAC = 5       # (see ChannelBoard.write_dacc)
    SET_VGADAC = 6       # (see ChannelBoard.write_dacc)
    SET_DELAY = 102      # (see ChannelBoard.set_delay)


class PhasedArray:

    addrs = [
        [7, 8, 9],
        [4, 5, 6],
        [1, 2, 3]
    ]
    """
    maps the i2c addresses of the elements in the array to the array positions,
    when looking at the array from behind.
    """

    delay = 0.0008
    """
    seconds between tx and rx start (set by trimming 555 timing pot)
    """
    
    garbage_samples = 100
    """
    number of samples to discard after tx/rx switch due to transients.
    """
    
    fs = 1e6
    """
    sampling frequency in samples/second
    """
    
    v = 1484.
    """
    wave speed in meters/second
    """

    def __init__(self, muxdac=2, vgadac=0.6):
        """
        Create an instance of the PhasedArray class.
        Instantiating this sets muxdac and vgadac of each board 
        to set and identical values.

        Parameters
        ----------
        muxdac : float
            MUXDAC voltage level. This controls transmit amplitude.
        vgadac : float
            VGA gain voltage level. This controls the VGA gain. Note that the
            VGA is supposed to take a voltage between -.6 and .6V, and we
            accidentally built the system to map the MCU dac directly to the
            gain in. Since the MCU dac can only do .55v min (1/6 of Vref), 
            we basically have to set it as low as possible, and for rev1.0
            of the boat channel board, we do not have VGA dac control.

        Returns
        -------
        PhasedArray object
        """
        boards = copy.deepcopy(self.addrs)
        for i in range(len(self.addrs)):
            for j in range(len(self.addrs[i])):
                boards[i][j] = ChannelBoard(self.addrs[i][j],
                                            muxdac=muxdac, vgadac=vgadac)
        self.boards = boards

    def aim_beam(self, x, y, z, debug=False):
        """
        Aim a plane wave beam towards some x, y, z coordinates in cartesian
        space. x=y=0 points the beam straight out. By the RHR, positive y
        is down (positive x is right when looking behind the array).

        Parameters
        ----------
        x : float
            x in meters, pointing right when looking at the array from behind.
        y : float
            y in meters, pointing down when looking at the array from behind.
        z : float
            z in meters, pointing out when looking at the array from behind.
        debug : boolean
            Whether or not to print the computed phaseshifts in us.
        """
        shifts = phaseshifts.phaseshifts(x, y, z, debug=debug)
        for i in range(len(self.addrs)):
            for j in range(len(self.addrs[i])):
                self.boards[i][j].set_delay(shifts[i][j])

    def aim_beam_spherical(self, theta, phi, debug=False):
        """
        aim a plane wave beam, spherical coords in radians.

        Parameters
        ----------
        theta : float
            theta in radians, angle off the z-axis
        phi : float
            x in radians, angle off the x-axis in the x-y plane.
        debug : boolean
            Whether or not to print the computed phaseshifts in us.
        """
        shifts = phaseshifts.phaseshifts(theta=theta, phi=phi, debug=debug)
        for i in range(len(self.addrs)):
            for j in range(len(self.addrs[i])):
                self.boards[i][j].set_delay(shifts[i][j])

    def aim_beam_directional_cosine(self, alpha, beta, debug=False):
        """
        alpha is directional cosine along x-axis, beta is along y-axis.
        both are between zero and one, and if the directional cosine along
        the z axis is `gamma`:

        .. math:: alpha^2 + beta^2 + gamma^2 = 1

        Parameters
        ----------
        alpha : float
            x-component (between 0 and 1) of the beam steering direction.
        y : float
            y-component (between 0 and 1) of the beam steering direction.
        debug : boolean
            Whether or not to print the computed phaseshifts in us.
        """
        shifts = phaseshifts.phaseshifts(alpha=alpha, beta=beta, debug=debug)
        for i in range(len(self.addrs)):
            for j in range(len(self.addrs[i])):
                self.boards[i][j].set_delay(shifts[i][j])

    def send_pulse(self):
        """
        Send a sync pulse via the FTDI chip GPIO
        to start a synchronus pulse/ADC capture.
        See `i2c_cmd.ChannelBoard.send_pulse` for details.
        """
        self.boards[0][0].send_pulse()  # doesn't matter which board

    def send_read(self, max_dist=None):
        """
        Retrieve the piezo voltage data from all ADCs.
        Note that the echo data does not start at t=0
        (as measured from the start of the pulse)
        but rather the calibrated delay time between the falling edge
        of the sync pulse and the rising edge of the sync pulse.
        As of 2021-07-15 we use a 555 timer to make this pulse delay
        exactly .8ms. (see `PhasedArray.delay`).

        In addition to the tx/rx piezo delay, we need to account for some
        "garbage samples" which contain the transient caused by the tx/rx
        switch itself. These are thrown out immediately.

        TODO: consider also returning the start time in seconds of the
            first sample that we return? Or letting the user choose
            the min_distance.

        Parameters
        ----------
        max_dist : float or None
            Maximum possible echo distance for which to read samples.
            This takes into account the speed of sound in water, the
            out and back nature of the echo, the delay between the
            tx and rx switch, and the garbage samples discarded at
            the beginning of the ADC capture.

        Returns
        -------
        data : np.array, shape (3, 3, nsamples).
            Time-series ADC voltage data corresponding to each ADC capture
            for every channel. The first two dimensions of the array are
            equal to the dimensions of the `PhasedArray.addrs` (and therefore
            `PhasedArray.boards` array, and the first two indexes correspond
            to the board with equivalent address in the `PhasedArray.addrs`
            array.
        """
        if max_dist is not None:
            fs = 1e6  # sampling frequency TODO: consolidate usages?
            nbytes = 2 * int((2 * max_dist / self.v - self.delay) *
                             fs - self.garbage_samples)
            if nbytes <= 0:
                raise ValueError(f"Error: max_dist of {max_dist}m " +
                                 "too small for array delay of {self.delay} s")
        else:
            nbytes = None

        # align to chunk/account for nbytes=None
        nbytes = self.boards[0][0]._calc_nbytes(nbytes)
        data = np.zeros((*np.shape(self.boards),
                         nbytes//2 - self.garbage_samples))
        for i in range(data.shape[0]):
            for j in range(data.shape[1]):
                data[i, j] = self.boards[i][j].send_read(
                            amnt=nbytes)[self.garbage_samples:]
        return data

    def idx_to_range(self, idx):
        """
        Convert an index (or array of indexes) to the equivalent
        travel distance for an echo at that point.

        Parameters
        ----------
        idx : integer
            index of a sample in a received echo

        Returns
        -------
        range : float
            the range that that index corresponds to in the echo.
        """
        travel_time = self.delay + (idx + self.garbage_samples)/self.fs
        r = travel_time * self.v / 2  # 2 to account for round trip
        return r

    def plot_echo(self, data=None, max_dist=None, apply_bandpass=False,
                  units='meters', blocking=True):
        """
        Does not modify beam steering.
        If no data is given, it sends a pulse, reads, plots.
        If data is given (e.g. from self.send_read()), `max_dist` is unused and
        no pulse is sent, just plots.

        In the legend, click on the lines (not the labels, but the lines!) to
        turn visibility on and off for each channel.

        TODO: better visibility toggling, including turning all off.

        Parameters
        ----------
        data : np.array or None
            If data is passed in (by default, no data), don't send an echo,
            just plot the data. The data should be in the output format
            of `PhasedArray.send_read()`. If no data is given, this will
            send an echo and plot it.
        max_dist : float or None
            If given, limit the recieved samples to correspond to some maximum
            range of interest. Helpful to reduce the amount of data transferred
            over the i2c bus (which is slow).
        apply_bandpass : bool
            whether or not to apply `das_scan.bandpass` to the data before plotting.
        units : str, `meters` or `idx`
            Whether to plot the x-axis in terms of equivalent meters range
            or sample index.
        blocking : bool
            Whether to stop and wait for the plot to close before continuing or 
            keep running the program after the plot has been created.
        """
        def _on_pick(event):
            """
            legend pick callback handler. taken from matplotlib example code.
            `https://matplotlib.org/stable/gallery/event_handling/legend_picking.html`
            """
            legline = event.artist
            origline = traced[legline]
            visible = not origline.get_visible()
            origline.set_visible(visible)
            legline.set_alpha(1.0 if visible else 0.5)
            event.canvas.draw()

        fig, ax = plt.subplots()
        if data is None:  # if we aren't passing in the result of the pulse
            self.send_pulse()
            data = self.send_read(max_dist=max_dist)
        if apply_bandpass:
            data = np.apply_along_axis(das_scan.bandpass, 2, data)
        traces = []
        x = np.arange(data.shape[-1])
        if units == 'meters':
            x = self.idx_to_range(x)
        elif units != 'idx':
            raise ValueError('invalid unit. must be `meters` or `idx`.')
        for i in range(data.shape[0]):
            for j in range(data.shape[1]):
                channel = self.addrs[i][j]
                traces.append(ax.plot(x, data[i, j],
                                      label=f"channel {channel}")[0])
        leg = ax.legend(fancybox=True, shadow=True)
        traced = {}  # will map legend lines to original traces
        for legline, origline in zip(leg.get_lines(), traces):
            legline.set_picker(True)
            legline.set_pickradius(10)
            traced[legline] = origline
        fig.canvas.mpl_connect('pick_event', _on_pick)
        if blocking:
            plt.show()
        else:
            plt.draw()
            plt.pause(0.01)


class ChannelBoard:
    SYNC_PIN = (1 << 3)
    """
    FTDI GPIO pin used for sync (bitmask)
    """

    MSG_LEN = 1024
    """
    ADC read chunk length before crc32 check.
    """

    TOTAL_SAMPLES = 20 * 1024
    """
    16bit samples, so we read double the bytes. needs to be a multiple of the
    chunk size because of the logic surrounding the crc check.
    """
    
    def __init__(self, addr, ftdiurl=URL, freq=400000,
                 muxdac=1, vgadac=0.6):
        """
        ChannelBoard object, used to interact with an individual channel board. 
        Initializing this sets muxdac and vgadac.

        Parameters
        ----------
        addr : integer
            i2c address of the board. cannot be 0 (that is broadcast in i2c).
        ftdiurl : string
            url of the ftdi device. By default, this is set to the first
            channel of any connected ft2232h. See `pyftdi` doc for more
            info. Once pyftdi is installed, run the script `ftdi_urls.py`
            to see options.
        freq : integer
            i2c bus frequency. defaults to high-speed. The sam4s MCUs don't
            officially support a higher frequency, and the bus is marginal
            to begin with, so don't push it.
        muxdac : float
            MUXDAC voltage level. This controls transmit amplitude.
        vgadac : float
            VGA gain voltage level. This controls the VGA gain. Note that the
            VGA is supposed to take a voltage between -.6 and .6V, and we
            accidentally built the system to map the MCU dac directly to the
            gain in. Since the MCU dac can only do .55v min (1/6 of Vref),
            we basically have to set it as low as possible, and for rev1.0
            of the boat channel board, we do not have VGA dac control.
        """
        self.addr = addr
        c = i2c.I2cController()
        c.configure(ftdiurl, frequency=freq, clockstretching=True)
        self.controller = c
        self.port = c.get_port(addr)
        self.write_dacc(muxdac, 0)
        self.write_dacc(vgadac, 1)
        self.gpio = c.get_gpio()
        self.gpio.set_direction(self.SYNC_PIN, self.SYNC_PIN)
        self.gpio.write(self.SYNC_PIN)  # default high

    def send_pulse(self):
        """
        Sends an initial sync pulse to start the pulse, and a second one 1ms
        later to start the ADC capture. We want some delay between the
        two to let the piezo stop ringing before we switch between tx and rx,
        so we achieve this by using a monostable 555 timer between the ftdi and
        sync to get a constant .8ms delay as of 2021-07-17.
        (see `PhasedArray.delay` to get current val)

        On the board side, the MCUs fire on a rising interrupt and start
        receiving on the falling edge.

        The ftdi chip uses GPIO to send a pulse, and as long as every channel
        board is connected to the `sync` bus, they will all recieve it.
        So it doesn't matter what `ChannelBoard` object this method is called
        on.
        """
        self.gpio.write(0)  # clear gpio (sync start on negedge)
        self.gpio.write(self.SYNC_PIN)  # reset
        time.sleep(0.1)    # allow capture to complete

    def reset_bufferidx(self, try_num=0):
        """
        Reset the buffer index so that a subsequent read operation
        starts from the beginning of the capture.
        Try up to 50 times in case we have i2c bus issues.

        Parameters
        ----------
        try_num : integer
            Used in the recursive retry logic to see how many times this has
            been tried. if `try_num>=50` and a `i2c.I2cNackError` is raised,
            this will raise it.
        """
        # reset mcu Transmit Holding Register (THR), reset idx, reset THR again
        # that first THR read is needed in case we haven't performed any reads
        # yet, it fills the THR so that the second read loads the correct byte.
        try:
            self.port.read(1)
            time.sleep(0.1)
            self.port.write(bytes([BoardApi.RESET_BUFFERIDX]))
            time.sleep(0.1)
            self.port.read(1)
            time.sleep(0.1)
        except i2c.I2cNackError:
            print(f"NACK on reset bufferidx from board addr: {self.addr}\n")
            if try_num < 50:
                time.sleep(1)
                print(f"retrying... (try {try_num+1} of 50)")
                self.reset_bufferidx(try_num=try_num+1)
            else:
                raise

    @staticmethod
    def _decode_adc_bytes(bytestring):
        """
        Decode a bytestring read from the ADC's Peripheral DMA
        (only one channel active), uint16_ts w/format LSB, MSB...
        into an array of adc float values.

        This is called by `send_read`, and for normal usage
        is not relevant.

        Parameters
        ----------
        bytestring : bytes object
            raw bytestring coming from i2c read command. Should be an even
            number of bytes, since it describes 2-byte samples.

        Returns
        -------
        values : np.array of floats
            time-series ADC voltage values
        """
        adc_ref = 3.3
        max_val = 0xFFF  # 12 bit max (12 bit ADC)
        array = np.frombuffer(bytestring, dtype='int16')
        values = array.astype('float') / max_val * adc_ref
        return values

    def _read_next_chunk(self):
        """
        Read chunk (size `self.MSG_LEN` bytes) with CRC32 checksum.
        Raises `Exception` if the checksum does not validate.

        This is called by `send_read`, and for normal usage
        is not relevant.

        Returns
        -------
        data : bytes object
            bytes object with `self.MSG_LEN` bytes
        """
        data = self.port.read(self.MSG_LEN)
        checksum_bytes = self.port.read(4)
        rx_checksum = np.frombuffer(checksum_bytes, dtype='uint32')[0]
        calc_checksum = Crc32.calc(data)
        if rx_checksum != calc_checksum:
            raise Exception(f"invalid checksum: 0x{rx_checksum:x} " +
                            f"calculated: 0x{calc_checksum:x} ")
        return data

    def _calc_nbytes(self, amnt=None):
        """
        Calculate the number of bytes will be read.
        Takes into account `None` and chunk-reading logic.
        Useful for pre-initializing arrays internally.

        Parameters
        ----------
        amnt : integer or None
            Byte count requested. if None, defaults to the entire buffer.
            If a custom amount, it will be rounded up to a full chunk size.

        Returns
        -------
        amnt : integer 
            How many bytes to acutally read/will actually be read.
        """
        if amnt is None:
            amnt = self.TOTAL_SAMPLES*2
        if amnt % self.MSG_LEN != 0:
            amnt = min(((amnt // self.MSG_LEN) + 1) * self.MSG_LEN,
                       self.TOTAL_SAMPLES*2)
        return amnt

    def send_read(self, amnt=None, try_num=0):
        """
        Reads `amnt` *bytes* from the ADC buffer. Defaults to entire buffer.

        Parameters
        ----------
        amnt : integer or None
            Byte count requested. if None, defaults to the entire buffer.
            If a custom amount, it will be rounded up to a full chunk size.
        try_num : integer
            Used in the recursive retry logic to see how many times this has
            been tried. if `try_num>=50` and a `i2c.I2cNackError` is raised,
            this will raise it.

        Returns
        -------
        res : np.array
            Decoded time-series data in units of voltage.
        """
        amnt = self._calc_nbytes(amnt)
        try:
            self.reset_bufferidx()
            time.sleep(0.1)
            out = bytes()
            for _ in range(amnt // self.MSG_LEN):
                out += self._read_next_chunk()
            return self._decode_adc_bytes(out)
        except (i2c.I2cNackError, Exception) as e:
            if type(e) == i2c.I2cNackError:
                print(f"NACK on read from board addr: {self.addr}\n")
            else:
                print(f"Error on read: {e}")
            if try_num < 50:
                time.sleep(1)
                print(f"retrying... (try {try_num+1} of 50)")
                res = self.send_read(amnt=amnt, try_num=try_num+1)
                print("read successful.")
                return res
            else:
                raise

    def restart_capture(self):
        """
        Send an i2c command to restart an ADC capture.
        This is for debugging only, the timing is inaccurate!
        (don't restart ADC capture after the pulse w/this)
        """
        self.write(BoardApi.RESTART_CAPTURE)

    def write(self, cmd, try_num=0):
        """
        Write either an integer (e.g. from `BoardApi`) or a `bytes` object
        to the board. On failure, tries 50 times before throwing an error.
        (If `try_num` starts at 0).

        Parameters
        ----------
        cmd : integer or `bytes`
            Pass an integer in (e.g. one from `BoardApi`), or, if multiple
            bytes, a `bytes` object.
        try_num : integer
            Used in the recursive retry logic to see how many times this has
            been tried. if `try_num>=50` and a `i2c.I2cNackError` is raised,
            this will raise it.
        """
        if type(cmd) != bytes:  # accept bytes or single byte as int
            cmd = bytes([cmd])
        try:
            self.port.write(cmd)
        except i2c.I2cNackError:
            print(f"NACK from board addr: {self.addr}\n" +
                  f"writing: {' '.join([str(b) for b in cmd])}")
            if try_num < 50:
                time.sleep(1)
                print(f"retrying... (try {try_num+1} of 50)")
                self.write(cmd, try_num=try_num+1)
                print("write successful.")
            else:
                raise

    def write_dacc(self, value, channel):
        """
        Write a `value` (in volts) to a specified DAC channel on the MCU.
        Throws an error if the value is outside the bounds specified in the
        electrical characteristics section of the SAM4S datasheet.
        Assumes the analog reference is an ideal 3.3 volts.

        Parameters
        ----------
        value: float
            voltage between the adc_ref/6 and 5/6*adc_ref ~(0.55V - 2.75V)
        channel: integer
            channel=0: muxdac (controls level of SKout)
            channel=1: vgadac (controls VGA amplification)
        """
        dac_ref = 3.3
        dac_min = dac_ref/6
        dac_max = dac_ref*(5/6)
        bits = 12
        if not (dac_max >= value >= dac_min):
            raise ValueError(f"DAC value {value} does not fall within DAC" +
                             f"range {dac_min}-{dac_max}")
        scalefactor = (2**bits - 1)/(dac_max - dac_min)
        intval = int((value - dac_min)*scalefactor)
        byteval = intval.to_bytes(4, 'little')  # convert to uint32t_t
        cmd = BoardApi.SET_MUXDAC if channel == 0 else BoardApi.SET_VGADAC
        self.write(bytes([cmd]) + byteval)

    def set_delay(self, us, newapi=True):
        """
        set phase delay [in us] for a transmit. Two boards programmed
        with a different `us` value will start their transmissions
        with that difference, even though the `us` value might not 
        excactly correspond to the delay between the `sync` edge
        and the tx start.

        `newapi=False` is for Tejus' code before the summer of '21

        Parameters
        ----------
        us : float
            The delay w.r.t other boards before starting the pulse tx.
            Accurate to within ~.1 us
        newapi : boolean
            Whether or not to use the phase delay programming sequence
            corresponding to the firmware before Summer 2021, or after.
        """
        step = int(us * (1000 if newapi else 20))  # 50ns or 1ns steps
        if (step > 2 ** 16 - 1) or (step < 0):
            # TODO is this obsolete in newapi???
            raise ValueError("phase delay (in 500ns invervals) must fit " +
                             f"into uint8_t, not be {step}")
        if not newapi:  # tejus' code as of start of summer '21
            b = bytes([BoardApi.SET_DELAY]) + step.to_bytes(2, 'big')
        else:           # 32-bit integer, endianess matching that of mcu
            b = bytes([BoardApi.SET_DELAY]) + step.to_bytes(4, 'little')
        self.write(b)

    def get_vpp(self, maxdist, visualize=False, fname=None):
        """
        Assumes a pulse has been sent and ADC capture performed.
        Sends a read with the amount of bytes corresponding to the
        range preferred in `maxdist` (warning: no checks are done to make sure
        this is not more than 2*TOTAL_SAMPLES) and returns the Vpp measured
        from the signal. If `visualize=True`, plot with matplotlib.

        Note that this calculates range for a signal going one way, not 
        an echo. This is useful for having an external hydrophone connected
        to the rx of a board instead of the piezo.

        The Vpp calculation is performed by taking the difference between
        the the max and min sample in the recieved data. This works well
        for big pulses, but in the case where SNR is small, it might over-
        estimate the Vpp. (There's no constraint for the two sampled points
        to be close in time).

        Parameters
        ----------
        max_dist : float or None
            If given, limit the recieved samples to correspond to some maximum
            range of interest. Helpful to reduce the amount of data transferred
            over the i2c bus (which is slow). Note that because we read 
            in chunks, the maximum distance that the graph corresponds to will
            most likely be longer.
        visualize : bool
            Whether to plot the signal (blocking) with the Vpp calculation
            visualized.
        fname : str or None
            If provided, a filename to log the read to (as a .npy file)

        Returns
        -------
        vpp : float
            peak to peak voltage of the given sampling frame.
        """
        fs = 1e6
        samples = int(maxdist/phaseshifts.speed*fs)  # NOT x2
        adc_data = self.send_read(amnt=2*samples)    # x2 b/c uint16_t -> byte
        if fname is not None:
            np.save(fname, adc_data)
        vpp = np.max(adc_data) - np.min(adc_data)
        if visualize:
            avmax = np.argmax(adc_data)
            avmin = np.argmin(adc_data)
            plt.plot(adc_data)
            plt.title(f"$V_pp$ calculation: {vpp}")
            plt.xlabel("frame index")
            plt.ylabel("adc voltage")
            plt.scatter(avmin, adc_data[avmin], color="red")
            plt.scatter(avmax, adc_data[avmax], color="red")
            # plt.xlim((min(avmin, avmax) - 500, max(avmin, avmax)+500))
            plt.show()
        return vpp


if __name__ == "__main__":
    addr = int(input("ChannelBoard i2c address:"))
    p = ChannelBoard(addr, URL)
    a = PhasedArray()
    print("successfully initialized ChannelBoard `p` and PhasedArray `a`")
