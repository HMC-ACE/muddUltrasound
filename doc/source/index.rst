.. fish-n-chips-array documentation master file, created by
   sphinx-quickstart on Tue Jul 20 15:23:22 2021.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Ultrasonic Phased Array Research Platform Documentation
=======================================================

This is the main page for the documentation of the phased array research platform.

The :ref:`ref-array` page provides an overview of the assembly of the piezoelectric elements.
The :ref:`ref-motherboard` page describes the assembly and wiring of the central board.
The :ref:`ref-channelboard` page describes the assembly and wiring of the channel boards.
The :ref:`ref-flashingboards` page describes how to program the microcontrollers on each channel board.
The :ref:`ref-software` page describes how to connect to the array with the PC and run imaging scripts. It also includes the :ref:`ref-api`.

.. toctree::
   :maxdepth: 2
   :caption: Contents:

   transducer
   motherboard
   channelboard
   flashing_boards
   running_software
   usage


Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`

Building this Documentation
---------------------------

This documentation is built with sphinx. To rebuild the documentation, first ensure that you have a virtual environment with all the required modules for the python scripts. The virtual environment also needs ``sphinx`` and ``sphinx_rtd_theme``. In a terminal with the ``doc`` folder as the working directory, run ``make clean; make html`` to build. All files should appear in ``doc/build``.


