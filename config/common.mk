# Copyright (C) 2017 AospExtended
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


include vendor/aosp/config/version.mk

include vendor/aosp/config/art.mk

PRODUCT_BRAND ?= AEX

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/aosp/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/aosp/prebuilt/common/bin/50-base.sh:system/addon.d/50-base.sh \
    vendor/aosp/prebuilt/common/bin/clean_cache.sh:system/bin/clean_cache.sh

# init.d script support
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/bin/sysinit:system/bin/sysinit

# Speed up compiling time
EXCLUDE_SYSTEMUI_TESTS := true

# Bootanimation
$(call inherit-product, vendor/aosp/config/bootanimation.mk)

DEVICE_PACKAGE_OVERLAYS += \
    vendor/aosp/overlay/common \
    vendor/aosp/overlay/dictionaries

# Custom AEX packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    LatinIME \
    Launcher3 \
    LiveWallpapers \
    LiveWallpapersPicker \
    Stk \
    Turbo \
    ViaBrowser \
    Retro \
    OmniJaws \
    OmniStyle \
    WallpaperPickerGoogle 
#    KernelAdiutor

#PRODUCT_PACKAGES += \
    ViPER4Android
#PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/viperfx/libv4a_fx_ics.so:system/lib/soundfx/libv4a_fx_ics.so \
    vendor/aosp/prebuilt/common/viperfx/libV4AJniUtils.so:system/lib/libV4AJniUtils.so \
    vendor/aosp/prebuilt/common/viperfx/audio_effects.conf:system/etc/audio_effects.conf

# Themes
# Accents
PRODUCT_PACKAGES += \
    PixelTheme \
    AmberAccent \
    BlackAccent \
    BlueAccent \
    BlueGreyAccent \
    BrownAccent \
    CyanAccent \
    DeepOrangeAccent \
    DeepPurpleAccent \
    GreenAccent \
    GreyAccent \
    IndigoAccent \
    LightBlueAccent \
    LightGreenAccent \
    LimeAccent \
    OrangeAccent \
    PinkAccent \
    PurpleAccent \
    RedAccent \
    TealAccent \
    YellowAccent \
    WhiteAccent

# Default permissions
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/etc/privapp-permissions-jdc.xml:system/etc/permissions/privapp-permissions-jdc.xml

# Fonts
PRODUCT_PACKAGES += \
    Custom-Fonts

# UI Variants
PRODUCT_PACKAGES += \
    SystemDarkTheme \
    SettingsDarkTheme \
    DuiDarkTheme \
    SystemBlackTheme \
    SettingsBlackTheme \
    DuiBlackTheme \
    SystemExtendedTheme \
    SettingsExtendedTheme \
    DuiExtendedTheme \

# Extra tools
PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs \
    mkfs.ntfs \
    fsck.ntfs \
    mount.ntfs \
    7z \
    bzip2 \
    curl \
    lib7z \
    powertop \
    pigz \
    tinymix \
    unrar \
    unzip \
    zip

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/aosp/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# init.d support
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner

# LatinIME gesture typing
ifeq ($(TARGET_ARCH),arm64)
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so \
    vendor/aosp/prebuilt/common/lib64/libjni_latinimegoogle.so:system/lib64/libjni_latinimegoogle.so
else
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so \
    vendor/aosp/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so
endif

# AEX-specific init file
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/etc/init.local.rc:root/init.aosp.rc

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/aosp/prebuilt/common/media/LMspeed_508.emd:system/media/LMspeed_508.emd \
    vendor/aosp/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Fix Dialer
PRODUCT_COPY_FILES +=  \
    vendor/aosp/prebuilt/common/etc/sysconfig/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl
    
# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

# Charging sounds
PRODUCT_COPY_FILES += \
    vendor/aosp/google/effects/BatteryPlugged.ogg:system/media/audio/ui/BatteryPlugged.ogg \
    vendor/aosp/google/effects/BatteryPlugged_48k.ogg:system/media/audio/ui/BatteryPlugged_48k.ogg \
    vendor/aosp/google/effects/GoodBattery.ogg:system/media/audio/ui/GoodBattery.ogg

# DU Utils Library
PRODUCT_PACKAGES += \
    org.dirtyunicorns.utils

PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils

# Needed by some RILs and for some gApps packages
PRODUCT_PACKAGES += \
    librsjni \
    libprotobuf-cpp-full

# Thematic ringtones
PRODUCT_COPY_FILES += \
    vendor/aosp/thematic/ringtones/1_Den_Pobedy.mp3:system/media/audio/ringtones/1_Den_Pobedy.mp3 \
    vendor/aosp/thematic/ringtones/2_Katyusha.mp3:system/media/audio/ringtones/2_Katyusha.mp3 \
    vendor/aosp/thematic/ringtones/3_Govorit_Moskva.mp3:system/media/audio/ringtones/3_Govorit_Moskva.mp3 \
    vendor/aosp/thematic/ringtones/4_Marsh.mp3:system/media/audio/ringtones/4_Marsh.mp3 \
    vendor/aosp/thematic/ringtones/5_Smuglyanka.mp3:system/media/audio/ringtones/5_Smuglyanka.mp3 \
    vendor/aosp/thematic/ringtones/6_Bronya_krepka.mp3:system/media/audio/ringtones/6_Bronya_krepka.mp3 \
    vendor/aosp/thematic/ringtones/7_My_za_cenoj_ne_postoim.mp3:system/media/audio/ringtones/7_My_za_cenoj_ne_postoim.mp3 \
    vendor/aosp/thematic/ringtones/8_Ne_plach_devchonka.mp3:system/media/audio/ringtones/8_Ne_plach_devchonka.mp3 \
    vendor/aosp/thematic/ringtones/9_Svyaschennaya_Voyna.mp3:system/media/audio/ringtones/9_Svyaschennaya_Voyna.mp3 \
    vendor/aosp/thematic/ringtones/10_V_zemlyanke.mp3:system/media/audio/ringtones/10_V_zemlyanke.mp3 \
    vendor/aosp/thematic/ringtones/11_Tyomnaya_noch.mp3:system/media/audio/ringtones/11_Tyomnaya_noch.mp3
