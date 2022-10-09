import math
import numpy as np
import pdb

f = 92000
speed = 1484.
wv = speed/f

dy = 0.01613
dx = 0.01613


def angles(x, y, z):
    """
    ISO 80000-2:2019 convention:
    theta is angle w.r.t. z-axis, goes from 0 - 90 deg in our case.
    phi is angle from x-axis rotating towards y-axis, 0 - 360 deg.

    returns degrees
    TODO: change `phaseshifts` and all fn's that use it
        to use radians!
    """
    phi = math.atan2(y, x) * 180/math.pi
    project_xy = math.sqrt(x**2 + y**2)
    theta = math.atan2(project_xy, z) * 180/math.pi
    return [theta, phi]


def phaseshifts(x=None, y=None, z=None,
                theta=None, phi=None,
                alpha=None, beta=None, debug=False):
    """
    phaseshifts in us. Input angles in radians or x,y,z in meters.

    Note that, when behind the array looking outwards (broadside)
    the positive x-axis is to the right. Therefore, by the right-hand rule,
    the positive y-axis is *down*.
    Our matplotlib plots reflect this intuitively.
    """
    if x is not None and y is not None and z is not None:
        [theta, phi] = angles(x, y, z)
        # directional `sine` w.r.t x-axis
        sinalpha = math.sin(math.radians(theta)) * math.cos(math.radians(phi))
        # directional `sine` w.r.t y-axis
        sinbeta = math.sin(math.radians(theta)) * math.sin(math.radians(phi))
    elif theta is not None and phi is not None:
        # directional `sine` w.r.t x-axis
        sinalpha = math.sin(theta) * math.cos(phi)
        # directional `sine` w.r.t y-axis
        sinbeta = math.sin(theta) * math.sin(phi)
    elif alpha is not None and beta is not None:
        sinalpha = alpha
        sinbeta = beta
    else:
        raise TypeError("needs (x, y, z) or, as kwargs, " +
                        "(theta, phi) or (alpha, beta)")

    phix = (360/wv)*dx*sinalpha  # phase shift in degrees
    phiy = (360/wv)*dy*sinbeta   # phase shift in degrees

    shifts = np.zeros((3, 3))    # in degrees
    for row in range(3):
        for col in range(3):
            shifts[row, col] = row*phiy + col*phix

    shifts = shifts/360 * 1/f  # seconds
    shifts /= 1e-6             # us

    if np.min(shifts) < 0:
        shifts -= np.min(shifts)

    if debug:
        print(shifts)

    return shifts

if __name__ == "__main__":
    print(phaseshifts(-.1, 0, .8))
