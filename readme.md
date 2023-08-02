# WLEd Related Notes

## E131

https://auschristmaslighting.com/wiki/E1-31-Multicast-vs-Unicast

Unicast
Pros
    Home Wi-Fi networks won't be affected
Cons
    A specific DMX universe may only be sent to one controller
    You need to know the IP address of the controller you want to send a DMX universe to (and to keep it updated if your configuration changes)

Multicast
Pros
    Multiple controllers can receive the same DMX universe
    TBA
Cons

    Interferes and disrupts home Wi-Fi networks (can be avoided by running a separate network or with a network switch/router with IGMP Snooping enabled)
    TBA



## Hardware

### Led Ring

241leds = 1 + 8 + 12 + 16 + 24 + 32 + 40 + 48 + 60


### ESP32

ESP-32S ESP-WROOM-32 ESP32 WIFI Dual Core CPU Development Board 802.11b/g Wi Fi BT Module Ultra-Low Power Consumption


Feature:
1. The module is the ESP- WROOM-32 development board, and the ESP- WROOM32 parameter characteristic is also the parameter characteristic of the module.
2. 802.11b/g/WiFi + BT module.
3. Low power dual core 32-bit CPU, which can be used as application processor;
4. The main frequency is up to 240MHz, and the operation capacity is up to 600DMIPS.
5. Support UART / SPI / I2C / PWM / DAC / ADC and other interfaces;
6. Support openOCD debugging interface;
7. It supports multiple sleep modes, and the current reaches 6.5ua in deep sleep;
8. Embedded LwIP and FreeRTOS;
9. Support STA/AP/STA+AP mode;
10. Support Smart Config / Airkiss one key distribution network;
11. General at command, easy to use;
12. Support local serial port upgrade and remote upgrade (FOTA).

Specification:
SPIFlash: default 32Mbit
Bluetooth-compatible: Bluetooth-compatible 4.2 BR/EDR and BLE standards
Supporting interfaces: UART, SPI, SDIO, I2C, PWM, I2S, IR, ADC, DAC
On chip sensors: Hall sensor, temperature sensor, capacitive touch sensor
IO port: 22pcs
Serial port rate: 115200 BPS by default
Spectrum range: 2412 ~ 2484MHz
Antenna form: PCB antenna on board, gain 2dBi
Transmitting power: 802.11b: 17 ± 2dbm (11Mbps) 802.11g: 14 + 2dbm (54Mbps) 802.11n: 13 ± 2dbm (MCS7)
Receiving sensitivity: CCK, 1Mbps: - 90dbm CCK, 11Mbps: - 85dBm 6Mbps (1 / 2bpsk): - 88dbm 54Mbps (3 / 464-qam): - 70dBm mcs7 (65mbps, 72.2mbps): - 67dbm
Power consumption: 300mA 3.3V
Security: WPA / WPA2 / WPA2 Enterprise / WPS
Power supply range: USB power supply: 5V pin power supply: 5.0V~12V
Working temperature: - 20 ~ 85 ℃
Storage environment: - 40 ~ 90℃, < 90% RH
Product size: 52 * 29 * 15mm/2.04*1.14*0.59''



