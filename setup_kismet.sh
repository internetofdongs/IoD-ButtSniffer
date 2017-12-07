#!/bin/sh

#Update system repos and upgrade to latest
sudo apt-get update && sudo apt-get -y dist-upgrade && sudo apt-get autoclean && sudo apt-get autoremove

#Get dependancies for Kismet
sudo apt-get -y install build-essential libmicrohttpd-dev git libnl-3-dev libnl-genl-3-dev libcap-dev libpcap-dev libncurses5-dev libnm-dev libdw-dev libsqlite3-dev libncurses5-dev libnm-dev libdw-dev libsqlite3-dev libbluetooth-dev

#Clone the Kismet Git repo, configure and build, installing as suid root
git clone https://github.com/kismetwireless/kismet.git

echo "If you are building this on a Raspberry Pi, go get a coffee, it'll take a while"

cd kismet && ./configure && make && sudo make suidinstall

#Add current user to kismet group to run as suidroot
sudo usermod -a -G kismet $USER

#Copy Kismet configs
cd ..
cp kismet_httpd.conf kismet_site.conf kismet_logging.conf kismet_storage.conf ~/.kismet


#Create ButtSniffer data directory
cd ~/
mkdir ~/ButtSniff_Data

#Install IoD-Screwdriver plugin
cd ~/
git clone https://github.com/internetofdongs/IoD-Screwdriver
cd IoD-Screwdriver/plugin-iod-screwdriver
sudo make install

#Install Kismet Mobile Dashboard
cd ~/kismet
git clone https://github.com/elkentaro/KismetMobileDashboard.git
cd ~/kismet/KismetMobileDashboard && sudo make install
