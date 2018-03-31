# Don't build debug for host or device
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
ART_BUILD_TARGET_NDEBUG := true
ART_BUILD_TARGET_DEBUG := false
ART_BUILD_HOST_NDEBUG := true
ART_BUILD_HOST_DEBUG := false

# Dex pre-opt
WITH_DEXPREOPT := true
DEX_PREOPT_DEFAULT := nostripping

# Preopt apks like GMS chimara modules
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true

# Create profile for boot image
# Outputs to /system/etc/boot-image.prof
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true

# Speed apps
PRODUCT_DEXPREOPT_SPEED_APPS += \
  SystemUI \
  Settings \
  NexusLauncherPrebuilt \
  GoogleCamera

# Dex pre-opt profiles
ifneq ($(wildcard vendor/dexoptProfiles/),)
  PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := speed-profile
  PRODUCT_DEX_PREOPT_PROFILE_DIR := vendor/dexoptProfiles
  WITH_DEX_PREOPT_GENERATE_PROFILE := true
else
  PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := speed
endif

