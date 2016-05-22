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
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := x86

TARGET_SPECIFIC_HEADER_PATH := device/asus/Z00D/include

TARGET_BOARD_PLATFORM := clovertrail
TARGET_BOOTLOADER_BOARD_NAME := clovertrail
TARGET_USERIMAGES_USE_EXT4 := true
#TARGET_USERIMAGES_USE_F2FS := true

#TARGET_DROIDBOOT_LIBS := libintel_droidboot

# Adb
BOARD_FUNCTIONFS_HAS_SS_COUNT := true

# Audio
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true
BOARD_USES_TINY_ALSA_AUDIO := true

# Binder API version
TARGET_USES_64_BIT_BINDER := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/asus/Z00D/bluetooth

# Bootloader
TARGET_OTA_ASSERT_DEVICE := Z00D
# bootstub as 2nd bootloader
#TARGET_BOOTLOADER_IS_2ND := true

# Charger
BOARD_HEALTHD_CUSTOM_CHARGER_RES := device/asus/Z00D/charger/images
BOARD_CHARGER_ENABLE_SUSPEND := true

# Hardware
BOARD_HARDWARE_CLASS := device/asus/Z00D/cmhw

# Houdini: enable ARM codegen for x86
BUILD_ARM_FOR_X86 := true

# EGL
BOARD_EGL_CFG := device/asus/Z00D/configs/egl.cfg
USE_OPENGL_RENDERER := true

# IMG graphics
ENABLE_IMG_GRAPHICS := true
HWUI_IMG_FBO_CACHE_OPTIM := true
TARGET_INTEL_HWCOMPOSER_FORCE_ONLY_ONE_RGB_LAYER := true

# IMG Graphics: System's VSYNC phase offsets in nanoseconds
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000

# Opengles
COMMON_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH -DWORKAROUND_BUG_10194508
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.opengles.version = 131072

INTEL_VA := true
BUILD_WITH_FULL_STAGEFRIGHT := true
BOARD_USES_VIDEO := true

# Disable IMG RS GPU driver
# OVERRIDE_RS_DRIVER := libPVRRS.so

# Init
TARGET_IGNORE_RO_BOOT_SERIALNO := true

# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/asus/Z00D
TARGET_KERNEL_ARCH := x86
BOARD_KERNEL_IMAGE_NAME := bzImage
TARGET_KERNEL_CONFIG := cyanogenmod_Z00D_defconfig
KERNEL_SOC := ctp
TARGET_KERNEL_CROSS_COMPILE_PREFIX := x86_64-linux-android-
NEED_KERNEL_MODULE_ROOT := true

# Kernel cmdline
BOARD_KERNEL_CMDLINE := init=/init pci=noearly console=ttyS0 console=logk0 earlyprintk=nologger bootup.uart=0 loglevel=8 kmemleak=off androidboot.bootmedia=sdcard androidboot.hardware=redhookbay watchdog.watchdog_thresh=60 androidboot.spid=xxxx:xxxx:xxxx:xxxx:xxxx:xxxx androidboot.serialno=01234567890123456789 ip=50.0.0.2:50.0.0.1::255.255.255.0::usb0:on vmalloc=172M bootboost=1
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

# prebuild source kernel
BOARD_CUSTOM_BOOTIMG_MK := device/asus/Z00D/intel-boot-tools/boot.mk
BOARD_CUSTOM_MKBOOTIMG := device/asus/Z00D/intel-boot-tools/boot.mk
DEVICE_BASE_BOOT_IMAGE := device/asus/Z00D/base_images/boot_118.img
DEVICE_BASE_RECOVERY_IMAGE := device/asus/Z00D/base_images/recovery_118.img

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Media
BOARD_USES_WRS_OMXIL_CORE := true
BOARD_USES_MRST_OMX := true

# Media: DRM Protected Video
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 1
# USE_INTEL_SECURE_AVC := true

# Partitions
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2415919104
BOARD_FLASH_BLOCK_SIZE := 2048
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 1677721600
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_USERDATAIMAGE_PARTITION_SIZE := 59261286400

# PowerHAL
TARGET_POWERHAL_VARIANT := clovertrail

# Recovery
BOARD_CANT_BUILD_RECOVERY_FROM_BOOT_PATCH := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_RECOVERY_FSTAB := device/asus/Z00D/recovery.fstab
TARGET_RECOVERY_DEVICE_MODULES := libinit_Z00D
TARGET_RECOVERY_UPDATER_LIBS += libintel_updater

# Releasetools
BLOCK_BASED_OTA := false
TARGET_RELEASETOOLS_EXTENSIONS := device/asus/Z00D/releasetools
TARGET_RELEASETOOL_MAKE_RECOVERY_PATCH_SCRIPT := device/asus/Z00D/releasetools/make_recovery_patch
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/asus/Z00D/releasetools/ota_from_target_files

# SELinux
# BOARD_SEPOLICY_DIRS += device/asus/Z00D/sepolicy

# Wifi
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER        := NL80211
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/asusfw/wifi/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/asusfw/wifi/fw_bcmdhd.bin"

# Use the non-open-source parts, if they're present
-include vendor/asus/Z00D/BoardConfigVendor.mk

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
#RECOVERY_VARIANT := twrp
