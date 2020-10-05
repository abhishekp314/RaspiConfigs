#!/bin/sh
#https://pimylifeup.com/raspberry-pi-deluge/

echo 'Installing Deluge'

if [ $# -ne 1 ]
then
echo 'Error: You need to specify password'
exit 0
fi

sudo apt -y install deluged deluge-web deluge-console python-mako

deluged
sudo pkill -i deluged

echo "pi:$1:10" >> ~/.config/deluge/auth

deluged
deluge-console "config -s allow_remote True"

deluge-web -f

echo 'Finished'
echo 'Access the deluge on web at <ip_address>:8112. Password: deluge'