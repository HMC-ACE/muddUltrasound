EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Center Board"
Date ""
Rev "v2.0"
Comp "HMC-ACE"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L BoatCentralBoard:HV2808-microchipHV2808 U1
U 1 1 5DB54CBB
P 5150 5925
F 0 "U1" H 5050 6100 50  0000 L CNN
F 1 "HV2808" H 4950 5975 50  0000 L CNN
F 2 "Package_DFN_QFN:QFN-56-1EP_8x8mm_P0.5mm_EP4.5x5.2mm" H 5950 4875 50  0001 C CNN
F 3 "" H 5950 4875 50  0001 C CNN
	1    5150 5925
	1    0    0    -1  
$EndComp
Text GLabel 1375 650  2    50   Input ~ 0
0SW0
Text GLabel 3975 5375 0    50   Input ~ 0
0Y2829
Text GLabel 3975 5475 0    50   Input ~ 0
0SW29
Text GLabel 3975 6275 0    50   Input ~ 0
0SW0
Text GLabel 3975 5575 0    50   Input ~ 0
0SW30
Text GLabel 3975 5675 0    50   Input ~ 0
0Y3031
Text GLabel 3975 5775 0    50   Input ~ 0
0SW31
Text GLabel 3975 5975 0    50   Input ~ 0
VDD
Text GLabel 3975 6075 0    50   Input ~ 0
AB
Text GLabel 3975 6175 0    50   Input ~ 0
GND
Text GLabel 3975 6375 0    50   Input ~ 0
0Y01
Text GLabel 3975 6475 0    50   Input ~ 0
0SW1
Text GLabel 3975 6575 0    50   Input ~ 0
0SW2
Text GLabel 3975 6675 0    50   Input ~ 0
0Y23
Text GLabel 4450 7150 3    50   Input ~ 0
0SW3
Text GLabel 4550 7150 3    50   Input ~ 0
0SW4
Text GLabel 4650 7150 3    50   Input ~ 0
0Y45
Text GLabel 4750 7150 3    50   Input ~ 0
0SW5
Text GLabel 4850 7150 3    50   Input ~ 0
0SW6
Text GLabel 4950 7150 3    50   Input ~ 0
0Y67
Text GLabel 5050 7150 3    50   Input ~ 0
0SW7
Text GLabel 5150 7150 3    50   Input ~ 0
0SW8
Text GLabel 5250 7150 3    50   Input ~ 0
0Y89
Text GLabel 5350 7150 3    50   Input ~ 0
0SW9
Text GLabel 5450 7150 3    50   Input ~ 0
0SW10
Text GLabel 5550 7150 3    50   Input ~ 0
0Y1011
Text GLabel 5650 7150 3    50   Input ~ 0
0SW11
Text GLabel 5750 7150 3    50   Input ~ 0
0SW12
Text GLabel 5750 4775 1    50   Input ~ 0
0SW19
Text GLabel 5650 4775 1    50   Input ~ 0
0SW20
Text GLabel 5550 4775 1    50   Input ~ 0
0Y2021
Text GLabel 5450 4775 1    50   Input ~ 0
0SW21
Text GLabel 5350 4775 1    50   Input ~ 0
0SW22
Text GLabel 5250 4775 1    50   Input ~ 0
0Y2223
Text GLabel 5150 4775 1    50   Input ~ 0
0SW23
Text GLabel 5050 4775 1    50   Input ~ 0
0SW24
Text GLabel 4950 4775 1    50   Input ~ 0
0Y2425
Text GLabel 4850 4775 1    50   Input ~ 0
0SW25
Text GLabel 4750 4775 1    50   Input ~ 0
0SW26
Text GLabel 4650 4775 1    50   Input ~ 0
0Y2627
Text GLabel 4550 4775 1    50   Input ~ 0
0SW27
Text GLabel 4450 4775 1    50   Input ~ 0
0SW28
Text GLabel 9500 1775 0    50   Output ~ 0
0Y01
Text GLabel 9500 1875 0    50   Input ~ 0
GND
Text GLabel 9500 1975 0    50   Output ~ 0
0Y23
Text GLabel 9500 2075 0    50   Input ~ 0
GND
Text GLabel 9500 2175 0    50   Output ~ 0
0Y45
Text GLabel 9500 2275 0    50   Input ~ 0
GND
Text GLabel 9500 2375 0    50   Output ~ 0
0Y67
Text GLabel 9500 2475 0    50   Input ~ 0
GND
Text GLabel 9500 2650 0    50   Output ~ 0
0Y89
Text GLabel 9500 2750 0    50   Input ~ 0
GND
Text GLabel 9500 3925 0    50   Output ~ 0
0Y2021
Text GLabel 9500 4025 0    50   Input ~ 0
GND
Text GLabel 9500 4125 0    50   Output ~ 0
0Y2223
Text GLabel 9500 4400 0    50   Output ~ 0
0Y2425
Text GLabel 9500 4225 0    50   Input ~ 0
GND
Text GLabel 9500 4500 0    50   Input ~ 0
GND
Text GLabel 9500 4600 0    50   Output ~ 0
0Y2627
Text GLabel 9500 4700 0    50   Input ~ 0
GND
Text GLabel 9500 4800 0    50   Output ~ 0
0Y2829
Text GLabel 9500 4900 0    50   Input ~ 0
GND
Text GLabel 9500 5000 0    50   Output ~ 0
0Y3031
Text GLabel 9500 5100 0    50   Input ~ 0
GND
Wire Wire Line
	5175 2350 5375 2350
Connection ~ 5175 2350
Wire Wire Line
	5175 2400 5175 2350
Wire Wire Line
	4825 2350 5175 2350
$Comp
L Device:C C4
U 1 1 5DC83950
P 5175 2550
F 0 "C4" H 5300 2600 50  0000 L CNN
F 1 "0.1μF" H 5300 2500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5213 2400 50  0001 C CNN
F 3 "~" H 5175 2550 50  0001 C CNN
	1    5175 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5DC82526
P 5525 2350
F 0 "R1" V 5325 2350 50  0000 C CNN
F 1 "1k" V 5409 2350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5455 2350 50  0001 C CNN
F 3 "~" H 5525 2350 50  0001 C CNN
	1    5525 2350
	0    1    1    0   
$EndComp
Text GLabel 5475 1550 2    50   Input ~ 0
VNN
Text GLabel 5175 1850 3    50   Input ~ 0
GND
$Comp
L Device:C C3
U 1 1 5DC7E272
P 5175 1700
F 0 "C3" H 5325 1725 50  0000 C CNN
F 1 "0.1μF" H 5400 1625 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5213 1550 50  0001 C CNN
F 3 "~" H 5175 1700 50  0001 C CNN
	1    5175 1700
	1    0    0    -1  
$EndComp
Text GLabel 9500 5725 0    50   Input ~ 0
AB
Text GLabel 5675 2350 2    50   Input ~ 0
VDD
Text GLabel 8000 2725 1    50   Input ~ 0
GND
Text GLabel 6875 2550 0    50   Input ~ 0
-40V
$Comp
L BoatCentralBoard:LM2936HVBMAX3.3 U2
U 1 1 5DEC5268
P 7825 1850
F 0 "U2" H 7825 2175 50  0000 C CNN
F 1 "LM2936HVBMAX-3.3" H 7825 2100 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 7825 2075 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm2936.pdf" H 7825 1800 50  0001 C CNN
	1    7825 1850
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5DEC9531
P 8675 1900
F 0 "C7" H 8500 1875 50  0000 C CNN
F 1 "47uF" H 8475 1950 50  0000 C CNN
F 2 "BoatCentralBoard:47uFBypass" H 8713 1750 50  0001 C CNN
F 3 "~" H 8675 1900 50  0001 C CNN
	1    8675 1900
	-1   0    0    1   
$EndComp
$Comp
L Device:C C6
U 1 1 5DECE693
P 6925 1900
F 0 "C6" H 6625 1925 50  0000 L CNN
F 1 "0.1uF" H 6600 1850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6963 1750 50  0001 C CNN
F 3 "~" H 6925 1900 50  0001 C CNN
	1    6925 1900
	1    0    0    -1  
$EndComp
Text GLabel 6775 1750 0    50   Input ~ 0
+40V
Text GLabel 8825 1750 2    50   Input ~ 0
3.3
$Comp
L power:GND #PWR020
U 1 1 5DED1C17
P 8475 2050
F 0 "#PWR020" H 8475 1800 50  0001 C CNN
F 1 "GND" H 8480 1877 50  0000 C CNN
F 2 "" H 8475 2050 50  0001 C CNN
F 3 "" H 8475 2050 50  0001 C CNN
	1    8475 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR021
U 1 1 5DED2632
P 8675 2050
F 0 "#PWR021" H 8675 1800 50  0001 C CNN
F 1 "GND" H 8680 1877 50  0000 C CNN
F 2 "" H 8675 2050 50  0001 C CNN
F 3 "" H 8675 2050 50  0001 C CNN
	1    8675 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR019
U 1 1 5DED2FF9
P 8000 2725
F 0 "#PWR019" H 8000 2475 50  0001 C CNN
F 1 "GND" V 8005 2597 50  0000 R CNN
F 2 "" H 8000 2725 50  0001 C CNN
F 3 "" H 8000 2725 50  0001 C CNN
	1    8000 2725
	1    0    0    -1  
$EndComp
Text GLabel 4825 2350 0    50   Input ~ 0
3.3
Text GLabel 1375 1000 2    50   Input ~ 0
0SW1
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 5DEE3EA4
P 1175 750
F 0 "J1" H 1300 650 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 1093 516 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1175 750 50  0001 C CNN
F 3 "~" H 1175 750 50  0001 C CNN
	1    1175 750 
	-1   0    0    1   
$EndComp
Text GLabel 1375 750  2    50   Input ~ 0
GND
$Comp
L Connector:Conn_Coaxial J2
U 1 1 5DEE5BD6
P 1175 1000
F 0 "J2" H 1275 1050 50  0000 L CNN
F 1 "Conn_Coaxial" H 1275 973 50  0001 L CNN
F 2 "BoatCentralBoard:BNC_Vertical_Custom" H 1175 1000 50  0001 C CNN
F 3 " ~" H 1175 1000 50  0001 C CNN
	1    1175 1000
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5DEE8608
P 1175 1200
F 0 "#PWR01" H 1175 950 50  0001 C CNN
F 1 "GND" H 1025 1150 50  0000 C CNN
F 2 "" H 1175 1200 50  0001 C CNN
F 3 "" H 1175 1200 50  0001 C CNN
	1    1175 1200
	1    0    0    -1  
$EndComp
Text GLabel 1375 1475 2    50   Input ~ 0
0SW2
Text GLabel 1375 1825 2    50   Input ~ 0
0SW3
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 5DEEA648
P 1175 1575
F 0 "J3" H 1300 1450 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 1093 1341 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1175 1575 50  0001 C CNN
F 3 "~" H 1175 1575 50  0001 C CNN
	1    1175 1575
	-1   0    0    1   
$EndComp
Text GLabel 1375 1575 2    50   Input ~ 0
GND
$Comp
L Connector:Conn_Coaxial J4
U 1 1 5DEEA64F
P 1175 1825
F 0 "J4" H 1275 1875 50  0000 L CNN
F 1 "Conn_Coaxial" H 1275 1798 50  0001 L CNN
F 2 "BoatCentralBoard:BNC_Vertical_Custom" H 1175 1825 50  0001 C CNN
F 3 " ~" H 1175 1825 50  0001 C CNN
	1    1175 1825
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5DEEA655
P 1175 2025
F 0 "#PWR02" H 1175 1775 50  0001 C CNN
F 1 "GND" H 1025 1975 50  0000 C CNN
F 2 "" H 1175 2025 50  0001 C CNN
F 3 "" H 1175 2025 50  0001 C CNN
	1    1175 2025
	1    0    0    -1  
$EndComp
Text GLabel 1375 2300 2    50   Input ~ 0
0SW4
Text GLabel 1375 2675 2    50   Input ~ 0
0SW5
$Comp
L Connector:Screw_Terminal_01x02 J5
U 1 1 5DEEB646
P 1175 2400
F 0 "J5" H 1300 2300 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 1093 2166 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1175 2400 50  0001 C CNN
F 3 "~" H 1175 2400 50  0001 C CNN
	1    1175 2400
	-1   0    0    1   
$EndComp
Text GLabel 1375 2400 2    50   Input ~ 0
GND
$Comp
L Connector:Conn_Coaxial J6
U 1 1 5DEEB64D
P 1175 2675
F 0 "J6" H 1275 2725 50  0000 L CNN
F 1 "Conn_Coaxial" H 1275 2648 50  0001 L CNN
F 2 "BoatCentralBoard:BNC_Vertical_Custom" H 1175 2675 50  0001 C CNN
F 3 " ~" H 1175 2675 50  0001 C CNN
	1    1175 2675
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5DEEB653
P 1175 2875
F 0 "#PWR03" H 1175 2625 50  0001 C CNN
F 1 "GND" H 1025 2825 50  0000 C CNN
F 2 "" H 1175 2875 50  0001 C CNN
F 3 "" H 1175 2875 50  0001 C CNN
	1    1175 2875
	1    0    0    -1  
$EndComp
Text GLabel 1375 3150 2    50   Input ~ 0
0SW6
Text GLabel 1375 3525 2    50   Input ~ 0
0SW7
$Comp
L Connector:Screw_Terminal_01x02 J7
U 1 1 5DEEC686
P 1175 3250
F 0 "J7" H 1300 3150 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 1093 3016 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1175 3250 50  0001 C CNN
F 3 "~" H 1175 3250 50  0001 C CNN
	1    1175 3250
	-1   0    0    1   
$EndComp
Text GLabel 1375 3250 2    50   Input ~ 0
GND
$Comp
L Connector:Conn_Coaxial J8
U 1 1 5DEEC68D
P 1175 3525
F 0 "J8" H 1275 3575 50  0000 L CNN
F 1 "Conn_Coaxial" H 1275 3498 50  0001 L CNN
F 2 "BoatCentralBoard:BNC_Vertical_Custom" H 1175 3525 50  0001 C CNN
F 3 " ~" H 1175 3525 50  0001 C CNN
	1    1175 3525
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5DEEC693
P 1175 3725
F 0 "#PWR04" H 1175 3475 50  0001 C CNN
F 1 "GND" H 1025 3675 50  0000 C CNN
F 2 "" H 1175 3725 50  0001 C CNN
F 3 "" H 1175 3725 50  0001 C CNN
	1    1175 3725
	1    0    0    -1  
$EndComp
Text GLabel 1375 4000 2    50   Input ~ 0
0SW8
Text GLabel 1375 4375 2    50   Input ~ 0
0SW9
$Comp
L Connector:Screw_Terminal_01x02 J9
U 1 1 5DEEDD62
P 1175 4100
F 0 "J9" H 1300 4000 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 1093 3866 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1175 4100 50  0001 C CNN
F 3 "~" H 1175 4100 50  0001 C CNN
	1    1175 4100
	-1   0    0    1   
$EndComp
Text GLabel 1375 4100 2    50   Input ~ 0
GND
$Comp
L Connector:Conn_Coaxial J10
U 1 1 5DEEDD69
P 1175 4375
F 0 "J10" H 1275 4425 50  0000 L CNN
F 1 "Conn_Coaxial" H 1275 4348 50  0001 L CNN
F 2 "BoatCentralBoard:BNC_Vertical_Custom" H 1175 4375 50  0001 C CNN
F 3 " ~" H 1175 4375 50  0001 C CNN
	1    1175 4375
	-1   0    0    -1  
$EndComp
Text GLabel 2575 650  2    50   Input ~ 0
0SW16
Text GLabel 2575 1000 2    50   Input ~ 0
0SW17
$Comp
L Connector:Screw_Terminal_01x02 J17
U 1 1 5DF22565
P 2375 750
F 0 "J17" H 2525 650 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 2293 516 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2375 750 50  0001 C CNN
F 3 "~" H 2375 750 50  0001 C CNN
	1    2375 750 
	-1   0    0    1   
$EndComp
Text GLabel 2575 750  2    50   Input ~ 0
GND
$Comp
L Connector:Conn_Coaxial J18
U 1 1 5DF2256C
P 2375 1000
F 0 "J18" H 2475 1050 50  0000 L CNN
F 1 "Conn_Coaxial" H 2475 973 50  0001 L CNN
F 2 "BoatCentralBoard:BNC_Vertical_Custom" H 2375 1000 50  0001 C CNN
F 3 " ~" H 2375 1000 50  0001 C CNN
	1    2375 1000
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5DF22572
P 2375 1200
F 0 "#PWR09" H 2375 950 50  0001 C CNN
F 1 "GND" H 2225 1150 50  0000 C CNN
F 2 "" H 2375 1200 50  0001 C CNN
F 3 "" H 2375 1200 50  0001 C CNN
	1    2375 1200
	1    0    0    -1  
$EndComp
Text GLabel 2575 1475 2    50   Input ~ 0
0SW18
Text GLabel 2575 1825 2    50   Input ~ 0
0SW19
$Comp
L Connector:Screw_Terminal_01x02 J19
U 1 1 5DF2257A
P 2375 1575
F 0 "J19" H 2525 1450 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 2500 1375 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2375 1575 50  0001 C CNN
F 3 "~" H 2375 1575 50  0001 C CNN
	1    2375 1575
	-1   0    0    1   
$EndComp
Text GLabel 2575 1575 2    50   Input ~ 0
GND
$Comp
L Connector:Conn_Coaxial J20
U 1 1 5DF22581
P 2375 1825
F 0 "J20" H 2475 1875 50  0000 L CNN
F 1 "Conn_Coaxial" H 2475 1798 50  0001 L CNN
F 2 "BoatCentralBoard:BNC_Vertical_Custom" H 2375 1825 50  0001 C CNN
F 3 " ~" H 2375 1825 50  0001 C CNN
	1    2375 1825
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5DF22587
P 2375 2025
F 0 "#PWR010" H 2375 1775 50  0001 C CNN
F 1 "GND" H 2225 1975 50  0000 C CNN
F 2 "" H 2375 2025 50  0001 C CNN
F 3 "" H 2375 2025 50  0001 C CNN
	1    2375 2025
	1    0    0    -1  
$EndComp
Text GLabel 2575 2300 2    50   Input ~ 0
0SW20
Text GLabel 2575 2675 2    50   Input ~ 0
0SW21
$Comp
L Connector:Screw_Terminal_01x02 J21
U 1 1 5DF2258F
P 2375 2400
F 0 "J21" H 2525 2300 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 2293 2166 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2375 2400 50  0001 C CNN
F 3 "~" H 2375 2400 50  0001 C CNN
	1    2375 2400
	-1   0    0    1   
$EndComp
Text GLabel 2575 2400 2    50   Input ~ 0
GND
$Comp
L Connector:Conn_Coaxial J22
U 1 1 5DF22596
P 2375 2675
F 0 "J22" H 2475 2725 50  0000 L CNN
F 1 "Conn_Coaxial" H 2475 2648 50  0001 L CNN
F 2 "BoatCentralBoard:BNC_Vertical_Custom" H 2375 2675 50  0001 C CNN
F 3 " ~" H 2375 2675 50  0001 C CNN
	1    2375 2675
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5DF2259C
P 2375 2875
F 0 "#PWR011" H 2375 2625 50  0001 C CNN
F 1 "GND" H 2225 2825 50  0000 C CNN
F 2 "" H 2375 2875 50  0001 C CNN
F 3 "" H 2375 2875 50  0001 C CNN
	1    2375 2875
	1    0    0    -1  
$EndComp
Text GLabel 2575 3150 2    50   Input ~ 0
0SW22
Text GLabel 2575 3525 2    50   Input ~ 0
0SW23
$Comp
L Connector:Screw_Terminal_01x02 J23
U 1 1 5DF225A4
P 2375 3250
F 0 "J23" H 2525 3125 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 2525 3025 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2375 3250 50  0001 C CNN
F 3 "~" H 2375 3250 50  0001 C CNN
	1    2375 3250
	-1   0    0    1   
$EndComp
Text GLabel 2575 3250 2    50   Input ~ 0
GND
$Comp
L Connector:Conn_Coaxial J24
U 1 1 5DF225AB
P 2375 3525
F 0 "J24" H 2475 3575 50  0000 L CNN
F 1 "Conn_Coaxial" H 2475 3498 50  0001 L CNN
F 2 "BoatCentralBoard:BNC_Vertical_Custom" H 2375 3525 50  0001 C CNN
F 3 " ~" H 2375 3525 50  0001 C CNN
	1    2375 3525
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5DF225B1
P 2375 3725
F 0 "#PWR012" H 2375 3475 50  0001 C CNN
F 1 "GND" H 2225 3675 50  0000 C CNN
F 2 "" H 2375 3725 50  0001 C CNN
F 3 "" H 2375 3725 50  0001 C CNN
	1    2375 3725
	1    0    0    -1  
$EndComp
Text GLabel 2575 4000 2    50   Input ~ 0
0SW24
Text GLabel 2575 4400 2    50   Input ~ 0
0SW25
$Comp
L Connector:Screw_Terminal_01x02 J25
U 1 1 5DF225B9
P 2375 4100
F 0 "J25" H 2500 4000 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 2293 3866 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2375 4100 50  0001 C CNN
F 3 "~" H 2375 4100 50  0001 C CNN
	1    2375 4100
	-1   0    0    1   
$EndComp
Text GLabel 2575 4100 2    50   Input ~ 0
GND
$Comp
L Connector:Conn_Coaxial J26
U 1 1 5DF225C0
P 2375 4400
F 0 "J26" H 2475 4450 50  0000 L CNN
F 1 "Conn_Coaxial" H 2475 4373 50  0001 L CNN
F 2 "BoatCentralBoard:BNC_Vertical_Custom" H 2375 4400 50  0001 C CNN
F 3 " ~" H 2375 4400 50  0001 C CNN
	1    2375 4400
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5DF225C6
P 2375 4600
F 0 "#PWR013" H 2375 4350 50  0001 C CNN
F 1 "GND" H 2225 4550 50  0000 C CNN
F 2 "" H 2375 4600 50  0001 C CNN
F 3 "" H 2375 4600 50  0001 C CNN
	1    2375 4600
	1    0    0    -1  
$EndComp
Text GLabel 2575 4900 2    50   Input ~ 0
0SW26
Text GLabel 2575 5275 2    50   Input ~ 0
0SW27
$Comp
L Connector:Screw_Terminal_01x02 J27
U 1 1 5DF2BB47
P 2375 5000
F 0 "J27" H 2525 4900 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 2293 4766 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2375 5000 50  0001 C CNN
F 3 "~" H 2375 5000 50  0001 C CNN
	1    2375 5000
	-1   0    0    1   
$EndComp
Text GLabel 2575 5000 2    50   Input ~ 0
GND
$Comp
L Connector:Conn_Coaxial J28
U 1 1 5DF2BB4E
P 2375 5275
F 0 "J28" H 2475 5325 50  0000 L CNN
F 1 "Conn_Coaxial" H 2475 5248 50  0001 L CNN
F 2 "BoatCentralBoard:BNC_Vertical_Custom" H 2375 5275 50  0001 C CNN
F 3 " ~" H 2375 5275 50  0001 C CNN
	1    2375 5275
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5DF2BB54
P 2375 5475
F 0 "#PWR014" H 2375 5225 50  0001 C CNN
F 1 "GND" H 2225 5425 50  0000 C CNN
F 2 "" H 2375 5475 50  0001 C CNN
F 3 "" H 2375 5475 50  0001 C CNN
	1    2375 5475
	1    0    0    -1  
$EndComp
Text GLabel 2600 5800 2    50   Input ~ 0
0SW28
Text GLabel 2600 6225 2    50   Input ~ 0
0SW29
$Comp
L Connector:Screw_Terminal_01x02 J29
U 1 1 5DF2BB5C
P 2400 5900
F 0 "J29" H 2550 5800 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 2318 5666 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2400 5900 50  0001 C CNN
F 3 "~" H 2400 5900 50  0001 C CNN
	1    2400 5900
	-1   0    0    1   
$EndComp
Text GLabel 2600 5900 2    50   Input ~ 0
GND
$Comp
L Connector:Conn_Coaxial J30
U 1 1 5DF2BB63
P 2400 6225
F 0 "J30" H 2500 6275 50  0000 L CNN
F 1 "Conn_Coaxial" H 2500 6198 50  0001 L CNN
F 2 "BoatCentralBoard:BNC_Vertical_Custom" H 2400 6225 50  0001 C CNN
F 3 " ~" H 2400 6225 50  0001 C CNN
	1    2400 6225
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5DF2BB69
P 2400 6425
F 0 "#PWR015" H 2400 6175 50  0001 C CNN
F 1 "GND" H 2250 6375 50  0000 C CNN
F 2 "" H 2400 6425 50  0001 C CNN
F 3 "" H 2400 6425 50  0001 C CNN
	1    2400 6425
	1    0    0    -1  
$EndComp
Text GLabel 1375 6800 2    50   Input ~ 0
0SW14
Text GLabel 1375 7250 2    50   Input ~ 0
0SW15
$Comp
L Connector:Screw_Terminal_01x02 J15
U 1 1 5DF2BB71
P 1175 6900
F 0 "J15" H 1325 6800 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 1093 6666 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1175 6900 50  0001 C CNN
F 3 "~" H 1175 6900 50  0001 C CNN
	1    1175 6900
	-1   0    0    1   
$EndComp
Text GLabel 1375 6900 2    50   Input ~ 0
GND
$Comp
L Connector:Conn_Coaxial J16
U 1 1 5DF2BB78
P 1175 7250
F 0 "J16" H 1275 7300 50  0000 L CNN
F 1 "Conn_Coaxial" H 1275 7223 50  0001 L CNN
F 2 "BoatCentralBoard:BNC_Vertical_Custom" H 1175 7250 50  0001 C CNN
F 3 " ~" H 1175 7250 50  0001 C CNN
	1    1175 7250
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5DF2BB7E
P 1175 7450
F 0 "#PWR08" H 1175 7200 50  0001 C CNN
F 1 "GND" H 1000 7400 50  0000 C CNN
F 2 "" H 1175 7450 50  0001 C CNN
F 3 "" H 1175 7450 50  0001 C CNN
	1    1175 7450
	1    0    0    -1  
$EndComp
Text GLabel 2600 6800 2    50   Input ~ 0
0SW30
Text GLabel 2600 7250 2    50   Input ~ 0
0SW31
$Comp
L Connector:Screw_Terminal_01x02 J31
U 1 1 5DF2BB86
P 2400 6900
F 0 "J31" H 2550 6800 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 2318 6666 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2400 6900 50  0001 C CNN
F 3 "~" H 2400 6900 50  0001 C CNN
	1    2400 6900
	-1   0    0    1   
$EndComp
Text GLabel 2600 6900 2    50   Input ~ 0
GND
$Comp
L Connector:Conn_Coaxial J32
U 1 1 5DF2BB8D
P 2400 7250
F 0 "J32" H 2500 7300 50  0000 L CNN
F 1 "Conn_Coaxial" H 2500 7223 50  0001 L CNN
F 2 "BoatCentralBoard:BNC_Vertical_Custom" H 2400 7250 50  0001 C CNN
F 3 " ~" H 2400 7250 50  0001 C CNN
	1    2400 7250
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5DF2BB93
P 2400 7450
F 0 "#PWR016" H 2400 7200 50  0001 C CNN
F 1 "GND" H 2250 7400 50  0000 C CNN
F 2 "" H 2400 7450 50  0001 C CNN
F 3 "" H 2400 7450 50  0001 C CNN
	1    2400 7450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5DF2DF20
P 1175 4575
F 0 "#PWR05" H 1175 4325 50  0001 C CNN
F 1 "GND" H 1025 4525 50  0000 C CNN
F 2 "" H 1175 4575 50  0001 C CNN
F 3 "" H 1175 4575 50  0001 C CNN
	1    1175 4575
	1    0    0    -1  
$EndComp
Text GLabel 1375 4900 2    50   Input ~ 0
0SW10
Text GLabel 1375 5275 2    50   Input ~ 0
0SW11
$Comp
L Connector:Screw_Terminal_01x02 J11
U 1 1 5DF38580
P 1175 5000
F 0 "J11" H 1325 4900 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 1093 4766 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1175 5000 50  0001 C CNN
F 3 "~" H 1175 5000 50  0001 C CNN
	1    1175 5000
	-1   0    0    1   
$EndComp
Text GLabel 1375 5000 2    50   Input ~ 0
GND
$Comp
L Connector:Conn_Coaxial J12
U 1 1 5DF38587
P 1175 5275
F 0 "J12" H 1275 5325 50  0000 L CNN
F 1 "Conn_Coaxial" H 1275 5248 50  0001 L CNN
F 2 "BoatCentralBoard:BNC_Vertical_Custom" H 1175 5275 50  0001 C CNN
F 3 " ~" H 1175 5275 50  0001 C CNN
	1    1175 5275
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5DF3858D
P 1175 5475
F 0 "#PWR06" H 1175 5225 50  0001 C CNN
F 1 "GND" H 1025 5425 50  0000 C CNN
F 2 "" H 1175 5475 50  0001 C CNN
F 3 "" H 1175 5475 50  0001 C CNN
	1    1175 5475
	1    0    0    -1  
$EndComp
Text GLabel 1375 5800 2    50   Input ~ 0
0SW12
Text GLabel 1375 6225 2    50   Input ~ 0
0SW13
$Comp
L Connector:Screw_Terminal_01x02 J13
U 1 1 5DF38595
P 1175 5900
F 0 "J13" H 1325 5800 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 1093 5666 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1175 5900 50  0001 C CNN
F 3 "~" H 1175 5900 50  0001 C CNN
	1    1175 5900
	-1   0    0    1   
$EndComp
Text GLabel 1375 5900 2    50   Input ~ 0
GND
$Comp
L Connector:Conn_Coaxial J14
U 1 1 5DF3859C
P 1175 6225
F 0 "J14" H 1275 6275 50  0000 L CNN
F 1 "Conn_Coaxial" H 1275 6198 50  0001 L CNN
F 2 "BoatCentralBoard:BNC_Vertical_Custom" H 1175 6225 50  0001 C CNN
F 3 " ~" H 1175 6225 50  0001 C CNN
	1    1175 6225
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5DF385A2
P 1175 6425
F 0 "#PWR07" H 1175 6175 50  0001 C CNN
F 1 "GND" H 1025 6375 50  0000 C CNN
F 2 "" H 1175 6425 50  0001 C CNN
F 3 "" H 1175 6425 50  0001 C CNN
	1    1175 6425
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J33
U 1 1 5DF6D2AF
P 7075 2550
F 0 "J33" H 7155 2592 50  0000 L CNN
F 1 "Conn_01x01" H 7155 2501 50  0001 L CNN
F 2 "BoatCentralBoard:Banana_Jack_4Pin" H 7075 2550 50  0001 C CNN
F 3 "~" H 7075 2550 50  0001 C CNN
	1    7075 2550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J34
U 1 1 5DF6E3BA
P 7075 2750
F 0 "J34" H 7155 2792 50  0000 L CNN
F 1 "Conn_01x01" H 7155 2701 50  0001 L CNN
F 2 "BoatCentralBoard:Banana_Jack_4Pin" H 7075 2750 50  0001 C CNN
F 3 "~" H 7075 2750 50  0001 C CNN
	1    7075 2750
	1    0    0    -1  
$EndComp
Text GLabel 6875 2750 0    50   Input ~ 0
+40V
$Comp
L Connector_Generic:Conn_01x01 J35
U 1 1 5DF80D6B
P 7075 2950
F 0 "J35" H 7155 2992 50  0000 L CNN
F 1 "Conn_01x01" H 7155 2901 50  0001 L CNN
F 2 "BoatCentralBoard:Banana_Jack_4Pin" H 7075 2950 50  0001 C CNN
F 3 "~" H 7075 2950 50  0001 C CNN
	1    7075 2950
	1    0    0    -1  
$EndComp
Text GLabel 6875 2950 0    50   Input ~ 0
GND
$Comp
L Connector:Screw_Terminal_01x02 J40
U 1 1 5DF90529
P 9700 5625
F 0 "J40" H 9618 5300 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 9618 5391 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 9700 5625 50  0001 C CNN
F 3 "~" H 9700 5625 50  0001 C CNN
	1    9700 5625
	1    0    0    -1  
$EndComp
Text GLabel 9500 5625 0    50   Input ~ 0
GND
Text GLabel 4875 1550 0    50   Input ~ 0
-40V
Wire Wire Line
	4875 1550 5175 1550
Wire Wire Line
	5175 1550 5475 1550
Connection ~ 5175 1550
Wire Wire Line
	6775 1750 6925 1750
Connection ~ 6925 1750
Wire Wire Line
	8675 1750 8825 1750
Connection ~ 8675 1750
$Comp
L Device:C C2
U 1 1 5E005244
P 4000 2700
F 0 "C2" V 4225 2700 50  0000 L CNN
F 1 "0.1μF" V 4150 2600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4038 2550 50  0001 C CNN
F 3 "~" H 4000 2700 50  0001 C CNN
	1    4000 2700
	0    -1   -1   0   
$EndComp
Text GLabel 4150 2700 2    50   Input ~ 0
VNN
Text GLabel 3850 2700 0    50   Input ~ 0
VPP
$Comp
L Device:C C1
U 1 1 5DFD21DB
P 4000 2200
F 0 "C1" V 4250 2175 50  0000 L CNN
F 1 "1μF" V 4150 2125 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4038 2050 50  0001 C CNN
F 3 "~" H 4000 2200 50  0001 C CNN
	1    4000 2200
	0    -1   -1   0   
$EndComp
Text GLabel 4150 2200 2    50   Input ~ 0
VNN
Text GLabel 4250 4775 1    50   Input ~ 0
VNN
Wire Wire Line
	4250 4775 4250 4875
Wire Wire Line
	4450 4775 4450 4875
Wire Wire Line
	4550 4775 4550 4875
Wire Wire Line
	4650 4775 4650 4875
Wire Wire Line
	4750 4775 4750 4875
Wire Wire Line
	4850 4775 4850 4875
Wire Wire Line
	4950 4775 4950 4875
Wire Wire Line
	5050 4775 5050 4875
Wire Wire Line
	5150 4775 5150 4875
Wire Wire Line
	5250 4775 5250 4875
Wire Wire Line
	5350 4775 5350 4875
Wire Wire Line
	5450 4775 5450 4875
Wire Wire Line
	5550 4775 5550 4875
Wire Wire Line
	5650 4775 5650 4875
Wire Wire Line
	5750 4775 5750 4875
Text GLabel 6175 5325 2    50   Input ~ 0
0Y1819
Text GLabel 6175 5425 2    50   Input ~ 0
0SW18
Text GLabel 6175 5525 2    50   Input ~ 0
VNN
Text GLabel 6175 5625 2    50   Input ~ 0
0SW17
Text GLabel 6175 5725 2    50   Input ~ 0
0Y1617
Text GLabel 6175 5825 2    50   Input ~ 0
0SW16
Text GLabel 6175 5925 2    50   Input ~ 0
VPP
Text GLabel 6175 6025 2    50   Input ~ 0
VPP
Text GLabel 6175 6125 2    50   Input ~ 0
0SW15
Text GLabel 6175 6225 2    50   Input ~ 0
0Y1415
Text GLabel 6175 6325 2    50   Input ~ 0
0SW14
Text GLabel 6175 6425 2    50   Input ~ 0
VNN
Text GLabel 6175 6525 2    50   Input ~ 0
0SW13
Text GLabel 6175 6625 2    50   Input ~ 0
0Y1213
Wire Wire Line
	6050 5325 6175 5325
Wire Wire Line
	6050 5425 6175 5425
Wire Wire Line
	6050 5525 6175 5525
Wire Wire Line
	6050 5625 6175 5625
Wire Wire Line
	6050 5725 6175 5725
Wire Wire Line
	6050 5825 6175 5825
Wire Wire Line
	6050 5925 6175 5925
Wire Wire Line
	6050 6025 6175 6025
Wire Wire Line
	6050 6125 6175 6125
Wire Wire Line
	6050 6225 6175 6225
Wire Wire Line
	6050 6325 6175 6325
Wire Wire Line
	6050 6425 6175 6425
Wire Wire Line
	6050 6525 6175 6525
Wire Wire Line
	6050 6625 6175 6625
Wire Wire Line
	4450 7150 4450 7025
Wire Wire Line
	4550 7150 4550 7025
Wire Wire Line
	4650 7150 4650 7025
Wire Wire Line
	4750 7150 4750 7025
Wire Wire Line
	4850 7150 4850 7025
Wire Wire Line
	4950 7150 4950 7025
Wire Wire Line
	5050 7150 5050 7025
Wire Wire Line
	5150 7150 5150 7025
Wire Wire Line
	5250 7150 5250 7025
Wire Wire Line
	5350 7150 5350 7025
Wire Wire Line
	5450 7150 5450 7025
Wire Wire Line
	5550 7150 5550 7025
Wire Wire Line
	5650 7150 5650 7025
Wire Wire Line
	5750 7150 5750 7025
Wire Wire Line
	4100 6675 3975 6675
Wire Wire Line
	4100 6575 3975 6575
Wire Wire Line
	4100 6475 3975 6475
Wire Wire Line
	4100 6375 3975 6375
Wire Wire Line
	4100 6275 3975 6275
Wire Wire Line
	4100 6175 3975 6175
Wire Wire Line
	4100 6075 3975 6075
Wire Wire Line
	4100 5975 3975 5975
Wire Wire Line
	4100 5775 3975 5775
Wire Wire Line
	4100 5675 3975 5675
Wire Wire Line
	4100 5575 3975 5575
Wire Wire Line
	4100 5475 3975 5475
Wire Wire Line
	4100 5375 3975 5375
Text GLabel 9500 3825 0    50   Input ~ 0
GND
Text GLabel 9500 3725 0    50   Output ~ 0
0Y1819
Text GLabel 9500 3625 0    50   Input ~ 0
GND
Text GLabel 9500 3525 0    50   Output ~ 0
0Y1617
Text GLabel 9500 3350 0    50   Input ~ 0
GND
Text GLabel 9500 3250 0    50   Output ~ 0
0Y1415
Text GLabel 9500 3150 0    50   Input ~ 0
GND
Text GLabel 9500 3050 0    50   Output ~ 0
0Y1213
Text GLabel 9500 2950 0    50   Input ~ 0
GND
Text GLabel 9500 2850 0    50   Output ~ 0
0Y1011
$Comp
L Connector:Screw_Terminal_01x08 J36
U 1 1 5EFD7807
P 9700 2075
F 0 "J36" H 9780 2067 50  0000 L CNN
F 1 "Screw_Terminal_01x08" H 9780 1976 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08_Pitch2.54mm" H 9700 2075 50  0001 C CNN
F 3 "~" H 9700 2075 50  0001 C CNN
	1    9700 2075
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x08 J37
U 1 1 5EFDEB7F
P 9700 2950
F 0 "J37" H 9780 2942 50  0000 L CNN
F 1 "Screw_Terminal_01x08" H 9780 2851 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08_Pitch2.54mm" H 9700 2950 50  0001 C CNN
F 3 "~" H 9700 2950 50  0001 C CNN
	1    9700 2950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x08 J38
U 1 1 5EFE07F1
P 9700 3825
F 0 "J38" H 9780 3817 50  0000 L CNN
F 1 "Screw_Terminal_01x08" H 9780 3726 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08_Pitch2.54mm" H 9700 3825 50  0001 C CNN
F 3 "~" H 9700 3825 50  0001 C CNN
	1    9700 3825
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x08 J39
U 1 1 5EFE2A61
P 9700 4700
F 0 "J39" H 9780 4692 50  0000 L CNN
F 1 "Screw_Terminal_01x08" H 9780 4601 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08_Pitch2.54mm" H 9700 4700 50  0001 C CNN
F 3 "~" H 9700 4700 50  0001 C CNN
	1    9700 4700
	1    0    0    -1  
$EndComp
Text GLabel 3850 2200 0    50   Input ~ 0
VPP
Wire Wire Line
	8225 1750 8675 1750
Wire Wire Line
	8225 1850 8475 1850
Wire Wire Line
	8475 1850 8475 1950
Wire Wire Line
	8225 1950 8475 1950
Connection ~ 8475 1950
Wire Wire Line
	8475 1950 8475 2050
Wire Wire Line
	6925 1750 7425 1750
Wire Wire Line
	7425 1850 7100 1850
Wire Wire Line
	7100 1850 7100 1950
Wire Wire Line
	7425 1950 7100 1950
Connection ~ 7100 1950
Wire Wire Line
	7100 1950 7100 2050
Wire Wire Line
	7425 2050 7100 2050
Connection ~ 7100 2050
$Comp
L power:GND #PWR017
U 1 1 5DED0F1A
P 6925 2050
F 0 "#PWR017" H 6925 1800 50  0001 C CNN
F 1 "GND" H 6930 1877 50  0000 C CNN
F 2 "" H 6925 2050 50  0001 C CNN
F 3 "" H 6925 2050 50  0001 C CNN
	1    6925 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 634631D2
P 7100 2050
F 0 "#PWR018" H 7100 1800 50  0001 C CNN
F 1 "GND" H 7105 1877 50  0000 C CNN
F 2 "" H 7100 2050 50  0001 C CNN
F 3 "" H 7100 2050 50  0001 C CNN
	1    7100 2050
	1    0    0    -1  
$EndComp
Connection ~ 5175 3125
Wire Wire Line
	5175 3125 5375 3125
Wire Wire Line
	5025 3125 5175 3125
Text GLabel 5375 3125 2    50   Input ~ 0
VPP
Text GLabel 5025 3125 0    50   Input ~ 0
+40V
$Comp
L Device:C C5
U 1 1 5DC7A84E
P 5175 3275
F 0 "C5" H 5325 3300 50  0000 C CNN
F 1 "0.1μF" H 5400 3225 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5213 3125 50  0001 C CNN
F 3 "~" H 5175 3275 50  0001 C CNN
	1    5175 3275
	1    0    0    -1  
$EndComp
Text GLabel 5175 3425 3    50   Input ~ 0
GND
Text GLabel 5175 2700 3    50   Input ~ 0
GND
$EndSCHEMATC
