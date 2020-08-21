EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "STM8S003F3 Breakout"
Date "2020-08-20"
Rev "V2.0"
Comp "Aardwolf Digital"
Comment1 "V1.0 First Issue (EasyEDA)"
Comment2 "V2.0 Transferred from EasyEDA to KiCAD"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Regulator_Linear:AMS1117-3.3 U2
U 1 1 5F3D9A76
P 2250 1450
F 0 "U2" H 2250 1692 50  0000 C CNN
F 1 "AMS1117-3.3" H 2250 1601 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 2250 1650 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 2350 1200 50  0001 C CNN
F 4 "C6186" H 2250 1450 50  0001 C CNN "LCSC"
	1    2250 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5F3DA85B
P 1450 1700
F 0 "C2" H 1565 1746 50  0000 L CNN
F 1 "100n" H 1565 1655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1488 1550 50  0001 C CNN
F 3 "~" H 1450 1700 50  0001 C CNN
F 4 "C14663" H 1450 1700 50  0001 C CNN "LCSC"
	1    1450 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1550 1450 1450
Wire Wire Line
	1450 1450 1950 1450
$Comp
L Device:C C4
U 1 1 5F3DBD39
P 4950 6050
F 0 "C4" H 5065 6096 50  0000 L CNN
F 1 "1u" H 5065 6005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4988 5900 50  0001 C CNN
F 3 "~" H 4950 6050 50  0001 C CNN
F 4 "C52923" H 4950 6050 50  0001 C CNN "LCSC"
	1    4950 6050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5F3DC970
P 2950 1700
F 0 "C1" H 3065 1746 50  0000 L CNN
F 1 "100n" H 3065 1655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2988 1550 50  0001 C CNN
F 3 "~" H 2950 1700 50  0001 C CNN
F 4 "C1525" H 2950 1700 50  0001 C CNN "LCSC"
	1    2950 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1550 2950 1450
Wire Wire Line
	2950 1450 2550 1450
$Comp
L power:+3V3 #PWR0101
U 1 1 5F3DE49B
P 2950 1350
F 0 "#PWR0101" H 2950 1200 50  0001 C CNN
F 1 "+3V3" H 2965 1523 50  0000 C CNN
F 2 "" H 2950 1350 50  0001 C CNN
F 3 "" H 2950 1350 50  0001 C CNN
	1    2950 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1350 2950 1450
Connection ~ 2950 1450
$Comp
L power:GND #PWR0102
U 1 1 5F3DEFBB
P 2250 1950
F 0 "#PWR0102" H 2250 1700 50  0001 C CNN
F 1 "GND" H 2255 1777 50  0000 C CNN
F 2 "" H 2250 1950 50  0001 C CNN
F 3 "" H 2250 1950 50  0001 C CNN
	1    2250 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 1950 2250 1750
$Comp
L power:GND #PWR0103
U 1 1 5F3E03BA
P 1450 1950
F 0 "#PWR0103" H 1450 1700 50  0001 C CNN
F 1 "GND" H 1455 1777 50  0000 C CNN
F 2 "" H 1450 1950 50  0001 C CNN
F 3 "" H 1450 1950 50  0001 C CNN
	1    1450 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1850 1450 1950
$Comp
L power:GND #PWR0104
U 1 1 5F3E1107
P 2950 1950
F 0 "#PWR0104" H 2950 1700 50  0001 C CNN
F 1 "GND" H 2955 1777 50  0000 C CNN
F 2 "" H 2950 1950 50  0001 C CNN
F 3 "" H 2950 1950 50  0001 C CNN
	1    2950 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1850 2950 1950
$Comp
L MCU_ST_STM8:STM8S003F3P U1
U 1 1 5F3E78C5
P 5750 5000
F 0 "U1" H 5850 6050 50  0000 L CNN
F 1 "STM8S003F3P" H 5850 5950 50  0000 L CNN
F 2 "Package_SO:TSSOP-20_4.4x6.5mm_P0.65mm" H 5800 6100 50  0001 L CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00024550.pdf" H 5700 4600 50  0001 C CNN
F 4 "C52717" H 5750 5000 50  0001 C CNN "LCSC"
	1    5750 5000
	1    0    0    -1  
$EndComp
Text GLabel 6450 4800 2    50   Input ~ 0
PD2
Text GLabel 6450 4700 2    50   Input ~ 0
PD1\SWIM
Text GLabel 6450 4900 2    50   Input ~ 0
PD3
Text GLabel 6450 5000 2    50   Input ~ 0
PD4
Text GLabel 6450 5100 2    50   Input ~ 0
PD5\TX
Text GLabel 6450 5200 2    50   Input ~ 0
PD6\RX
Wire Wire Line
	6350 4700 6450 4700
Wire Wire Line
	6350 4800 6450 4800
Wire Wire Line
	6350 4900 6450 4900
Wire Wire Line
	6350 5000 6450 5000
Wire Wire Line
	6350 5100 6450 5100
Wire Wire Line
	6350 5200 6450 5200
Text GLabel 5050 5600 0    50   Input ~ 0
~RST
Wire Wire Line
	5050 5600 5150 5600
Wire Wire Line
	4950 5900 4950 5700
Wire Wire Line
	4950 5700 5150 5700
Text GLabel 4850 5700 0    50   Input ~ 0
VCAP
Wire Wire Line
	4950 5700 4850 5700
Connection ~ 4950 5700
$Comp
L power:GND #PWR0105
U 1 1 5F3EAA66
P 4950 6300
F 0 "#PWR0105" H 4950 6050 50  0001 C CNN
F 1 "GND" H 4955 6127 50  0000 C CNN
F 2 "" H 4950 6300 50  0001 C CNN
F 3 "" H 4950 6300 50  0001 C CNN
	1    4950 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 6200 4950 6300
$Comp
L power:GND #PWR0106
U 1 1 5F3EB24C
P 5750 6300
F 0 "#PWR0106" H 5750 6050 50  0001 C CNN
F 1 "GND" H 5755 6127 50  0000 C CNN
F 2 "" H 5750 6300 50  0001 C CNN
F 3 "" H 5750 6300 50  0001 C CNN
	1    5750 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 6000 5750 6300
Text GLabel 5050 4300 0    50   Input ~ 0
PA1
Text GLabel 5050 4400 0    50   Input ~ 0
PA2
Text GLabel 5050 4500 0    50   Input ~ 0
PA3
Text GLabel 5050 4700 0    50   Input ~ 0
PB4
Text GLabel 5050 4800 0    50   Input ~ 0
PB5
Text GLabel 5050 5000 0    50   Input ~ 0
PC3
Text GLabel 5050 5100 0    50   Input ~ 0
PC4
Text GLabel 5050 5200 0    50   Input ~ 0
PC5
Text GLabel 5050 5300 0    50   Input ~ 0
PC6
Text GLabel 5050 5400 0    50   Input ~ 0
PC7
Wire Wire Line
	5050 4300 5150 4300
Wire Wire Line
	5050 4400 5150 4400
Wire Wire Line
	5050 4500 5150 4500
Wire Wire Line
	5050 4700 5150 4700
Wire Wire Line
	5050 4800 5150 4800
Wire Wire Line
	5050 5000 5150 5000
Wire Wire Line
	5050 5100 5150 5100
Wire Wire Line
	5050 5200 5150 5200
Wire Wire Line
	5050 5300 5150 5300
Wire Wire Line
	5050 5400 5150 5400
$Comp
L Device:C C3
U 1 1 5F3EF9DE
P 5400 3650
F 0 "C3" H 5515 3696 50  0000 L CNN
F 1 "100n" H 5515 3605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 5438 3500 50  0001 C CNN
F 3 "~" H 5400 3650 50  0001 C CNN
F 4 "C1525" H 5400 3650 50  0001 C CNN "LCSC"
	1    5400 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5F3F0F3E
P 5400 3900
F 0 "#PWR0107" H 5400 3650 50  0001 C CNN
F 1 "GND" H 5405 3727 50  0000 C CNN
F 2 "" H 5400 3900 50  0001 C CNN
F 3 "" H 5400 3900 50  0001 C CNN
	1    5400 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 3800 5400 3900
Wire Wire Line
	5400 3500 5400 3400
Wire Wire Line
	5400 3400 5750 3400
Wire Wire Line
	5750 3400 5750 4000
$Comp
L power:+3V3 #PWR0108
U 1 1 5F3F21F5
P 5750 3300
F 0 "#PWR0108" H 5750 3150 50  0001 C CNN
F 1 "+3V3" H 5765 3473 50  0000 C CNN
F 2 "" H 5750 3300 50  0001 C CNN
F 3 "" H 5750 3300 50  0001 C CNN
	1    5750 3300
	1    0    0    -1  
$EndComp
Connection ~ 5750 3400
Wire Wire Line
	5750 3300 5750 3400
$Comp
L Device:R R1
U 1 1 5F3F78F3
P 6300 1500
F 0 "R1" H 6370 1546 50  0000 L CNN
F 1 "1k" H 6370 1455 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 6230 1500 50  0001 C CNN
F 3 "~" H 6300 1500 50  0001 C CNN
F 4 "C11702" H 6300 1500 50  0001 C CNN "LCSC"
	1    6300 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5F3F81A4
P 8900 1500
F 0 "R2" H 8970 1546 50  0000 L CNN
F 1 "1k" H 8970 1455 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 8830 1500 50  0001 C CNN
F 3 "~" H 8900 1500 50  0001 C CNN
F 4 "C11702" H 8900 1500 50  0001 C CNN "LCSC"
	1    8900 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 5F3F8F3B
P 6300 2200
F 0 "D1" V 6339 2083 50  0000 R CNN
F 1 "LED" V 6248 2083 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 6300 2200 50  0001 C CNN
F 3 "~" H 6300 2200 50  0001 C CNN
F 4 "C2286" V 6300 2200 50  0001 C CNN "LCSC"
	1    6300 2200
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D2
U 1 1 5F3F9C0B
P 8900 2200
F 0 "D2" V 8939 2083 50  0000 R CNN
F 1 "LED" V 8848 2083 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 8900 2200 50  0001 C CNN
F 3 "~" H 8900 2200 50  0001 C CNN
F 4 "C72038" V 8900 2200 50  0001 C CNN "LCSC"
	1    8900 2200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6300 1650 6300 2050
Wire Wire Line
	8900 1650 8900 2050
$Comp
L power:GND #PWR0109
U 1 1 5F3FB9D8
P 6300 2700
F 0 "#PWR0109" H 6300 2450 50  0001 C CNN
F 1 "GND" H 6305 2527 50  0000 C CNN
F 2 "" H 6300 2700 50  0001 C CNN
F 3 "" H 6300 2700 50  0001 C CNN
	1    6300 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 2350 6300 2700
Text GLabel 9050 2700 2    50   Input ~ 0
PC3
Wire Wire Line
	8900 2350 8900 2700
Wire Wire Line
	8900 2700 9050 2700
$Comp
L power:+3V3 #PWR0110
U 1 1 5F3FD2C2
P 6300 1200
F 0 "#PWR0110" H 6300 1050 50  0001 C CNN
F 1 "+3V3" H 6315 1373 50  0000 C CNN
F 2 "" H 6300 1200 50  0001 C CNN
F 3 "" H 6300 1200 50  0001 C CNN
	1    6300 1200
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0111
U 1 1 5F3FDA08
P 8900 1200
F 0 "#PWR0111" H 8900 1050 50  0001 C CNN
F 1 "+3V3" H 8915 1373 50  0000 C CNN
F 2 "" H 8900 1200 50  0001 C CNN
F 3 "" H 8900 1200 50  0001 C CNN
	1    8900 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 1200 6300 1350
Wire Wire Line
	8900 1200 8900 1350
$Comp
L Device:R R3
U 1 1 5F3FECF3
P 10050 1500
F 0 "R3" H 10120 1546 50  0000 L CNN
F 1 "10k" H 10120 1455 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 9980 1500 50  0001 C CNN
F 3 "~" H 10050 1500 50  0001 C CNN
F 4 "C25744" H 10050 1500 50  0001 C CNN "LCSC"
	1    10050 1500
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 5F400187
P 10350 2200
F 0 "SW1" H 10350 2485 50  0000 C CNN
F 1 "SW_Push" H 10350 2394 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPST_CK_RS282G05A3" H 10350 2400 50  0001 C CNN
F 3 "~" H 10350 2400 50  0001 C CNN
F 4 "C118141" H 10350 2200 50  0001 C CNN "LCSC"
	1    10350 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 2200 10050 2200
Wire Wire Line
	10050 2200 10050 1900
Text GLabel 9950 1900 0    50   Input ~ 0
~RST
Wire Wire Line
	9950 1900 10050 1900
$Comp
L Device:C C5
U 1 1 5F4061A4
P 10050 2450
F 0 "C5" H 10165 2496 50  0000 L CNN
F 1 "100n" H 10165 2405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 10088 2300 50  0001 C CNN
F 3 "~" H 10050 2450 50  0001 C CNN
F 4 "C1525" H 10050 2450 50  0001 C CNN "LCSC"
	1    10050 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 2300 10050 2200
Connection ~ 10050 2200
$Comp
L power:GND #PWR0112
U 1 1 5F4077B6
P 10050 2700
F 0 "#PWR0112" H 10050 2450 50  0001 C CNN
F 1 "GND" H 10055 2527 50  0000 C CNN
F 2 "" H 10050 2700 50  0001 C CNN
F 3 "" H 10050 2700 50  0001 C CNN
	1    10050 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 2600 10050 2700
$Comp
L power:+3V3 #PWR0113
U 1 1 5F40862E
P 10050 1200
F 0 "#PWR0113" H 10050 1050 50  0001 C CNN
F 1 "+3V3" H 10065 1373 50  0000 C CNN
F 2 "" H 10050 1200 50  0001 C CNN
F 3 "" H 10050 1200 50  0001 C CNN
	1    10050 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 1200 10050 1350
$Comp
L power:GND #PWR0114
U 1 1 5F40952D
P 10800 2700
F 0 "#PWR0114" H 10800 2450 50  0001 C CNN
F 1 "GND" H 10805 2527 50  0000 C CNN
F 2 "" H 10800 2700 50  0001 C CNN
F 3 "" H 10800 2700 50  0001 C CNN
	1    10800 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10800 2700 10800 2200
Wire Wire Line
	10800 2200 10550 2200
Connection ~ 10050 1900
Wire Wire Line
	10050 1650 10050 1900
$Comp
L Connector_Generic:Conn_01x10 J2
U 1 1 5F40BBFE
P 1800 6750
F 0 "J2" H 1718 6025 50  0000 C CNN
F 1 "Conn_01x10" H 1718 6116 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 1800 6750 50  0001 C CNN
F 3 "~" H 1800 6750 50  0001 C CNN
	1    1800 6750
	1    0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x10 J1
U 1 1 5F40C7D3
P 2400 6750
F 0 "J1" H 2318 6025 50  0000 C CNN
F 1 "Conn_01x10" H 2318 6116 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 2400 6750 50  0001 C CNN
F 3 "~" H 2400 6750 50  0001 C CNN
	1    2400 6750
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J3
U 1 1 5F40D8E2
P 2050 5800
F 0 "J3" V 2050 6000 50  0000 C CNN
F 1 "Conn_01x04" V 2050 5300 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 2050 5800 50  0001 C CNN
F 3 "~" H 2050 5800 50  0001 C CNN
	1    2050 5800
	0    -1   1    0   
$EndComp
Text GLabel 1500 6250 0    50   Input ~ 0
PB5
Text GLabel 1500 6350 0    50   Input ~ 0
PB4
Text GLabel 1500 6450 0    50   Input ~ 0
PC3
Text GLabel 1500 6550 0    50   Input ~ 0
PC4
Text GLabel 1500 6650 0    50   Input ~ 0
PC5
Text GLabel 1500 6750 0    50   Input ~ 0
PC6
Text GLabel 1500 6850 0    50   Input ~ 0
PC7
Text GLabel 1500 7050 0    50   Input ~ 0
PD2
Text GLabel 1500 6950 0    50   Input ~ 0
PD1\SWIM
$Comp
L power:GND #PWR0115
U 1 1 5F40FC20
P 1500 7250
F 0 "#PWR0115" H 1500 7000 50  0001 C CNN
F 1 "GND" H 1505 7077 50  0000 C CNN
F 2 "" H 1500 7250 50  0001 C CNN
F 3 "" H 1500 7250 50  0001 C CNN
	1    1500 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 7250 1500 7150
Wire Wire Line
	1500 7150 1600 7150
Wire Wire Line
	1500 6250 1600 6250
Wire Wire Line
	1500 6350 1600 6350
Wire Wire Line
	1600 6450 1500 6450
Wire Wire Line
	1500 6550 1600 6550
Wire Wire Line
	1600 6650 1500 6650
Wire Wire Line
	1500 6750 1600 6750
Wire Wire Line
	1600 6850 1500 6850
Wire Wire Line
	1500 6950 1600 6950
Wire Wire Line
	1600 7050 1500 7050
Text GLabel 2700 6450 2    50   Input ~ 0
PA1
Text GLabel 2700 6350 2    50   Input ~ 0
PA2
Text GLabel 2700 6250 2    50   Input ~ 0
PA3
Text GLabel 3100 6550 2    50   Input ~ 0
~RST
Text GLabel 2700 6950 2    50   Input ~ 0
PD3
Text GLabel 2700 6850 2    50   Input ~ 0
PD4
Text GLabel 2700 6750 2    50   Input ~ 0
PD5\TX
Text GLabel 2700 6650 2    50   Input ~ 0
PD6\RX
Wire Wire Line
	2700 6250 2600 6250
Wire Wire Line
	2600 6350 2700 6350
Wire Wire Line
	2700 6450 2600 6450
Wire Wire Line
	2600 6550 3100 6550
Wire Wire Line
	2600 6650 2700 6650
Wire Wire Line
	2700 6750 2600 6750
Wire Wire Line
	2600 6850 2700 6850
Wire Wire Line
	2600 6950 2700 6950
$Comp
L power:+3V3 #PWR0116
U 1 1 5F430766
P 3250 7000
F 0 "#PWR0116" H 3250 6850 50  0001 C CNN
F 1 "+3V3" H 3265 7173 50  0000 C CNN
F 2 "" H 3250 7000 50  0001 C CNN
F 3 "" H 3250 7000 50  0001 C CNN
	1    3250 7000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3250 7050 2600 7050
Wire Wire Line
	3250 7000 3250 7050
$Comp
L power:+5V #PWR0117
U 1 1 5F434B4F
P 1450 1350
F 0 "#PWR0117" H 1450 1200 50  0001 C CNN
F 1 "+5V" H 1465 1523 50  0000 C CNN
F 2 "" H 1450 1350 50  0001 C CNN
F 3 "" H 1450 1350 50  0001 C CNN
	1    1450 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1350 1450 1450
Connection ~ 1450 1450
$Comp
L power:+5V #PWR0118
U 1 1 5F4392BE
P 3500 7000
F 0 "#PWR0118" H 3500 6850 50  0001 C CNN
F 1 "+5V" H 3515 7173 50  0000 C CNN
F 2 "" H 3500 7000 50  0001 C CNN
F 3 "" H 3500 7000 50  0001 C CNN
	1    3500 7000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3500 7000 3500 7150
Wire Wire Line
	3500 7150 2600 7150
Text GLabel 2550 5500 2    50   Input ~ 0
~RST
$Comp
L power:GND #PWR0119
U 1 1 5F450925
P 2450 5250
F 0 "#PWR0119" H 2450 5000 50  0001 C CNN
F 1 "GND" H 2455 5077 50  0000 C CNN
F 2 "" H 2450 5250 50  0001 C CNN
F 3 "" H 2450 5250 50  0001 C CNN
	1    2450 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 5250 2450 5150
Text GLabel 1750 5150 0    50   Input ~ 0
PD1\SWIM
$Comp
L power:+3V3 #PWR0120
U 1 1 5F456DA5
P 1850 5450
F 0 "#PWR0120" H 1850 5300 50  0001 C CNN
F 1 "+3V3" H 1865 5623 50  0000 C CNN
F 2 "" H 1850 5450 50  0001 C CNN
F 3 "" H 1850 5450 50  0001 C CNN
	1    1850 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 5500 1950 5500
Wire Wire Line
	1950 5500 1950 5600
Wire Wire Line
	1850 5450 1850 5500
Wire Wire Line
	2050 5150 2050 5600
Wire Wire Line
	1750 5150 2050 5150
Wire Wire Line
	2250 5500 2250 5600
Wire Wire Line
	2250 5500 2550 5500
Wire Wire Line
	2450 5150 2150 5150
Wire Wire Line
	2150 5150 2150 5600
Text Notes 850  4850 0    118  Italic 24
Connectors
Text Notes 1050 1000 0    118  Italic 24
Supply
Text Notes 6150 850  0    118  Italic 24
Interface
Text Notes 5600 2250 0    50   ~ 0
Power Indicator
Text Notes 8400 2250 0    50   ~ 0
Signal LED
Text Notes 9450 2250 0    50   ~ 0
Reset Switch
Text Notes 4750 3400 0    118  Italic 24
CPU
Wire Notes Line
	10680 7060 10730 7085
Wire Notes Line
	10730 7085 10730 6735
Wire Notes Line
	10730 6735 10680 6710
Wire Notes Line
	10680 6710 10680 7060
Wire Notes Line
	10680 6710 10870 6600
Wire Notes Line
	10870 6600 11160 6770
Wire Notes Line
	11160 6770 10920 6910
Wire Notes Line
	10920 6910 10920 6730
Wire Notes Line
	10920 6730 11020 6790
Wire Notes Line
	11070 6760 10880 6650
Wire Notes Line
	10880 6650 10730 6740
Wire Notes Line
	10920 6850 11070 6760
Wire Notes Line
	11160 6770 11160 6830
Wire Notes Line
	11160 6830 10880 6990
Wire Notes Line
	10880 6990 10880 6870
Wire Notes Line
	10880 6870 10770 6930
Wire Notes Line
	10770 6930 10770 7060
Wire Notes Line
	10770 7060 10730 7080
Wire Notes Line
	10880 6710 10770 6770
Wire Notes Line
	10770 6770 10770 6890
Wire Notes Line
	10770 6890 10880 6830
Wire Notes Line
	10880 6830 10880 6710
Wire Notes Line
	10880 6830 10830 6800
Wire Notes Line
	10830 6800 10830 6740
Wire Notes Line
	10830 6800 10770 6830
Text Notes 2320 5930 0    50   ~ 0
SWIM Programming Interface
Text Notes 600  3300 0    50   ~ 0
Pessimistic Temperature Calculation:\n\nSOT-223-3 Thermal Resistance = 90°C/W\nMaximum Temperature Rise = 40°C\n\nMaximum Power Dissipation:\n40°C / 90°CW = 0.44W\n\nSolving for Iout:\nIout = 0.44W / (Vout - 3.3V)
Text Notes 650  1450 0    50   ~ 0
4.3V to 15V\n
Text Notes 1050 2100 0    50   ~ 0
4.3V\n5V\n9V\n12V\n15V
Text Notes 650  2100 0    50   ~ 0
440 mA\n258 mA\n77 mA\n50 mA\n37 mA
Text Notes 650  1350 0    50   ~ 0
VIN
Text Notes 650  1650 0    50   ~ 0
Output Current
Text Notes 4900 2150 0    50   ~ 0
KENTO Elec KT-0603R RED LED\nVf = 1.9V to 2.2V\n\nIf = (3.3V - 1.9V) / 1k = 1.4mA
Text Notes 6800 2150 0    50   ~ 0
Everlight Elec 19-213/Y2C-CQ2R2L/3T(CY) YEL LED\nVf = 1.7V to 2.3V\n\nIf = (3.3V - 1.7V) / 1k = 1.6mA
$EndSCHEMATC
