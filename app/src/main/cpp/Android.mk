LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := ssl
LOCAL_SRC_FILES := libs/openssl-android/$(TARGET_ARCH_ABI)/libssl.a
LOCAL_EXPORT_CFLAGS := -I$(LOCAL_PATH)/include
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := crypto
LOCAL_SRC_FILES := libs/openssl-android/$(TARGET_ARCH_ABI)/libcrypto.a
LOCAL_EXPORT_CFLAGS := -I$(LOCAL_PATH)/include
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := curl
LOCAL_SRC_FILES := libs/curl-android/$(TARGET_ARCH_ABI)/libcurl.a
LOCAL_EXPORT_CFLAGS := -I$(LOCAL_PATH)/include
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_C_INCLUDES :=
LOCAL_MODULE := curl-a-website
LOCAL_SRC_FILES := jni.c curl-a-website/curl_a_website.c
LOCAL_STATIC_LIBRARIES := libcurl libssl libcrypto
LOCAL_LDLIBS := -lz
include $(BUILD_SHARED_LIBRARY)
