EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "FT2232H-56Q —> Channel Board interface"
Date "2021-07-20"
Rev "1"
Comp "ACE lab (fish & chips)"
Comment1 "end of summer '21"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x13_Odd_Even CN2
U 1 1 60F7504E
P 2250 2950
F 0 "CN2" H 2300 3767 50  0000 C CNN
F 1 "Conn_02x13_Odd_Even" H 2300 3676 50  0000 C CNN
F 2 "" H 2250 2950 50  0001 C CNN
F 3 "https://ftdichip.com/wp-content/uploads/2020/07/DS_FT2232H-56Q_Mini_Module.pdf" H 2250 2950 50  0001 C CNN
	1    2250 2950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x13_Odd_Even CN3
U 1 1 60F7619C
P 2250 4600
F 0 "CN3" H 2300 5417 50  0000 C CNN
F 1 "Conn_02x13_Odd_Even" H 2300 5326 50  0000 C CNN
F 2 "" H 2250 4600 50  0001 C CNN
F 3 "https://ftdichip.com/wp-content/uploads/2020/07/DS_FT2232H-56Q_Mini_Module.pdf" H 2250 4600 50  0001 C CNN
	1    2250 4600
	1    0    0    -1  
$EndComp
Wire Notes Line
	1250 5450 1250 1600
Wire Notes Line
	1250 1600 3400 1600
Wire Notes Line
	3400 1600 3400 5450
Wire Notes Line
	1250 5450 3400 5450
Text GLabel 2050 2750 0    50   Input ~ 0
FT_AD1
Text GLabel 2050 2850 0    50   Input ~ 0
FT_AD3
Text GLabel 2050 2950 0    50   Input ~ 0
FT_AD4
Text GLabel 2550 2650 2    50   Input ~ 0
FT_AD0
Text GLabel 2550 2750 2    50   Input ~ 0
FT_AD2
Text GLabel 2550 3050 2    50   Input ~ 0
FT_AD7
Text Notes 2850 1700 2    50   ~ 0
FT2232H-56Q Evaluation Board
$Comp
L Timer:LM556 U1
U 1 1 60F87129
P 5450 2500
F 0 "U1" H 5450 3081 50  0000 C CNN
F 1 "LM556" H 5450 2990 50  0000 C CNN
F 2 "" H 5450 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm556.pdf" H 5450 2500 50  0001 C CNN
	1    5450 2500
	1    0    0    -1  
$EndComp
$Comp
L Timer:LM556 U1
U 2 1 60F8B6CB
P 5450 3850
F 0 "U1" H 5600 4300 50  0000 C CNN
F 1 "LM556" H 5650 4200 50  0000 C CNN
F 2 "" H 5450 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm556.pdf" H 5450 3850 50  0001 C CNN
	2    5450 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60F8CF3D
P 2050 2350
F 0 "#PWR?" H 2050 2100 50  0001 C CNN
F 1 "GND" V 2055 2222 50  0000 R CNN
F 2 "" H 2050 2350 50  0001 C CNN
F 3 "" H 2050 2350 50  0001 C CNN
	1    2050 2350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60F8D297
P 2050 2550
F 0 "#PWR?" H 2050 2300 50  0001 C CNN
F 1 "GND" V 2055 2422 50  0000 R CNN
F 2 "" H 2050 2550 50  0001 C CNN
F 3 "" H 2050 2550 50  0001 C CNN
	1    2050 2550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60F8ED6F
P 5450 4350
F 0 "#PWR?" H 5450 4100 50  0001 C CNN
F 1 "GND" H 5455 4177 50  0000 C CNN
F 2 "" H 5450 4350 50  0001 C CNN
F 3 "" H 5450 4350 50  0001 C CNN
	1    5450 4350
	1    0    0    -1  
$EndComp
Text GLabel 2550 4000 2    50   Input ~ 0
FT_VBUS
Text GLabel 4150 3350 0    50   Input ~ 0
FT_VBUS
Wire Wire Line
	5450 3350 5450 3450
$Comp
L Device:R_Small_US R1
U 1 1 60F955AC
P 4800 3500
F 0 "R1" H 4700 3550 50  0000 R CNN
F 1 "47k" H 4700 3450 50  0000 R CNN
F 2 "" H 4800 3500 50  0001 C CNN
F 3 "~" H 4800 3500 50  0001 C CNN
	1    4800 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 60F96310
P 4350 3650
F 0 "C1" V 4500 3800 50  0000 R CNN
F 1 "10nF" V 4400 3900 50  0000 R CNN
F 2 "" H 4350 3650 50  0001 C CNN
F 3 "~" H 4350 3650 50  0001 C CNN
	1    4350 3650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_POT_TRIM_US RV1
U 1 1 60FA174E
P 6250 3850
F 0 "RV1" H 6182 3896 50  0000 R CNN
F 1 "20k trim pot" H 6182 3805 50  0000 R CNN
F 2 "" H 6250 3850 50  0001 C CNN
F 3 "~" H 6250 3850 50  0001 C CNN
	1    6250 3850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6100 3850 6000 3850
Wire Wire Line
	6000 3850 6000 4050
Wire Wire Line
	6000 4050 5950 4050
Connection ~ 6000 3850
Wire Wire Line
	6000 3850 5950 3850
Wire Wire Line
	6250 3700 6250 3350
Wire Wire Line
	6250 3350 5450 3350
$Comp
L Device:C_Small C2
U 1 1 60FA6103
P 6000 4200
F 0 "C2" H 6092 4246 50  0000 L CNN
F 1 "104nF" H 6092 4155 50  0000 L CNN
F 2 "" H 6000 4200 50  0001 C CNN
F 3 "~" H 6000 4200 50  0001 C CNN
	1    6000 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 4050 6000 4100
Connection ~ 6000 4050
$Comp
L power:GND #PWR?
U 1 1 60FA812E
P 6000 4350
F 0 "#PWR?" H 6000 4100 50  0001 C CNN
F 1 "GND" H 6005 4177 50  0000 C CNN
F 2 "" H 6000 4350 50  0001 C CNN
F 3 "" H 6000 4350 50  0001 C CNN
	1    6000 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 4300 6000 4350
$Comp
L Device:R_Small_US R2
U 1 1 60FA90E6
P 4800 4100
F 0 "R2" H 4700 4150 50  0000 R CNN
F 1 "47k" H 4700 4050 50  0000 R CNN
F 2 "" H 4800 4100 50  0001 C CNN
F 3 "~" H 4800 4100 50  0001 C CNN
	1    4800 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 4050 4900 4050
Wire Wire Line
	4900 4050 4900 3350
Wire Wire Line
	4900 3350 5450 3350
Connection ~ 5450 3350
$Comp
L power:GND #PWR?
U 1 1 60FB18C7
P 4800 4350
F 0 "#PWR?" H 4800 4100 50  0001 C CNN
F 1 "GND" H 4805 4177 50  0000 C CNN
F 2 "" H 4800 4350 50  0001 C CNN
F 3 "" H 4800 4350 50  0001 C CNN
	1    4800 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 3650 4800 3650
Wire Wire Line
	4800 3650 4800 3600
Connection ~ 4800 3650
Wire Wire Line
	4800 3400 4800 3350
Wire Wire Line
	4800 3350 4900 3350
Connection ~ 4900 3350
Wire Wire Line
	4800 3650 4450 3650
Connection ~ 4800 3350
Text GLabel 4100 3650 0    50   Input ~ 0
FT_AD4
Wire Wire Line
	4250 3650 4100 3650
Wire Wire Line
	4150 3350 4800 3350
Wire Wire Line
	4800 3650 4800 4000
$Comp
L Device:R_Small_US R4
U 1 1 60FBA875
P 7050 4100
F 0 "R4" H 7118 4146 50  0000 L CNN
F 1 "10k" H 7118 4055 50  0000 L CNN
F 2 "" H 7050 4100 50  0001 C CNN
F 3 "~" H 7050 4100 50  0001 C CNN
	1    7050 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R3
U 1 1 60FBB74C
P 7050 3800
F 0 "R3" H 7118 3846 50  0000 L CNN
F 1 "5.1k" H 7118 3755 50  0000 L CNN
F 2 "" H 7050 3800 50  0001 C CNN
F 3 "~" H 7050 3800 50  0001 C CNN
	1    7050 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60FBC0EB
P 7050 4250
F 0 "#PWR?" H 7050 4000 50  0001 C CNN
F 1 "GND" H 7055 4077 50  0000 C CNN
F 2 "" H 7050 4250 50  0001 C CNN
F 3 "" H 7050 4250 50  0001 C CNN
	1    7050 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 3900 7050 3950
Wire Wire Line
	7050 4200 7050 4250
Wire Wire Line
	5950 3650 7050 3650
Wire Wire Line
	7050 3650 7050 3700
Text GLabel 7400 3950 2    50   Input ~ 0
SYNC
Wire Wire Line
	7400 3950 7050 3950
Connection ~ 7050 3950
Wire Wire Line
	7050 3950 7050 4000
$Comp
L Device:C_Small C2
U 1 1 60FC608E
P 4350 4100
F 0 "C2" H 4250 4150 50  0000 R CNN
F 1 "10nF" H 4258 4055 50  0000 R CNN
F 2 "" H 4350 4100 50  0001 C CNN
F 3 "~" H 4350 4100 50  0001 C CNN
	1    4350 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 3850 4350 4000
$Comp
L power:GND #PWR?
U 1 1 60FC9941
P 4350 4350
F 0 "#PWR?" H 4350 4100 50  0001 C CNN
F 1 "GND" H 4355 4177 50  0000 C CNN
F 2 "" H 4350 4350 50  0001 C CNN
F 3 "" H 4350 4350 50  0001 C CNN
	1    4350 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 4200 4350 4350
Wire Wire Line
	4800 4200 4800 4350
Wire Wire Line
	5450 4250 5450 4350
Wire Wire Line
	4350 3850 4950 3850
Wire Notes Line
	3650 1600 3650 5450
Wire Notes Line
	3650 5450 7800 5450
Wire Notes Line
	7800 5450 7800 1600
Wire Notes Line
	7800 1600 3650 1600
Text Notes 6250 1750 2    50   ~ 0
SYNC generation (monostable 556)
Text GLabel 8850 2650 0    50   Input ~ 0
FT_AD0
Text GLabel 8850 2800 0    50   Input ~ 0
FT_AD1
Text GLabel 8850 2950 0    50   Input ~ 0
FT_AD2
Wire Wire Line
	8850 2950 9000 2950
Wire Wire Line
	9000 2950 9000 2800
Wire Wire Line
	9000 2800 8850 2800
Wire Wire Line
	8850 2650 9000 2650
$Comp
L Device:D D1
U 1 1 60FF306A
P 9150 2650
F 0 "D1" H 9150 2775 50  0000 C CNN
F 1 "diode" H 9150 2776 50  0001 C CNN
F 2 "" H 9150 2650 50  0001 C CNN
F 3 "~" H 9150 2650 50  0001 C CNN
	1    9150 2650
	1    0    0    -1  
$EndComp
Connection ~ 9000 2800
$Comp
L Device:R_US R5
U 1 1 60FF8076
P 9450 2400
F 0 "R5" H 9518 2446 50  0000 L CNN
F 1 "2.7k" H 9518 2355 50  0000 L CNN
F 2 "" V 9490 2390 50  0001 C CNN
F 3 "~" H 9450 2400 50  0001 C CNN
	1    9450 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R6
U 1 1 60FF9E13
P 9800 2400
F 0 "R6" H 9868 2446 50  0000 L CNN
F 1 "2.7k" H 9868 2355 50  0000 L CNN
F 2 "" V 9840 2390 50  0001 C CNN
F 3 "~" H 9800 2400 50  0001 C CNN
	1    9800 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 2650 9350 2650
Wire Wire Line
	9450 2650 9450 2550
Wire Wire Line
	9800 2800 9800 2550
Wire Wire Line
	9000 2800 9800 2800
Text GLabel 8700 2150 0    50   Input ~ 0
3V3
Wire Wire Line
	8700 2150 9450 2150
Wire Wire Line
	9450 2150 9450 2250
Wire Wire Line
	9450 2150 9800 2150
Wire Wire Line
	9800 2150 9800 2250
Connection ~ 9450 2150
Text Notes 9900 2100 2    50   ~ 0
note: channel board #9 3v3 was used\n(but FTDI 3v3 works too)
Wire Wire Line
	9450 2650 10150 2650
Connection ~ 9450 2650
Text GLabel 10150 2650 2    50   Input ~ 0
TWCK
Text GLabel 10150 2800 2    50   Input ~ 0
TWD
Wire Wire Line
	9800 2800 10150 2800
Connection ~ 9800 2800
Text GLabel 8850 3200 0    50   Input ~ 0
FT_AD7
Wire Wire Line
	8850 3200 9350 3200
Wire Wire Line
	9350 3200 9350 2650
Connection ~ 9350 2650
Wire Wire Line
	9350 2650 9450 2650
Wire Notes Line
	8050 1600 8050 3400
Wire Notes Line
	8050 3400 10650 3400
Wire Notes Line
	10650 3400 10650 1600
Wire Notes Line
	10650 1600 8050 1600
Text Notes 9800 1700 2    50   ~ 0
Channel Board i2c bus
Text GLabel 8850 4700 0    50   Input ~ 0
FT_BD0
Text GLabel 8850 4850 0    50   Input ~ 0
FT_BD1
Text GLabel 8850 5000 0    50   Input ~ 0
FT_BD2
Wire Wire Line
	8850 5000 9000 5000
Wire Wire Line
	9000 5000 9000 4850
Wire Wire Line
	9000 4850 8850 4850
Wire Wire Line
	8850 4700 9000 4700
$Comp
L Device:D D2
U 1 1 61008370
P 9150 4700
F 0 "D2" H 9150 4825 50  0000 C CNN
F 1 "diode" H 9150 4826 50  0001 C CNN
F 2 "" H 9150 4700 50  0001 C CNN
F 3 "~" H 9150 4700 50  0001 C CNN
	1    9150 4700
	1    0    0    -1  
$EndComp
Connection ~ 9000 4850
Wire Wire Line
	9300 4700 9350 4700
Text GLabel 10150 4700 2    50   Input ~ 0
PSF_TWCK
Text GLabel 10150 4850 2    50   Input ~ 0
PSF_TWD
Text GLabel 8850 5250 0    50   Input ~ 0
FT_BD7
Wire Wire Line
	8850 5250 9350 5250
Wire Wire Line
	9350 5250 9350 4700
Connection ~ 9350 4700
Wire Notes Line
	8050 3650 8050 5450
Wire Notes Line
	8050 5450 10650 5450
Wire Notes Line
	10650 5450 10650 3650
Wire Notes Line
	10650 3650 8050 3650
Text Notes 9850 3750 2    50   ~ 0
PSF/hydrophone board i2c bus
Text GLabel 2050 5200 0    50   Input ~ 0
FT_BD0
Text GLabel 2550 5200 2    50   Input ~ 0
FT_BD1
Text GLabel 2050 5100 0    50   Input ~ 0
FT_BD2
Text GLabel 2050 4800 0    50   Input ~ 0
FT_BD7
Wire Wire Line
	9350 4700 10150 4700
Wire Wire Line
	9000 4850 10150 4850
Text Notes 9750 4400 2    50   ~ 0
note: no pullups are used here, \nbut consider adding weak ones
$EndSCHEMATC
