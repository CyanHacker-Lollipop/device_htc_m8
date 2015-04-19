################OPTIMIZATIONS###################
#Use Optimizations?
USE_OPTIMIZATIONS := true

ifneq ($(strip $(USE_OPTIMIZATIONS)),false)
#HACKIFY CONFIGURATION 

##Define ROM toolchain
TARGET_GCC_AND := 4.8-sm

##Define NDK toolchain
TARGET_NDK_VERSION := 4.9

##Define Kernel toolchain
TARGET_GCC_ARM := 4.9-sm

##Enable Pthread (only on newer devices)
ENABLE_PTHREAD := true

##Enable O3 Optimizations
O3_OPTIMIZATIONS:= true

##Use Kernel Optimizations?
USE_KERNEL_OPTIMIZATIONS := true

##Use Extra Optimizations?
USE_EXTRA_OPTIMIZATIONS := true

##How many threads does the device have?
PRODUCT_THREADS := 4

ifeq ($(strip $(USE_EXTRA_OPTIMIZATIONS)),true)
# Extra SaberMod GCC C flags for the ROM and Kernel
export EXTRA_SABERMOD_GCC_CFLAGS := \
         -ftree-loop-distribution \
         -ftree-loop-if-convert \
         -ftree-loop-im \
         -ftree-loop-ivcanon \
         -fprefetch-loop-arrays \
         -ftree-vectorize \
         -mvectorize-with-neon-quad \
         -pipe

# Extra SaberMod CLANG C flags
EXTRA_SABERMOD_CLANG_CFLAGS := \
  -fprefetch-loop-arrays \
  -ftree-vectorize \
  -pipe

OPT4 := -extra

GRAPHITE_KERNEL_FLAGS := \
  -floop-parallelize-all \
  -ftree-parallelize-loops=$(PRODUCT_THREADS) \
  -fopenmp

endif

endif
#################################################

##If you´re running an old device, set this to true
USE_LEGACY_GCC := false

$(call inherit-product, device/htc/m8/full_m8.mk)

# Enhanced NFC
$(call inherit-product, vendor/ch/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/ch/config/common_full_phone.mk)

PRODUCT_NAME := ch_m8
