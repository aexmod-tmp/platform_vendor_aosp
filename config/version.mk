# Copyright (C) 2017 AospExtended ROM
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

#Extended Versioning
EXTENDED_VERSION = v5.3

#ifndef EXTENDED_BUILD_TYPE
    EXTENDED_BUILD_TYPE := Mod
#endif

ifeq ($(EXTENDED_BUILD_TYPE), OFFICIAL)

# AEXOTA
$(call inherit-product-if-exists, vendor/aosp/config/ota.mk)

endif

EXTENDED_MOD_VERSION := AEX-Mod-$(EXTENDED_VERSION)-$(shell date -u +%Y%m%d-%H%M)

PRODUCT_GENERIC_PROPERTIES += \
  ro.extended.version=$(EXTENDED_VERSION) \
  ro.extended.releasetype=$(EXTENDED_BUILD_TYPE) \
  ro.modversion=$(EXTENDED_MOD_VERSION)
  
EXTENDED_DISPLAY_VERSION := AEX-Mod-$(EXTENDED_VERSION)

PRODUCT_GENERIC_PROPERTIES += \
  ro.extended.display.version=$(EXTENDED_DISPLAY_VERSION)


# DragonTC info
DRAGONTC_VERSION := 7.0

DTC_PATH := prebuilts/clang/host/linux-x86/$(DRAGONTC_VERSION)
DTC_VER := $(shell cat $(DTC_PATH)/VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.clang.version=$(DTC_VER)

-include prebuilts/clang/host/linux-x86/$(DRAGONTC_VERSION)/DragonTC.mk
