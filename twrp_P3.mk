#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from Device specific configs.
$(call inherit-product, device/doogee/P3/device.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Product Specifics
PRODUCT_NAME := twrp_P3
PRODUCT_DEVICE := P3
PRODUCT_BRAND := DOOGEE
PRODUCT_MODEL := T30Ultra
PRODUCT_MANUFACTURER := DOOGEE

PRODUCT_GMS_CLIENTID_BASE := android-doogee
