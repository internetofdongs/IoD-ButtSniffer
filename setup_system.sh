#!/bin/sh

#install AP mode utilities
sudo apt-get update
sudo apt-get -y install dnsmasq hostapd ntp i2c-tools screen

#Deny dhcp client on our static wireless interface
sudo echo denyinterfaces wlan0 >> /etc/dhcpcd.conf

#Copy our static configuration to the systems interfaces file
sudo cp interfaces /etc/network/interfaces

#Cycle the dhcp client to use the new config and bounce the wireless interface
sudo service dhcpcd restart
sudo ifdown wlan0
sudo ifup wlan0

#Backup original config files and copy our new ones in their place
sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.bak
sudo cp dnsmasq.conf /etc/dnsmasq.conf
sudo mv /etc/hostapd/hostapd.conf /etc/hostapd/hostapd.conf.bak
sudo cp hostapd.conf /etc/hostapd/hostapd.conf

#Specify which config file to use for hostapd which sets the daemon to start at boot
sudo echo DAEMON_CONF="/etc/hostapd/hostapd.conf" >> /etc/default/hostapd

#Restart hostapd and dnsmasq
sudo service hostapd start
sudo service dnsmasq start

#Install hw clock and Kismet startup script

sudo cp rc.local /etc/rc.local

