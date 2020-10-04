#!/bin/sh

# Samba setup
# https://pimylifeup.com/raspberry-pi-samba/

echo 'Install Samba'
sudo apt -y install samba samba-common-bin

sudo echo '
[YSpace]
path = /mnt/YSpace
writeable=Yes
create mask=0777
directory mask=0777
public=no
smb encrypt = disabled

[CSpace]
path = /mnt/CSpace
writeable=Yes
create mask=0777
directory mask=0777
public=no
smb encrypt = disabled
' >> /etc/samba/smb.conf

sudo smbpasswd -a pi

sudo systemctl restart smbd
