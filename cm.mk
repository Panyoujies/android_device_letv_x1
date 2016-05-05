# Copyright (C) 2015 The CyanogenMod Project
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

# Inherit from nx510j device
$(call inherit-product, device/letv/x1/device.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_NAME := cm_x1
PRODUCT_DEVICE := x1
PRODUCT_MANUFACTURER := letv
PRODUCT_MODEL := X1

PRODUCT_GMS_CLIENTID_BASE := android-letv

PRODUCT_BRAND := letv
TARGET_VENDOR := letv
TARGET_VENDOR_PRODUCT_NAME := X1
TARGET_VENDOR_DEVICE_NAME := X1
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=X1 PRODUCT_NAME=X1

## Use the latest approved GMS identifiers
ifneq ($(SIGN_BUILD),true)
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=Letv/Le1Pro_CN/x1:5.0.2/BEXCNFN5501304131S/283:user/release-keys \
    PRIVATE_BUILD_DESC="x1-user 5.0.2 BEXCNFN5501304131S 283 release-keys"
endif
