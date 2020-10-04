#!/bin/sh

echo 'Running ConfigurePlex.sh'

#Plex Installation
#https://pimylifeup.com/raspberry-pi-plex-server/

sudo apt -y install apt-transport-https
sudo curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
sudo apt-get -y update

sudo apt -y install plexmediaserver

echo 'Finished'
