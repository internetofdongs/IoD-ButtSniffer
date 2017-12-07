# IoD-ButtSniffer
IoD Bluetooth Sniffer rPi solution

## Hardware: 

Raspberry Pi 3 model B - (https://www.raspberrypi.org/products/raspberry-pi-3-model-b/)
DS3231 Real Time Clock - (https://www.amazon.ca/Source-Hardware-Raspberry-Foreign-Precision/dp/B077LPJHXK/ref=sr_1_2)
Asus BT400 USB Bluetooth 4.0 adapter (https://www.amazon.ca/ASUS-USB-Adapter-Bluetooth-USB-BT400/dp/B00DJ83070/ref=sr_1_1)
>=8gb MicroSD card for Pi

## Software: 

OS: Raspian Stretch Lite (Built and tested on release 2017-11-29) (https://www.raspberrypi.org/downloads/raspbian/)
Scanner: Kismet Wireless Scanner (https://kismetwireless.net/)
Kismet Plugin: IoD-Screwdriver IoD device highlighting plugin (https://github.com/internetofdongs/IoD-Screwdriver.git)
Kismet Plugin: Kismet Mobile Dashboard (https://github.com/elkentaro/KismetMobileDashboard)
BT Firmware: WinterHeart Broadcom Firmware repository (https://github.com/winterheart/broadcom-bt-firmware)

### This uses the new Kismet Development branch which is changing daily and a moving target.  Things may break from time to time.


## Assumptions:

rPi3 onboard Bluetooth and two BT400's all used for scanning
rPi3 onboard Wi-Fi used as access point for service data
rPi3 onboard Ethernet is set to DHCP for LAN access and data access
DS3231 RTC module for maintaining the clock sync for accurate logs
Mobile device (phone/tablet) used for accessing web interface to monitor data collection
System can be run easily off of USB 5v battery packs with 2.1 AMP capability. Runtime determined by capacity of battery pack
Unit can used for static installation as well over LAN connection as well
Usernames and Passwords assumed to be default but any sudo capable user should work
Installation assumes Internet access via LAN Ethernet connection

## Install Instructions:

- Write Raspian image to SD card as per normal and boot the image

- Install git via apt-get (sudo apt-get install git)

- Grab the IoD-ButtSniffer scripts (git clone https://github.com/internetofdongs/IoD-ButtSniffer)

- Change into the IoD-ButtSniffer directory (cd IoD-ButtSniffer) and run the scripts:

There are 3 main scripts to run and should be run in this order:

1. setup_system.sh - Sets up the system, installs dependancies 
and configurations for various system services

2. setup_kismet.sh - Download kismet dependancies, the git 
repository and plugins.  It then builds kismet, the plugins, 
copies the config files, and sets up the data directory

3. setup_BT_FW - (Optional) - If your Bluetooth adapter is complaining in dmesg about needing a firmware:

```
Bluetooth hci1: Direct firmware load for brcm/BCM20702A1-0b05-17cb.hcd failed with error -2"
Bluetooth: hci1: BCM: Patch brcm/BCM20702A1-0b05-17cb.hcd not found"
```

Run this script to download the various firmwares for broadcom based adapters and copy the .hcd file that it is looking for (i.e. 
BCM20702A1-0b05-17cb.hcd) from the ~/broadcom-bt-firmware/brcm/ directory to /lib/firmware/brcm/, then reboot or reinsert the adapter"

## Errata

On boot, dnsmasq/dhcpd will show an error, just ignore it. I still need to figure this out. Its an issue with the interfaces file and 
dhcpcd.conf file


## TO DO

Menus and install questions to allow various configuration options
