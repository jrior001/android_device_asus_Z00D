LOG_TAG=BTWIFIMACDBG
/system/bin/log -t $LOG_TAG -p i "btwifimac strat"
while [ 1 ]
do
   /system/bin/log -t $LOG_TAG -p i "wait for post_fs_data_done"
   file_ready=`getprop vold.post_fs_data_done`
   /system/bin/log -t $LOG_TAG -p i "vold.post_fs_data_done $file_ready"
   if [ $file_ready -eq "1" ]
      then
      /system/bin/log -t $LOG_TAG -p i "enter if"
      break;
   fi
   usleep 500000
done
/system/bin/log -t $LOG_TAG -p i "post_fs_data_done complete"
setprop ro.btmac `cat /factory/bd_addr.conf`
/system/bin/log -t $LOG_TAG -p i "btmac $btmac"
wifi_mac=`grep "MacAddress0" /factory/mac.txt`
wifi_mac=${wifi_mac//MacAddress0=/ }
/system/bin/log -t $LOG_TAG -p i "wifi_mac $wifi_mac"
setprop ro.wifimac $wifi_mac
/system/bin/log -t $LOG_TAG -p i "btwifimac end"
