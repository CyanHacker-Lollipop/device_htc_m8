# Sabermod configs
TARGET_GCC_AND := 4.8-sm
TARGET_GCC_ARM := 4.9-sm
TARGET_LIB_VERSION := 4.8
ENABLE_PTHREAD := true
O3_OPTIMIZATIONS:= true
USE_LEGACY_GCC := false

$(call inherit-product, device/htc/m8/full_m8.mk)

# Enhanced NFC
$(call inherit-product, vendor/ch/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/ch/config/common_full_phone.mk)

PRODUCT_NAME := ch_m8
