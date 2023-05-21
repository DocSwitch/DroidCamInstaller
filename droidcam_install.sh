#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
dnf install libappindicator-gtk3 android-tools kernel-devel kernel kernel-headers gcc make  #only for Fedora>33 machines
cd /tmp/
wget -O droidcam_latest.zip https://files.dev47apps.net/linux/droidcam_1.8.2.zip
unzip droidcam_latest.zip -d droidcam
cd droidcam
./install-client
./install-video
./install-sound
cd /etc/modprobe.d
cp droidcam.conf droidcam.conf.bak
rm droidcam.conf
touch droidcam.conf
echo "options v4l2loopback_dc width=1280 height=720" >> droidcam.conf #for HD 720p
echo "options snd-aloop index=1" >> droidcam.conf
