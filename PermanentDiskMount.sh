#!/bin/sh

echo 'Running PermanentDiskMount.sh'

# Mount the disks -> https://pimylifeup.com/raspberry-pi-mount-usb-drive/
# /media/pi/YSpace -> /dev/sdb1: LABEL="YSpace" UUID="A6C249A3C2497897" TYPE="ntfs" PTTYPE="atari" PARTLABEL="Elements" PARTUUID="04a6dd1e-1e24-45fd-a988-f4b2a0587469"
# /media/pi/EHDD   -> /dev/sda2: LABEL="EHDD" UUID="F8682A4F682A0CC6" TYPE="ntfs" PARTLABEL="Basic data partition" PARTUUID="18773936-94cf-4a87-8bda-1433f643a31c"

echo 'Installing Prequisties'

sudo apt -y install ntfs-3g
sudo apt -y install exfat-fuse
sudo apt -y install exfat-utils

echo 'Creating Directories'

sudo mkdir -p /mnt/YSpace
sudo mkdir -p /mnt/CSpace
sudo chown -R pi:pi /mnt/YSpace
sudo chown -R pi:pi /mnt/CSpace

echo 'Adding new directories to fstab'

sudo echo 'UUID=A6C249A3C2497897 /mnt/YSpace ntfs defaults,auto,users,rw,nofail,noatime 0 0' >> /etc/fstab
sudo echo 'UUID=F8682A4F682A0CC6 /mnt/CSpace ntfs defaults,auto,users,rw,nofail,noatime 0 0' >> /etc/fstab

echo 'Unmount'
sudo umount /dev/sdb1
sudo umount /dev/sda2

echo 'Mount'
sudo mount -a

sudo sed '/exit 0/ i\ sleep 20\nsudo mount -a' /etc/rc.local

echo 'Finished'