#!/system/bin/sh

if [ ! -d "/data/tp" ]; then
    mkdir /data/tp
    chmod 0775 /data/tp
    chown system:system /data/tp
else
    rm /data/tp/*
fi


####### letv x800 #######

if [ -e "/sys/bus/i2c/devices/2-004b/touch/double_click_wake_enable" ]; then
	chown system:system /sys/bus/i2c/devices/2-004b/touch/double_click_wake_enable
	ln -s /sys/bus/i2c/devices/2-004b/touch/double_click_wake_enable /data/tp/easy_wakeup_gesture
fi

