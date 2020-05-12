#
# Copyright (C) 2018 The LineageOS Project
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

ifneq ($(filter crownqltechn starqltechn star2qltechn,$(TARGET_DEVICE)),)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif

FIRMWARE_MOUNT_POINT := $(TARGET_OUT_VENDOR)/firmware_mnt
BT_FIRMWARE_MOUNT_POINT := $(TARGET_OUT_VENDOR)/bt_firmware
EFS_MOUNT_POINT := $(TARGET_ROOT_OUT)/efs

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_MOUNT_POINT) \
	$(BT_FIRMWARE_MOUNT_POINT) \
	$(EFS_MOUNT_POINT)

$(FIRMWARE_MOUNT_POINT):
	@echo "Creating $(FIRMWARE_MOUNT_POINT)"
	@mkdir -p $(TARGET_OUT_VENDOR)/firmware_mnt
ifneq ($(TARGET_MOUNT_POINTS_SYMLINKS),false)
	@ln -sf /vendor/firmware_mnt $(TARGET_ROOT_OUT)/firmware
endif

$(BT_FIRMWARE_MOUNT_POINT):
	@echo "Creating $(BT_FIRMWARE_MOUNT_POINT)"
	@mkdir -p $(TARGET_OUT_VENDOR)/bt_firmware
ifneq ($(TARGET_MOUNT_POINTS_SYMLINKS),false)
	@ln -sf /vendor/bt_firmware $(TARGET_ROOT_OUT)/bt_firmware
endif

$(EFS_MOUNT_POINT):
	@echo "Creating $(EFS_MOUNT_POINT)"
	@mkdir -p $(TARGET_ROOT_OUT)/efs
ifneq ($(TARGET_MOUNT_POINT_SYMLINKS),false)
	@ln -sf /mnt/vendor/efs $(TARGET_ROOT_OUT)/efs
endif
