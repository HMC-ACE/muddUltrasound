import numpy as np
import phaseshifts
import matplotlib.pyplot as plt
from scipy.signal import hilbert, resample

import i2c_cmd


def alignsignals(signals, x=None, y=None, z=None, theta=None, phi=None,
                 alpha=None, beta=None, fs=1e6):
    sr = 1e6
    resample_factor = 10
    multiplier = resample_factor * fs/sr  # can change the sampling rate
    upsampled = resample(signals, resample_factor*signals.shape[2], axis=2)
    shifts = -(phaseshifts.phaseshifts(x, y, z, theta, phi,
                                       alpha, beta)*multiplier).astype(int)
    shifts -= np.min(shifts)  # make all shifts positive again

    max_shift = np.max(shifts).astype(int)  # most shifted element shift
    new_length = np.size(upsampled, axis=2) - max_shift  # size of new signal array

    aligned = np.empty((3, 3, new_length))

    for row in range(3):
        for col in range(3):
            delay = shifts[row][col]
            end = new_length + delay

            if (end == 0):
                aligned[row][col] = upsampled[row][col][delay:]  # for the already short signal

            aligned[row][col] = upsampled[row][col][delay:end]  # cuts signal by delay and additiona;

    downsampled = resample(aligned, signals.shape[2], axis=2)

    return downsampled  # aligned


def delaysum(aligned):
    tot = np.zeros(np.size(aligned, axis=2))
    for element in aligned:
        for i in element:
            tot += i
    return tot / (aligned.shape[0]*aligned.shape[1])


# def signalplot(total_signal):
#     total_signal = np.abs(hilbert(total_signal)) # envelope of signal, 4 frequencies?
#     plt.plot(total_signal)
#     plt.show()


# def get_image(fs, x, y, z, signals):
#     aligned = alignsignals(fs, x, y, z, signals)
#     total_signal = delaysum(aligned)
#     signalplot(total_signal)


if __name__ == "__main__":
    fs = 1e6
    x = y = 0
    z = 0.8

    a = i2c_cmd.PhasedArray()
    a.aim_beam(x, y, z)
    a.send_pulse()
    signals = a.send_read(max_dist=2)  # 2m max distance (reduce i2c time)
    a.plot_echo(data=signals)

    #get_image(fs, x, y, z, signals)


def get_das(signals, x=None, y=None, z=None,
            theta=None, phi=None,
            alpha=None, beta=None, fs=1e6):
    aligned = alignsignals(signals, x=x, y=y, z=z, theta=theta, phi=phi,
                           alpha=alpha, beta=beta, fs=fs)
    total_signal = delaysum(aligned)
    # if visualize:
    #     signalplot(total_signal)
    return total_signal
