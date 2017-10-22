#!/bin/sh

#Get dependancies for Kismet
sudo apt-get install build-essential libmicrohttpd-dev git libnl-3-dev libnl-genl-3-dev libcap-dev libpcap-dev libncurses5-dev libnm-dev libdw-dev libsqlite3-dev libncurses5-dev libnm-dev libdw-dev libsqlite3-dev libbluetooth-dev

#Clone the Kismet Git repo, configure and build, installing as suid root
git clone https://github.com/kismetwireless/kismet.git
cd kismet
./configure
echo "If you are building this on a Raspberry Pi, go get a coffee, it'll take a while"
make
sudo make suidinstall

#Add current user to kismet group to run as suidroot
sudo usermod -a -G kismet $USER

#Install IoD-Screwdriver plugin
cd ~/
git clone https://github.com/internetofdongs/IoD-Screwdriver
cd IoD-Screwdriver/plugin-iod-screwdriver
sudo make install
cd ~/
mkdir ~/ButtSniff_Data



