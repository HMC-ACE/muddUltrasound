.. _ref-motherboard:

===========
Motherboard
===========


This section contains information about the central board, or motherboard, used to route TX signals to and RX signals from the transducer array. This section contains the KiCAD PCB files as well as Gerber fabrication outputs for manufacturing these boards. The Bill-of-Materials spreadsheet is also included.

File Structure
--------------

.. code:: text

  - pcb/
    - center-board/
      - BOM.xlsx             <- Bill of Materials
      - BoatCentralboard.pro <- main KiCad 5 project file 
      - BoatCentralBoard.*   <- misc KiCad 5 project files
      - fp-lib-table         <- KiCad project footprint library location table
      - sym-lib-table        <- KiCad project symbol library location table
      - Fabrication Files/   <- GERBER files for fabrication


Board Overview
--------------

.. figure:: figs/motherboard.jpg
  :width: 800
  :alt: Picture of the motherboard calling out features

  Picture of the Motherboard
          
The central board hosts a Microchip HV2808 32-channel high-voltage analog switch. This device acts as a TX / RX switch to isolate the TX and RX analog front ends during their respective operations. This board breaks out the HV2808 into 32 ports, enabling a 16 channel TX / RX switch. The other components on this board are a 3.3V voltage regulator and power supply decoupling.

.. note::
   Note that the board pictured does not have all components soldered. Only connections for channels 0 through 8 were populated since this was used for a 9 channel (3x3) transducer array.

.. note::
   Note that the rework visible on the board pictured was due to an incorrect voltage regulator footprint, which has since been updated in the PCB files.

Connections
-----------

The RX connections use vertical-launch female BNC ports to improve signal integrity, while the TX connections use side-launch screw terminals. Connections between the TX screw terminals on the channel boards and this central board were made with twisted pairs of 22 AWG solid-core wire. Other connectors include the screw terminal bank for connecting to the piezoelectric transducer array and banana ports for positive and negative 40V rails, and ground. The ±40V and ground rails should be linked to the same power rails as the channel board. Additionally, the screw terminal labeled “A/B” is the logic input for switching the HV2808 conduction path. It’s compatible with a 3.3V signal from the channel microcontrollers.

All channel boards contain connections to output the A/B switching signal to the central board, but only one must be connected. This is nominally channel 0. Connection between the channel 0 board and central board A/B terminal is done over a twisted pair of 22 AWG solid-core wire.


Soldering Instructions
----------------------

If using solder paste with or without a stencil, we recommend soldering the surface-mount components before the larger through-hole connectors. Ensure connections on the QFN-package HV2808 are not shorted. Perform rework as necessary before proceeding to soldering the through-hole components.

-- Tejus Rao
