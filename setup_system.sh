#!/bin/sh

#install AP mode utilities
sudo apt-get update
sudo apt-get install dnsmasq hostapd

sudo echo denyinterfaces wlan1 >> /etc/dhcpcd.conf

sudo cat interfaces > /etc/network/interfaces

sudo service dhcpcd restart
sudo ifdown wlan1
sudo ifup wlan1

sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.bak
sudo cat dnsmasq.conf > /etc/dnsmasq.conf
sudo cp hostapd.conf /etc/hostapd/hostapd.conf

sudo echo DAEMON_CONF="/etc/hostapd/hostapd.conf" >> /etc/default/hostapd

sudo service hostapd start
sudo service dnsmasq start
