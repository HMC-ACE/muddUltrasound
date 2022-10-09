"""
Alec Vercruysse
2021-06-24

Code to visualize the data produced by a spherical image scan produced by
`das_scan.spherical_scan` with the logging option set.
"""

import glob
import os
import re

import matplotlib.pyplot as plt
import matplotlib.colors
import numpy as np

import image
import i2c_cmd
import das_scan


def get_dataset(path="data/"):
    """
    Let the user choose which dataset to analyze
    """
    datasets = glob.glob(os.path.join(path, "*"))
    datasets.sort()
    for i, data_path in enumerate(datasets):
        print(f"{i:02}: {data_path}")
    selection = input(f"enter selection (default {datasets[-1]})\n> ")
    selection = -1 if selection == '' else int(selection)
    return datasets[selection]


def get_params(fname):
    search = re.search(r"theta=(\d+\.\d+)_phi=(\d+\.\d+)_", fname)
    theta, phi = (float(search[1]), float(search[2]))
    return theta, phi


def view_traces(fname):
    """
    For a specific capture file, view all the traces in the pulse
    as well as the delay and summed result.
    """
    traces = np.load(fname)
    fig, axs = plt.subplots(10, 1)
    for i in range(traces.shape[0]):
        for j in range(traces.shape[1]):
            ax = axs[traces.shape[1]*i + j]
            ax.plot(traces[i, j])
            # ax.set_title(f"single channel: ({i}, {j})")
    theta, phi = get_params(fname)
    echo = image.get_das(traces, theta=theta, phi=phi)
    x = i2c_cmd.PhasedArray.idx_to_range(i2c_cmd.PhasedArray,
                                         np.arange(len(echo)))
    axs[9].plot(x, echo)
    axs[9].set_title(f"delay and summed signal for {theta=}, {phi=}")
    plt.draw()
    plt.pause(0.01)
    return traces, theta, phi


def get_sorted_trace_files(path):
    files = glob.glob(os.path.join(path, "*.npy"))
    files.sort()
    return files


def visualize_scan(dataset):
    files = get_sorted_trace_files(dataset)
    fig = plt.figure()
    ax_main = fig.add_subplot(111, projection='3d')
    ax_main.set_xlabel("x [m]")
    ax_main.set_ylabel("y [m]")
    scatter = ax_main.scatter3D(0, 0, 0, c=0)
    cbar = fig.colorbar(scatter)
    cbar.ax.set_title("peak magnitude")

    results = []
    for fname in files:
        traces = np.load(fname)
        traces = np.apply_along_axis(das_scan.bandpass, 2, traces)  # EXPERIMENTAL
        theta, phi = get_params(fname)
        echo = image.get_das(traces, theta=theta, phi=phi)
        env = das_scan.halfwave_lowpass(echo)
        #peaks = das_scan.find_env_peaks(env, visualize=False)
        peaks = das_scan.find_env_peaks_experimental(env)
        rs = i2c_cmd.PhasedArray.idx_to_range(i2c_cmd.PhasedArray, peaks)
        mags = env[peaks]
        results += list(
                        zip([theta for _ in range(len(rs))],
                            [phi for _ in range(len(rs))], rs, mags))
    r = np.array(results)
    das_scan.plot_cloud(r, ax=ax_main, cbar=cbar)
    return r


def pick_file(files):
    for i, fname in enumerate(files):
        print(f"{i:02}: {fname}")
    selection = input(f"enter selection (default {files[-1]})\n> ")
    selection = -1 if selection == '' else int(selection)
    fname = files[selection]

    traces, theta, phi = view_traces(fname)
    i2c_cmd.PhasedArray.plot_echo(i2c_cmd.PhasedArray,
                                  data=traces, units='idx', blocking=False)
    plt.gca().set_title("Raw ADC traces")
    plt.gca().set_xlabel("sample idx @1Msps")
    plt.gca().set_ylabel("ADC voltage")
    aligned = image.alignsignals(traces, theta=theta, phi=phi)
    i2c_cmd.PhasedArray.plot_echo(i2c_cmd.PhasedArray,
                                  data=aligned, units='idx', blocking=False)
    plt.gca().set_title("Aligned ADC traces")
    plt.gca().set_xlabel("sample idx @1Msps")
    plt.gca().set_ylabel("ADC voltage")
    traces = np.apply_along_axis(das_scan.bandpass, 2, traces)  # EXPERIMENTAL
    echo = image.get_das(traces, theta=theta, phi=phi)
    env = das_scan.halfwave_lowpass(echo)
    fig, ax = plt.subplots()
    das_scan.find_env_peaks(env, visualize=True, ax=ax)
    plt.gca().set_title("Envelope of Delay-and-summed signal")
    plt.gca().set_xlabel("sample idx @1Msps")
    plt.gca().set_ylabel("voltage")



if __name__ == "__main__":
    # plt.ion()
    path = get_dataset()
    files = get_sorted_trace_files(path)
    if input("visualize scan? y/[n]") == "y":
        r = visualize_scan(path)
        # plt.show()
    while len(files) == 0:
        files = get_sorted_trace_files(path)
    idx = 0
    input("continue?")
    while True:
        pick_file(files)
        # print(f"analyzing file {idx=} ({files[idx]})")
        # fname = files[idx]
        # traces, theta, phi = view_traces(fname)
        # traces = np.apply_along_axis(das_scan.bandpass, 2, traces)  # EXPERIMENTAL
        # echo = image.get_das(traces, theta=theta, phi=phi)
        # env = das_scan.halfwave_lowpass(echo)
        # fig, ax = plt.subplots()
        # das_scan.find_env_peaks(env, visualize=True)
        # plt.show()
        
        # files = get_sorted_trace_files(path)
        # if idx+1 < len(files):
        #     idx = idx+1
        # else:
        #     print("at last file.")
