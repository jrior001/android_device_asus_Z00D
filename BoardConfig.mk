#
# Copyright 2013 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_ARCH := x86
TARGET_ARCH_VARIANT := x86-atom
TARGET_CPU_ABI := x86
TARGET_CPU_ABI2 := armeabi-v7a
TARGET_CPU_ABI_LIST := x86,armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_32_BIT := x86,armeabi-v7a,armeabi
#TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := x86


TARGET_BOARD_PLATFORM := clovertrail
TARGET_BOOTLOADER_BOARD_NAME := clovertrail
TARGET_USERIMAGES_USE_EXT4 := true
#TARGET_USERIMAGES_USE_F2FS := true

#TARGET_DROIDBOOT_LIBS := libintel_droidboot

# Adb
BOARD_FUNCTIONFS_HAS_SS_COUNT := true

# Binder API version
#TARGET_USES_64_BIT_BINDER := true

# Bootloader
TARGET_OTA_ASSERT_DEVICE := Z00D
# bootstub as 2nd bootloader
#TARGET_BOOTLOADER_IS_2ND := true

# Charger
#BOARD_HEALTHD_CUSTOM_CHARGER_RES := device/asus/zenfone2/charger/images

# EGL
BOARD_EGL_CFG := device/asus/Z00D/configs/egl.cfg

# Init
TARGET_IGNORE_RO_BOOT_SERIALNO := true

# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/asus/Z00D
TARGET_KERNEL_ARCH := x86
BOARD_KERNEL_IMAGE_NAME := bzImage
TARGET_KERNEL_CONFIG := cyanogenmod_Z00D_defconfig
KERNEL_SOC := ctp
TARGET_KERNEL_CROSS_COMPILE_PREFIX := x86_64-linux-android-

# Kernel cmdline
BOARD_KERNEL_CMDLINE := init=/init pci=noearly loglevel=0 vmalloc=256M androidboot.hardware=mofd_v1 watchdog.watchdog_thresh=60 androidboot.spid=xxxx:xxxx:xxxx:xxxx:xxxx:xxxx androidboot.serialno=01234567890123456789 snd_pcm.maximum_substreams=8 ip=50.0.0.2:50.0.0.1::255.255.255.0::usb0:on debug_locks=0 n_gsm.mux_base_conf=\"ttyACM0,0 ttyXMM0,1\"
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
#TARGET_PREBUILT_KERNEL := device/asus/Z00D/bzImage

# prebuild source kernel
BOARD_CUSTOM_BOOTIMG_MK := device/asus/Z00D/intel-boot-tools/boot.mk
BOARD_CUSTOM_MKBOOTIMG := device/asus/Z00D/intel-boot-tools/boot.mk
DEVICE_BASE_BOOT_IMAGE := device/asus/Z00D/base_images/boot_118.img
DEVICE_BASE_RECOVERY_IMAGE := device/asus/Z00D/base_images/recovery_118.img

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2415919104
BOARD_FLASH_BLOCK_SIZE := 2048
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 1677721600
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_USERDATAIMAGE_PARTITION_SIZE := 59261286400

# PowerHAL
#TARGET_POWERHAL_VARIANT := mofd_v1

# Recovery
BOARD_CANT_BUILD_RECOVERY_FROM_BOOT_PATCH := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_RECOVERY_FSTAB := device/asus/Z00D/recovery/root/etc/twrp.fstab
TARGET_RECOVERY_DEVICE_MODULES := libinit_Z00D
TARGET_RECOVERY_UPDATER_LIBS += libintel_updater

# SELinux
# BOARD_SEPOLICY_DIRS += device/asus/Z00D/sepolicy

# TWRP
TW_THEME := portrait_hdpi
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_INCLUDE_CRYPTO := true
TW_EXCLUDE_SUPERSU := true
TW_NO_USB_STORAGE := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_INCLUDE_NTFS_3G := true
BOARD_SUPPRESS_EMMC_WIPE := true
RECOVERY_VARIANT := twrp
