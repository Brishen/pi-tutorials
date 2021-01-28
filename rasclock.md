
# Installing the Rasclock

1. Edit /boot/config.txt (`sudo nano /boot/config.txt`) by adding or editing the following line so that it contains:

        dtoverlay=i2c-rtc,pcf2127
	
2. Restart: `shutdown`
 
3. Edit `/lib/udev/hwclock-set` by commenting out these lines: 

        if [ -e /run/systemd/system ] ; then
            exit 0
        fi
    
4. Comment out the two lines in `/lib/udev/hwclock-set` which contain `--systz`
 
## Getting and Setting the time
### System Time
To set the system time, use the program `timedatectl`

To see the status:

     timedatectl show

To set the time:

    timedatectl set-time "2021-01-28 13:18:0"

To set the timezone

	timedatectl set-timezone America/Denver

### RTC Time
To read the time from the clock module:
    
    sudo hwclock -r 

## Synchronizing the two clocks
To adjust the system time to match the RTC clock:

    timedatectl --adjust-system-clock set-local-rtc	
   
To adjust the RTC clock to match system time, use:

    timedatectl set-local-rtc 0

If `1` is used instead of `0`, the RTC will use local time (not recommended).

### hwclock

To copy the time from the clock module to the system:
    
    sudo hwclock -s
