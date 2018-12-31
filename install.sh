## install.sh
# Install      :
# cd /home/pi
# git clone https://github.com/rinalim/RemoteMarquee.git
# cd /home/pi/RemoteMarquee/
# chmod 755 install.sh
# sudo ./install.sh
#
# Reference    :
# https://github.com/ipromiseyou/RetroPie-AutoSet.git
# https://github.com/zzeromin/RetroPie-OLED.git

cd /home/pi/RemoteMarquee/
#cp runcommand-onstart.sh /opt/retropie/configs/all/
#cp runcommand-onend.sh /opt/retropie/configs/all/
sudo sed -i '/rom_name/d' /opt/retropie/configs/all/runcommand-onstart.sh 
echo 'rom_name=$3' >> /opt/retropie/configs/all/runcommand-onstart.sh 
echo 'rom_name="${rom_name##*/}"' >> /opt/retropie/configs/all/runcommand-onstart.sh 
echo 'rom_name="${rom_name%.*}"' >> /opt/retropie/configs/all/runcommand-onstart.sh 
echo 'echo "$1 $rom_name" > /tmp/remotemarquee.log' >> /opt/retropie/configs/all/runcommand-onstart.sh 

#sed -i '1i\\/usr/bin/python /home/pi/RemoteMarquee/RemoteMarquee.py &' /opt/retropie/configs/all/autostart.sh
apt-get install -y imagemagick sysstat libjpeg8-dev
git clone https://github.com/jacksonliam/mjpg-streamer.git
cd mjpg-streamer/mjpg-streamer-experimental
make
make install
chgrp -R -v pi /home/pi/RemoteMarquee
chown -R -v pi /home/pi/RemoteMarquee
chgrp -R -v pi /opt/retropie/configs/all
chown -R -v pi /opt/retropie/configs/all
echo "Setup Completed. Reboot after 3 Seconds."
sleep 3
reboot
