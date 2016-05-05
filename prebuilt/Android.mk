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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libwebviewchromium
LOCAL_SRC_FILES_32 := lib/arm/libwebviewchromium.so
LOCAL_SRC_FILES_64 := lib/arm64/libwebviewchromium.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_32 := $(2ND_TARGET_OUT_SHARED_LIBRARIES)
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_SHARED_LIBRARIES)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := webview
LOCAL_SRC_FILES := webview.apk
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_REQUIRED_MODULES := libwebviewchromium \
    libwebviewchromium_loader \
    libwebviewchromium_plat_support
LOCAL_POST_INSTALL_CMD += mkdir -p $(TARGET_OUT_APPS)/webview/lib/arm; \
    ln -sf /system/lib/libwebviewchromium.so \
    $(TARGET_OUT_APPS)/webview/lib/arm/libwebviewchromium.so

include $(BUILD_PREBUILT)
