#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/xiaomi/lotus

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# Assert
TARGET_OTA_ASSERT_DEVICE := lotus

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432 # This is the maximum known partition size, but it can be higher, so we just omit it
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive androidboot.configfs=true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x14f88000
BOARD_KERNEL_TAGS_OFFSET := 0x13f88000
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/xiaomi/lotus
TARGET_KERNEL_CONFIG := lotus_defconfig

# Platform
TARGET_BOARD_PLATFORM := mt6765

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true

# Decryption support for /data
TW_INCLUDE_CRYPTO := true
#SHOUD I include?
#TARGET_HW_DISK_ENCRYPTION := true

# decrease default brightness
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_DEFAULT_BRIGHTNESS := 100

# Debugging
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true

TW_EXCLUDE_NANO := false
#TW_EXCLUDE_MTP := false
#TW_MTP_DEVICE := /dev/usb-ffs/adb/ep2



#added to test cactus decryption files
#TW_RECOVERY_ADDITIONAL_RELINK_FILES += \
 #  $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/hw/android.hardware.keymaster@3.0-impl.so \
  # $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/hw/android.hardware.gatekeeper@1.0-impl.so \
  # $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/hw/vendor.mediatek.hardware.keymaster_attestation@1.1-impl.so \
  # $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/hw/keystore.mt6765.so \
  # $(TARGET_OUT_VENDOR_EXECUTABLES)/hw/android.hardware.keymaster@3.0-service \
  # $(TARGET_OUT_VENDOR_EXECUTABLES)/hw/android.hardware.gatekeeper@1.0-service \
  # $(TARGET_OUT_VENDOR_EXECUTABLES)/hw/vendor.mediatek.hardware.keymaster_attestation@1.1-service \
 #  $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymaster3device.so \
 #  $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

# system.prop
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop
