#set property for wifi firmware version
setprop wifi.version.driver 7.10.324.4
#set property for wifi mac address
#cat /data/asusdata/mac.txt | grep MacAddress0 | sed 's/^.*MacAddress0=//g' | xargs setprop ro.wifimac
