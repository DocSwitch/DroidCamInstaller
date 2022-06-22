#author: WhiteShield <whiteshield.tg@protonmail.com> @ Wed Jun 22, 2022
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
echo "width=1280" >> /etc/modprobe.d/droidcam.conf
echo "height=720" >> /etc/modprobe.d/droidcam.conf #for HD 720p
