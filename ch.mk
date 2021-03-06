################OPTIMIZATIONS###################
#Use Optimizations?
USE_OPTIMIZATIONS := true

ifneq ($(strip $(USE_OPTIMIZATIONS)),false)
include vendor/ch/config/sm_clear_vars.mk
# Find host os
UNAME := $(shell uname -s)

ifeq ($(strip $(UNAME)),Linux)
  HOST_OS := linux
endif

# Only use these compilers on linux host.
ifeq ($(strip $(HOST_OS)),linux)
#HACKIFY CONFIGURATION 

##Define ROM toolchain
TARGET_GCC_AND := 4.9-sm

##Define NDK toolchain
TARGET_NDK_VERSION := 4.9

##Define Kernel toolchain
TARGET_GCC_ARM := 4.9-sm

##Enable Pthread (only on newer devices)
ENABLE_PTHREAD := true

##Use Kernel Optimizations?
USE_KERNEL_OPTIMIZATIONS := true

##How many threads does the device have?
PRODUCT_THREADS := 4

GRAPHITE_KERNEL_FLAGS := \
    -floop-parallelize-all \
    -ftree-parallelize-loops=$(PRODUCT_THREADS) \
    -fopenmp

# Extra SaberMod GCC C flags for arch target and Kernel
export EXTRA_SABERMOD_GCC_VECTORIZE_CFLAGS := \
         -ftree-vectorize \
         -mvectorize-with-neon-quad

# General flags for gcc 4.9 to allow compilation to complete.
MAYBE_UNINITIALIZED := \
  hwcomposer.msm8974

ifeq ($(strip $(ENABLE_STRICT_ALIASING)),true)
  # strict-aliasing kernel flags
  export KERNEL_STRICT_FLAGS := \
           -fstrict-aliasing \
           -Werror=strict-aliasing

  # Enable strict-aliasing kernel flags
export CONFIG_MACH_MSM8974_HAMMERHEAD_STRICT_ALIASING := y
  LOCAL_DISABLE_STRICT_ALIASING := \
    libmmcamera_interface\
    camera.hammerhead
endif

else
$(error *  Please compile on a Linux host OS to use this optimizations)
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
