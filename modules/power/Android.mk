#
# Copyright (C) 2015 The Android Open-Source Project
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := power.msm8992
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SHARED_LIBRARIES := liblog libcutils

ifeq ($(TARGET_SUPPORT_POWER_PROFILE),true)
  ifneq ($(TARGET_TAP_TO_WAKE_NODE),)
   LOCAL_CFLAGS += -DTAP_TO_WAKE_NODE=\"$(TARGET_TAP_TO_WAKE_NODE)\"
  endif
  
  
  LOCAL_SRC_FILES := perf/power.c
  
else
 LOCAL_MULTILIB := both
 LOCAL_SHARED_LIBRARIES += libdl
 LOCAL_SRC_FILES := bull/power.c bull/metadata-parser.c bull/utils.c bull/list.c bull/hint-data.c

 # Include target-specific files.
 
 ifeq ($(call is-board-platform-in-list, msm8994), true)
 LOCAL_SRC_FILES += bull/power-8994.c
 endif
 
 ifeq ($(call is-board-platform-in-list, msm8992), true)
 LOCAL_SRC_FILES += bull/power-8992.c
 endif
 
 ifeq ($(TARGET_USES_INTERACTION_BOOST),true)
     LOCAL_CFLAGS += -DINTERACTION_BOOST
 endif
endif

include $(BUILD_SHARED_LIBRARY)
