echo "If your Bluetooth adapter is complaining about needing a firmware, like this:"

echo "bluetooth hci1: Direct firmware load for brcm/BCM20702A1-0b05-17cb.hcd failed with error -2"
echo "Bluetooth: hci1: BCM: Patch brcm/BCM20702A1-0b05-17cb.hcd not found"

echo "Run this script to download the various firmwares for broadcom based adapters and copy the .hcd file"
echo "that it is complaining about from the ~/broadcom-bt-firmware/brcm/ directory to /lib/firmware/brcm, then reboot or reinsert the adapter"

cd ~/
git clone https://github.com/winterheart/broadcom-bt-firmware.git

