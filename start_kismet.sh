#!/bin/sh

su pi -c 'sudo screen -S kismet -d -m kismet -c hci0 -c hci1 -c hci2'
