#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2019-2023 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

FOX_MANIFEST_ROOT=$(gettop)
if [ -f $FOX_MANIFEST_ROOT/bootable/recovery/orangefox_defaults.go -a -f $FOX_MANIFEST_ROOT/bootable/recovery/orangefox.mk ]; then
    if [ -z "$TW_DEFAULT_LANGUAGE" ]; then
        unset TW_DEFAULT_LANGUAGE
        export TW_DEFAULT_LANGUAGE="ru"
    fi

    # Build
    export LC_ALL="C"
    export FOX_VERSION=$(date +%y.%m.%d)
    export ALLOW_MISSING_DEPENDENCIES=true
    export TARGET_DEVICE_ALT="P3"
    export OF_VIRTUAL_AB_DEVICE=0
    export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
    export OF_SUPPORT_OZIP_DECRYPTION=1
    export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/by-name/vendor_boot"
    export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
    export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
    export OF_MAINTAINER="lopestom"

#    # Custom pic for the maintainer's info in about section
#    export OF_MAINTAINER_AVATAR="$PWD/device/ulefone/Armor_12S/maintainer.png"

    # Magiskboot
    export OF_USE_MAGISKBOOT=1
    export OF_AB_DEVICE=0
    export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1


    # Magisk
#    export FOX_USE_SPECIFIC_MAGISK_ZIP="$FOX_MANIFEST_ROOT/device/ulefone/Armor_12S/Magisk/Magisk-v25.2.zip"
## Use the Latest Release of Magisk for the OrangeFox addon
export OF_USE_LATEST_MAGISK=true

    # Binaries
    export FOX_USE_BASH_SHELL=1
    export FOX_ASH_IS_BASH=1
    export FOX_USE_NANO_EDITOR=1
    export FOX_USE_GREP_BINARY=1
    export FOX_USE_TAR_BINARY=1
    export FOX_USE_ZIP_BINARY=1
    export FOX_USE_SED_BINARY=1
    export FOX_REPLACE_TOOLBOX_GETPROP=1
    export FOX_USE_XZ_UTILS=1
    export FOX_REPLACE_BUSYBOX_PS=1
    export OF_ENABLE_LPTOOLS=1

    # Decryption
    export OF_FBE_METADATA_MOUNT_IGNORE=1
    export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
    export OF_NO_RELOAD_AFTER_DECRYPTION=1

    # Screen
    export OF_SCREEN_H=2400
    export OF_STATUS_H=50
    export OF_STATUS_INDENT_LEFT=48
    export OF_STATUS_INDENT_RIGHT=48
    export OF_HIDE_NOTCH=1
    export OF_CLOCK_POS=1
    export OF_ALLOW_DISABLE_NAVBAR=0

    # Backup
    export OF_QUICK_BACKUP_LIST="/vendor_boot;/persist;/data;/nvram;/boot;"

export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
export CCACHE_MAXSIZE="5G"
export CCACHE_DIR="~/ccache"

if [ ! -d ${CCACHE_DIR} ];
then
  echo "CCACHE Directory/Partition is not mounted at \"${CCACHE_DIR}\""
  echo "Please edit the CCACHE_DIR build variable or mount the directory."
fi

export LC_ALL="C"

# Clone to fix build on minimal manifest
git clone https://android.googlesource.com/platform/external/gflags/ -b android-12.1.0_r4 external/gflags

    # OTA
    export OF_PATCH_AVB20=1
    # export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
    export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1

    # Others
    export OF_USE_GREEN_LED=0
    export OF_FLASHLIGHT_ENABLE=0
    

    if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
        export | grep "FOX" >>$FOX_BUILD_LOG_FILE
        export | grep "OF_" >>$FOX_BUILD_LOG_FILE
        export | grep "TARGET_" >>$FOX_BUILD_LOG_FILE
        export | grep "TW_" >>$FOX_BUILD_LOG_FILE
    fi
fi
