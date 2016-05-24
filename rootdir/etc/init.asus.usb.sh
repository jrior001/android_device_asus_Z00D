#!/system/bin/sh

#
# Add support for exposing lun0 as cdrom in mass-storage
#
cdromname="/system/etc/cdrom_install.iso"
per_sysusbconfig=`getprop persist.sys.usb.config`
if [ -f $cdromname ]; then 
	setprop persist.service.cdrom.enable 1
	echo "mounting usbcdrom lun" > /dev/kmsg
	echo $cdromname > /sys/class/android_usb/android0/f_mass_storage/lun0/file
	case "$per_sysusbconfig" in
		"mtp,adb")
			setprop persist.sys.usb.config mtp,adb,mass_storage
		;;
		"mtp")
			setprop persist.sys.usb.config mtp,mass_storage
		;;
	esac
else 
	setprop persist.service.cdrom.enable 0
	echo "" > /sys/class/android_usb/android0/f_mass_storage/lun0/file
	case "$per_sysusbconfig" in
		"mtp,adb,mass_storage")
			setprop persist.sys.usb.config mtp,adb
		;;
		"mtp,mass_storage")
			setprop persist.sys.usb.config mtp
		;;
	esac
fi

# ASUS_BSP+++ BennyCheng "set SSN as usb serial number"
ls_ssn=`ls /factory/SSN`
case "$ls_ssn" in
	*SSN*)
		ssn_value=`cat /factory/SSN`
		echo "$ssn_value\c" > /sys/class/android_usb/android0/iSerial
	;;
	* )
		echo "C4ATAS000000\c" > /sys/class/android_usb/android0/iSerial
	;;
esac
# ASUS_BSP--- BennyCheng "set SSN as usb serial number"

# ASUS_BSP+++ BennyCheng "enable the adb of user build for factory ship procedure"
adb_on=`ls /config/.adb_on`
case "$adb_on" in
	*.adb_on*)
		setprop sys.usb.adbon 1
		rm /config/.adb_on
		setprop debug.asus.adbon 1
	;;
esac
# ASUS_BSP--- BennyCheng "enable the adb of user build for factory ship procedure"

# ASUS_BSP+++ BennyCheng "enable acm by engineer mode for AT&T requirement"
acm_file_exist=`ls /config/.acm_enable`
case "$acm_file_exist" in
	*.acm_enable*)
		setprop persist.usb.diag 1
	;;
esac
# ASUS_BSP--- BennyCheng "enable acm by engineer mode for AT&T requirement"

ls_eye=`ls /factory/usbeye`
case "$ls_eye" in
	*usbeye*)
		eye_value=`cat /factory/usbeye`
		echo "usb-sh: echo value ($eye_value) to eye diagram" > /dev/kmsg
		echo "$eye_value\c" > /proc/asus_otg/eye_diagram
		echo 1 > /sys/class/usb_otg/otg0/device/inputs/ulpi_err
	;;
esac
