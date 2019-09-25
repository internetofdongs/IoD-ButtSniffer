#!/bin/sh

su pi -c 'sudo screen -S kismet -d -p ~/ButtSniff_Data -m kismet -c hci0 -c hci1 -c hci2'
