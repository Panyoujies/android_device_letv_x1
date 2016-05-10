#
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
#

LOCAL_PATH := $(call my-dir)

#----------------------------------------------------------------------
# Copy additional target-specific files
#----------------------------------------------------------------------
include $(CLEAR_VARS)
LOCAL_MODULE       := vold.fstab
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/vold.fstab
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.target.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/init.target.rc
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gpio-keys.kl
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/gpio-keys.kl
LOCAL_MODULE_PATH  := $(TARGET_OUT_KEYLAYOUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := synaptics_dsx.kl
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/synaptics_dsx.kl
LOCAL_MODULE_PATH  := $(TARGET_OUT_KEYLAYOUT)
include $(BUILD_PREBUILT)

# Create a link for the WCNSS config file, which ends up as a writable
# version in /data/misc/wifi
$(shell mkdir -p $(TARGET_OUT)/etc/firmware/wlan/qca_cld; \
	mkdir -p $(TARGET_OUT)/lib/modules; \
        ln -sf  /system/etc/wifi/bdwlan30_1.bin \
        $(TARGET_OUT_ETC)/firmware/wlan/qca_cld/bdwlan30_1.bin; \
        ln -sf  /system/etc/wifi/bdwlan30_2.bin \
        $(TARGET_OUT_ETC)/firmware/wlan/qca_cld/bdwlan30_2.bin; \
        ln -sf  /system/etc/wifi/bdwlan30_3.bin \
        $(TARGET_OUT_ETC)/firmware/wlan/qca_cld/bdwlan30_3.bin; \
        ln -sf  /system/etc/wifi/WCNSS_qcom_wlan_nv.bin \
        $(TARGET_OUT_ETC)/firmware/wlan/qca_cld/WCNSS_qcom_wlan_nv.bin; \
        ln -sf /system/etc/wifi/WCNSS_qcom_cfg.ini \
        $(TARGET_OUT_ETC)/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini; \
        ln -sf /persist/wlan_mac.bin \
        $(TARGET_OUT_ETC)/firmware/wlan/qca_cld/wlan_mac.bin; \
     	  ln -sf /system/lib/modules/qca_cld/qca_cld_wlan.ko \
        $(TARGET_OUT)/lib/modules/wlan.ko)

$(shell mkdir -p $(TARGET_OUT)/lib64; \
        rm $(TARGET_OUT)/lib64/libwebviewchromium.so; \
        ln -sf /system/lib64/libwebviewchromium.so \
        $(TARGET_OUT_APPS)/webview/lib/arm64/libwebviewchromium.so)

