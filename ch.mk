# Sabermod configs
O3_OPTIMIZATIONS := true
TARGET_SM_AND := 4.8
TARGET_SM_KERNEL := 4.9
TARGET_LIB_VERSION := 4.8
ENABLE_PTHREAD := true

$(call inherit-product, device/htc/m8/full_m8.mk)

# Enhanced NFC
$(call inherit-product, vendor/ch/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/ch/config/common_full_phone.mk)

PRODUCT_NAME := ch_m8
