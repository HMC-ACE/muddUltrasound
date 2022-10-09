import numpy as np
import datetime
import time
import sys
import i2c_cmd
import logging
import argparse
from argparse import RawDescriptionHelpFormatter
import matplotlib.pyplot as plt

DEFAULT_FILE_NAME = 'out.csv' # if another name is passed as cmd line arg, this won't be used
ADDR = 8
TOTAL_SAMPLES = 20 * 1024
URL = 'ftdi://ftdi:ft2232h/1' # see pyftdi. in the future we can also use channel 2


def logging_init():
    with open('ft2232h.log', 'w+') as f:
        f.writelines(['---------\n', '---' + str(datetime.datetime.now().ctime()) + '---\n', '---------\n'])
    logging.basicConfig(filename="ft2232h.log", level=logging.DEBUG)
    logging.log(logging.DEBUG, f'using ftdi URL: {URL}')


def parse_args():
    """
    TODO: create arguments like sample size and other stuff
    """
    desc = "Access the SPI bus using the ft2232h, and read the contents of and ADC capture."
    epilog = "Alec Vercruysse 2021-04-29\navercruysse [at] hmc.edu"
    parser = argparse.ArgumentParser(description=desc, epilog=epilog, formatter_class=RawDescriptionHelpFormatter)
    parser.add_argument("file",  default=DEFAULT_FILE_NAME, help=f'output file name, defaults to `{DEFAULT_FILE_NAME}`')
    parser.add_argument('-n', '--new', dest='new_capture', action='store_true', default=False, help='Perform new ADC capture first')
    parser.add_argument('-a', '--address', dest='addr', default=ADDR, help=f"i2c address. default: {ADDR}")
    return parser.parse_args()


def main():
    logging_init()
    args = parse_args()
    logging.debug(f"outputting to given file: {args.file}, using addr {args.addr}")
    board = i2c_cmd.ChannelBoard(args.addr)

    if args.new_capture:
        logging.info("starting new ADC capture, waiting 1s")
        print("starting new capture...")
        board.restart_capture()
        time.sleep(.1) # todo: be smarter. I know the ft2232h and pyftdi allow for gpio access, could use extraio to say when capture is complete
        print("done.")
    
    print(f'Sending set bufferidx=0 cmd to 0x{ADDR:x}')
    board.reset_bufferidx()

    print(f'Sending read command size {TOTAL_SAMPLES*2} to 0x{ADDR:x}:')
    array = board.send_read(amnt=TOTAL_SAMPLES*2) # *2 since 2 bytes per sample
    np.savetxt(args.file, array, delimiter=",")
    plt.plot(array)
    plt.title("ADC output (1Mhz sample)")
    plt.xlim([0, 2000])
    plt.xlabel("sample index")
    plt.ylabel("Voltage [V]")
    plt.show()
    return array


def get_vpp(adc_data, visualize=False):
    if not visualize:
        return np.max(adc_data) - np.min(adc_data)
    else:
        avmax = np.argmax(adc_data)
        avmin = np.argmin(adc_data)
        plt.plot(adc_data)
        plt.title("$V_{pp}$ calculation")
        plt.xlabel("frame index")
        plt.ylabel("adc voltage")
        plt.scatter(avmin, adc_data[avmin], color="red")
        plt.scatter(avmax, adc_data[avmax], color="red")
        plt.xlim((min(avmin, avmax) - 500, max(avmin, avmax)+500))

if __name__ == '__main__':
    adc_data = main()
