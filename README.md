# IoD-ButtSniffer
IoD Bluetooth Sniffer rPi solution

Hardware: Raspberry Pi model 3
OS: Raspian Stretch Lite (2017-11-29)
Additional Hardware: DS3231 Real-time Clock
Bluetooth Adapter: Asus BT400 USB

Boot fresh image
login
enable ssh and i2c
apt-get install git
run "sudo sh setup_system.sh"
dnsmasq/dhcpd will show an error, just ignore


setup_BT_FW.sh
dmesg | grep -i "Direct firmware load for " | cut -d ' ' -f 12 > /tmp/fw_name
cp ~/broadcom-bt-firmware/"cat /tmp/fw_name" /lib/firmware/brcm  --Still working on syntax
