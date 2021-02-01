sudo echo "dtoverlay=i2c-rtc,pcf2129" >> /boot/firmware/config.txt
sudo rm /lib/systemd/system/hwclock.service
sudo cp hwclock.service /lib/systemd/system/hwclock.service
sudo systemctl daemon-reload
sudo systemctl enable hwclock
