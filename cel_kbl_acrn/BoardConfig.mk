# ----------------- BEGIN MIX-IN DEFINITIONS -----------------
# Mix-In definitions are auto-generated by mixin-update
##############################################################
# Source: device/intel/project-celadon/mixins/groups/device-specific/cel_kbl_acrn/BoardConfig.mk
##############################################################
DEVICE_PACKAGE_OVERLAYS += $(TARGET_DEVICE_DIR)/overlay

BOARD_KERNEL_CMDLINE += \
	no_timer_check \
	noxsaves \
	reboot_panic=p,w \
	i915.hpd_sense_invert=0x7 \
	intel_iommu=off

BOARD_FLASHFILES += $(TARGET_DEVICE_DIR)/bldr_utils.img:bldr_utils.img

# for USB OTG WA
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/bxt_usb

TARGET_USES_HWC2 := true
BOARD_USES_GENERIC_AUDIO := true
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3040870400
##############################################################
# Source: device/intel/project-celadon/mixins/groups/slot-ab/true/BoardConfig.mk
##############################################################
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
    boot \
    system
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_SLOT_AB_ENABLE := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
PRODUCT_STATIC_BOOT_CONTROL_HAL := bootctrl.intel.static
BOARD_KERNEL_CMDLINE += rootfstype=ext4

ifeq (False,False)
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/slot-ab/generic

ifeq (vsbl,efi)
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/slot-ab/efi
endif

ifeq (False,true)
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/update_ifwi_ab \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/slot-ab/xbl

endif

ifeq (False,true)

ifeq (False,False)
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/slot-ab/xbl
endif

BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/slot-ab/fw_update

endif
endif
##############################################################
# Source: device/intel/project-celadon/mixins/groups/disk-bus/pci/BoardConfig.mk
##############################################################
BOARD_DISK_BUS = 03.0
##############################################################
# Source: device/intel/project-celadon/mixins/groups/avb/true/BoardConfig.mk
##############################################################
BOARD_AVB_ENABLE := true
##############################################################
# Source: device/intel/project-celadon/mixins/groups/boot-arch/vsbl/BoardConfig.mk
##############################################################
#
# -- OTA RELATED DEFINES --
#

# tell build system where to get the recovery.fstab
TARGET_RECOVERY_FSTAB ?= $(TARGET_DEVICE_DIR)/fstab.recovery

# Used by ota_from_target_files to add platform-specific directives
# to the OTA updater scripts
TARGET_RELEASETOOLS_EXTENSIONS ?= $(INTEL_PATH_BUILD)/test

# By default recovery minui expects RGBA framebuffer
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

#
# FILESYSTEMS
#

# NOTE: These values must be kept in sync with BOARD_GPT_INI
BOARD_BOOTIMAGE_PARTITION_SIZE ?= 31457280
BOARD_SYSTEMIMAGE_PARTITION_SIZE ?= 3221225472
BOARD_TOSIMAGE_PARTITION_SIZE ?= 10485760
BOARD_BOOTLOADER_PARTITION_SIZE ?= $$((30 * 1024 * 1024))
BOARD_BOOTLOADER_BLOCK_SIZE := 1024
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4

ifeq (False,true)
TARGET_USERIMAGES_USE_F2FS := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
INTERNAL_USERIMAGES_EXT_VARIANT := f2fs
BOARD_USERDATAIMAGE_PARTITION_SIZE ?= 4508876800
else
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
INTERNAL_USERIMAGES_EXT_VARIANT := ext4
endif

TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

TARGET_USES_MKE2FS := true

ifeq ($(BOARD_FLASH_UFS), 1)
BOARD_FLASH_BLOCK_SIZE := 4096
else
BOARD_FLASH_BLOCK_SIZE := 512
endif

#
#kernel always use primary gpt without command line option "gpt",
#the label let kernel use the alternate GPT if primary GPT is corrupted.
#
BOARD_KERNEL_CMDLINE += gpt

#
# Trusted Factory Reset - persistent partition
#
DEVICE_PACKAGE_OVERLAYS += $(INTEL_PATH_HARDWARE)/bootctrl/boot/overlay


BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/boot-arch/generic

TARGET_BOOTLOADER_BOARD_NAME := $(TARGET_DEVICE)

FASTBOOT_IN_IFWI := true

BOARD_AVB_ENABLE := true
AB_OTA_PARTITIONS += vbmeta
AB_OTA_PARTITIONS += bootloader
AB_OTA_PARTITIONS += tos

TARGET_USE_SBL := true
##############################################################
# Source: device/intel/project-celadon/mixins/groups/wlan/mwifiex/BoardConfig.mk
##############################################################
# This enables the wpa wireless driver
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WLAN_DEVICE := mrvl
BOARD_WPA_SUPPLICANT_PRIVATE_LIB ?= mrvl_private_lib_driver_cmd
WPA_SUPPLICANT_VERSION := VER_2_1_DEVEL

BOARD_SEPOLICY_DIRS += \
    $(INTEL_PATH_SEPOLICY)/wlan/common
##############################################################
# Source: device/intel/project-celadon/mixins/groups/kernel/gmin64/BoardConfig.mk.1
##############################################################
TARGET_USES_64_BIT_BINDER := true
##############################################################
# Source: device/intel/project-celadon/mixins/groups/kernel/gmin64/BoardConfig.mk
##############################################################
# Specify location of board-specific kernel headers
TARGET_BOARD_KERNEL_HEADERS := $(INTEL_PATH_COMMON)/kernel/4.14/kernel-headers

ifneq ($(TARGET_BUILD_VARIANT),user)
KERNEL_LOGLEVEL ?= 4
else
KERNEL_LOGLEVEL ?= 2
endif

ifeq ($(TARGET_BUILD_VARIANT),user)
BOARD_KERNEL_CMDLINE += console=tty0
endif

BOARD_KERNEL_CMDLINE += \
        loglevel=$(KERNEL_LOGLEVEL) \
        androidboot.hardware=$(TARGET_DEVICE)\
        firmware_class.path=/vendor/firmware


BOARD_KERNEL_CMDLINE += \
        relative_sleep_states=1

BOARD_KERNEL_CMDLINE += \
       intel_pstate=passive

BOARD_SEPOLICY_M4DEFS += module_kernel=true
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/kernel
##############################################################
# Source: device/intel/project-celadon/mixins/groups/sepolicy/permissive/BoardConfig.mk.1
##############################################################
# start kernel in permissive mode, this way we don't
# need 'setenforce 0' from init.rc files
BOARD_KERNEL_CMDLINE += enforcing=0 androidboot.selinux=permissive
##############################################################
# Source: device/intel/project-celadon/mixins/groups/sepolicy/permissive/BoardConfig.mk
##############################################################
# SELinux Policy
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)

##############################################################
# Source: device/intel/project-celadon/mixins/groups/trusty/true/BoardConfig.mk
##############################################################
TARGET_USE_TRUSTY := true

ifneq (, $(filter abl sbl, vsbl))
TARGET_USE_MULTIBOOT := true
endif

BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/trusty
BOARD_SEPOLICY_M4DEFS += module_trusty=true

LKBUILD_TOOLCHAIN_ROOT = $(PWD)/$(INTEL_PATH_VENDOR)/external/prebuilts/elf/
LKBUILD_X86_TOOLCHAIN = $(LKBUILD_TOOLCHAIN_ROOT)i386-elf-4.9.1-Linux-x86_64/bin
LKBUILD_X64_TOOLCHAIN = $(LKBUILD_TOOLCHAIN_ROOT)x86_64-elf-4.9.1-Linux-x86_64/bin
TRUSTY_BUILDROOT = $(PWD)/$(PRODUCT_OUT)/obj/trusty/

TRUSTY_ENV_VAR += TRUSTY_REF_TARGET=gordon_peak_acrn

#for trusty lk
TRUSTY_ENV_VAR += BUILDROOT=$(TRUSTY_BUILDROOT)
TRUSTY_ENV_VAR += PATH=$$PATH:$(LKBUILD_X86_TOOLCHAIN):$(LKBUILD_X64_TOOLCHAIN)
TRUSTY_ENV_VAR += CLANG_BINDIR=$(PWD)/$(LLVM_PREBUILTS_PATH)
TRUSTY_ENV_VAR += ARCH_x86_64_TOOLCHAIN_PREFIX=${PWD}/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-${TARGET_GCC_VERSION}/bin/x86_64-linux-android-

#for trusty vmm
# use same toolchain as android kernel
TRUSTY_ENV_VAR += COMPILE_TOOLCHAIN=$(YOCTO_CROSSCOMPILE)
TRUSTY_ENV_VAR += TARGET_BUILD_VARIANT=$(TARGET_BUILD_VARIANT)
TRUSTY_ENV_VAR += BOOT_ARCH=vsbl

# output build dir to android out folder
TRUSTY_ENV_VAR += BUILD_DIR=$(TRUSTY_BUILDROOT)
TRUSTY_ENV_VAR += LKBIN_DIR=$(TRUSTY_BUILDROOT)/build-sand-x86-64/

#Fix the cpu hotplug fail due to the trusty.
#Trusty will introduce some delay for cpu_up().
#Experiment show need wait at least 60us after
#apic_icr_write(APIC_DM_STARTUP | (start_eip >> 12), phys_apicid);
#So here override the cpu_init_udelay to have the cpu wait for 300us
#to guarantee the cpu_up success.
BOARD_KERNEL_CMDLINE += cpu_init_udelay=10

#TOS_PREBUILT := $(PWD)/$(INTEL_PATH_VENDOR)/fw/evmm/tos.img
#EVMM_PREBUILT := $(PWD)/$(INTEL_PATH_VENDOR)/fw/evmm/multiboot.img
##############################################################
# Source: device/intel/project-celadon/mixins/groups/vendor-partition/true/BoardConfig.mk
##############################################################
# Those 3 lines are required to enable vendor image generation.
# Remove them if vendor partition is not used.
TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE := $(shell echo 800*1048576 | bc)
AB_OTA_PARTITIONS += vendor
##############################################################
# Source: device/intel/project-celadon/mixins/groups/config-partition/true/BoardConfig.mk
##############################################################
BOARD_CONFIGIMAGE_PARTITION_SIZE := 8388608
BOARD_SEPOLICY_M4DEFS += module_config_partition=true
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/config-partition
##############################################################
# Source: device/intel/project-celadon/mixins/groups/cpu-arch/slm/BoardConfig.mk.1
##############################################################
ifeq ($(BOARD_USE_64BIT_USERSPACE),true)
# 64b-specific items:
TARGET_ARCH := x86_64
TARGET_CPU_ABI := x86_64
TARGET_2ND_CPU_ABI := x86
TARGET_2ND_ARCH := x86
TARGET_2ND_ARCH_VARIANT := silvermont
TARGET_2ND_CPU_VARIANT := silvermont
else
# 32b-specific items:
TARGET_ARCH := x86
TARGET_CPU_ABI := x86
endif
##############################################################
# Source: device/intel/project-celadon/mixins/groups/cpu-arch/slm/BoardConfig.mk
##############################################################
# Items that are common between slm 32b and 64b:
TARGET_CPU_ABI_LIST_32_BIT := x86
TARGET_ARCH_VARIANT := silvermont
TARGET_CPU_SMP := true
##############################################################
# Source: device/intel/project-celadon/mixins/groups/dexpreopt/true/BoardConfig.mk
##############################################################
# enable dex-preoptimization.
WITH_DEXPREOPT := true
##############################################################
# Source: device/intel/project-celadon/mixins/groups/pstore/ram_dummy/BoardConfig.mk.1
##############################################################
BOARD_KERNEL_CMDLINE += pstore.backend=ramoops
##############################################################
# Source: device/intel/project-celadon/mixins/groups/pstore/ram_dummy/BoardConfig.mk.2
##############################################################
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/pstore
##############################################################
# Source: device/intel/project-celadon/mixins/groups/pstore/ram_dummy/BoardConfig.mk
##############################################################
BOARD_KERNEL_CMDLINE += \
	memmap=0x400000\$$0x50000000 \
	ramoops.mem_address=0x50000000 \
	ramoops.mem_size=0x400000
BOARD_KERNEL_CMDLINE += \
	ramoops.record_size=0x4000

BOARD_KERNEL_CMDLINE += \
	ramoops.console_size=0x200000

BOARD_KERNEL_CMDLINE += \
	ramoops.ftrace_size=0x2000

BOARD_KERNEL_CMDLINE += \
	ramoops.dump_oops=1

##############################################################
# Source: device/intel/project-celadon/mixins/groups/media/mesa/BoardConfig.mk
##############################################################
INTEL_STAGEFRIGHT := true

# Settings for the Media SDK library and plug-ins:
# - USE_MEDIASDK: use Media SDK support or not
USE_MEDIASDK := true
##############################################################
# Source: device/intel/project-celadon/mixins/groups/graphics/mesa/BoardConfig.mk
##############################################################
# Use external/drm-bxt
TARGET_USE_PRIVATE_LIBDRM := true
LIBDRM_VER ?= intel

BOARD_KERNEL_CMDLINE += vga=current i915.modeset=1 drm.atomic=1 i915.nuclear_pageflip=1 drm.vblankoffdelay=1 i915.fastboot=1
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
USE_INTEL_UFO_DRIVER := false
BOARD_GPU_DRIVERS := i965
BOARD_USE_CUSTOMIZED_MESA := true

# System's VSYNC phase offsets in nanoseconds
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 3000000

BOARD_GPU_DRIVERS ?= i965 swrast
ifneq ($(strip $(BOARD_GPU_DRIVERS)),)
TARGET_HARDWARE_3D := true
TARGET_USES_HWC2 := true
endif


BOARD_USES_DRM_HWCOMPOSER := false
BOARD_USES_IA_HWCOMPOSER := true

BOARD_USES_MINIGBM := true
BOARD_ENABLE_EXPLICIT_SYNC := true
INTEL_MINIGBM := $(INTEL_PATH_HARDWARE)/external/minigbm-intel


BOARD_USES_GRALLOC1 := true


BOARD_CURSOR_WA := true


BOARD_THREEDIS_UNDERRUN_WA := true


BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/graphics/mesa

##############################################################
# Source: device/intel/project-celadon/mixins/groups/rfkill/true/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/rfkill
##############################################################
# Source: device/intel/project-celadon/mixins/groups/usb-gadget/configfs/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/usb-gadget/configfs
##############################################################
# Source: device/intel/project-celadon/mixins/groups/usb-otg-switch/true/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/usb-role-switch
##############################################################
# Source: device/intel/project-celadon/mixins/groups/navigationbar/true/BoardConfig.mk
##############################################################
DEVICE_PACKAGE_OVERLAYS += $(INTEL_PATH_COMMON)/navigationbar/overlay

##############################################################
# Source: device/intel/project-celadon/mixins/groups/device-type/car/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += \
    packages/services/Car/car_product/sepolicy \
    device/generic/car/common/sepolicy \
    $(INTEL_PATH_SEPOLICY)/car

TARGET_USES_CAR_FUTURE_FEATURES := true
BOARD_SEPOLICY_M4DEFS += module_carservice_app=true
##############################################################
# Source: device/intel/project-celadon/mixins/groups/gms/true/BoardConfig.mk
##############################################################

DEVICE_PACKAGE_OVERLAYS += $(INTEL_PATH_COMMON)/gms/overlay
##############################################################
# Source: device/intel/project-celadon/mixins/groups/security/cse/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/security
##############################################################
# Source: device/intel/project-celadon/mixins/groups/debug-crashlogd/true/BoardConfig.mk
##############################################################
ifeq ($(MIXIN_DEBUG_LOGS),true)
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/crashlogd
BOARD_SEPOLICY_M4DEFS += module_debug_crashlogd=true
endif
##############################################################
# Source: device/intel/project-celadon/mixins/groups/debug-phonedoctor/true/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_M4DEFS += module_debug_phonedoctor=true
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/debug-phonedoctor
##############################################################
# Source: device/intel/project-celadon/mixins/groups/power/true/BoardConfig.mk
##############################################################

POWER_THROTTLE := true


BOARD_SEPOLICY_M4DEFS += module_power=true
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/power
##############################################################
# Source: device/intel/project-celadon/mixins/groups/debug-dvc_desc/npk/BoardConfig.mk
##############################################################
ifneq ($(TARGET_BUILD_VARIANT),user)
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/dvc_desc
endif

##############################################################
# Source: device/intel/project-celadon/mixins/groups/intel_prop/true/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/intel_prop

ifneq ($(KERNELFLINGER_SUPPORT_NON_EFI_BOOT), true)
INTEL_PROP_LIBDMI := true
endif

##############################################################
# Source: device/intel/project-celadon/mixins/groups/debug-lct/true/BoardConfig.mk
##############################################################
CRASHLOGD_MODULE_LCT := true
##############################################################
# Source: device/intel/project-celadon/mixins/groups/debug-log-watch/true/BoardConfig.mk
##############################################################
ifneq ($(TARGET_BUILD_VARIANT),user)
ifeq ($(MIXIN_DEBUG_LOGS),true)
    BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/log-watch
endif
endif

##############################################################
# Source: device/intel/project-celadon/mixins/groups/eavb/true/BoardConfig.mk
##############################################################
# for Open-avb gPTP daemon
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/gptp

# for AVB Streamhandler daemon
BOARD_SEPOLICY_M4DEFS += module_gptp=true
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/avbstreamhandler

# Common CFLAGS for IAS components
#IAS eng and userdebug build variant
ifneq ($(TARGET_BUILD_VARIANT),user)
  IAS_COMMON_CFLAGS := -DENG_DEBUG
else
  IAS_COMMON_CFLAGS :=
endif

# define IAS_TREBLE_COMPLIANT flag for IAS components
IAS_COMMON_CFLAGS += -DIAS_TREBLE_COMPLIANT

TARGET_FS_CONFIG_GEN += $(INTEL_PATH_COMMON)/eavb/filesystem_config/config.fs
##############################################################
# Source: device/intel/project-celadon/mixins/groups/memtrack/true/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/memtrack
##############################################################
# Source: device/intel/project-celadon/mixins/groups/dbga/true/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/debug_agent
##############################################################
# Source: device/intel/project-celadon/mixins/groups/audio/gordon_peak_acrn/BoardConfig.mk.1
##############################################################
BOARD_SEPOLICY_DIRS += \
    $(INTEL_PATH_SEPOLICY)/audio/dirana \
    $(INTEL_PATH_SEPOLICY)/audio/early_audio \
    $(INTEL_PATH_SEPOLICY)/audio/bxtp-mrb
##############################################################
# Source: device/intel/project-celadon/mixins/groups/audio/gordon_peak_acrn/BoardConfig.mk
##############################################################
DEVICE_PACKAGE_OVERLAYS += $(INTEL_PATH_COMMON)/audio/overlay

#Enable SOF
SOF_AUDIO := false

# Enable configurable audio policy
USE_CONFIGURABLE_AUDIO_POLICY := 1

# Use XML audio policy configuration file
USE_XML_AUDIO_POLICY_CONF := 1

# Use Intel's custom PFW
USE_CUSTOM_PARAMETER_FRAMEWORK := true

BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/audio/coe-common

# Do not use audio HAL directly w/o hwbinder middleware
USE_LEGACY_LOCAL_AUDIO_HAL := false
##############################################################
# Source: device/intel/project-celadon/mixins/groups/hdcpd/true/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/hdcpd
##############################################################
# Source: device/intel/project-celadon/mixins/groups/thermal/default/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/thermal
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/thermal/default
BOARD_KERNEL_CMDLINE += thermal.off=1
##############################################################
# Source: device/intel/project-celadon/mixins/groups/ioc/default/BoardConfig.mk
##############################################################
ifeq (none,cbc)
IOC_USE_CBC := true
endif
##############################################################
# Source: device/intel/project-celadon/mixins/groups/acrn-guest/true/BoardConfig.mk
##############################################################
# can't use := here, as PRODUCT_OUT is not defined yet
ACRN_GPTIMAGE_BIN = $(PRODUCT_OUT)/$(TARGET_PRODUCT).img
##############################################################
# Source: device/intel/project-celadon/mixins/groups/hyper-dmabuf-sharing/true/BoardConfig.mk
##############################################################
# Enable NESTED DISPLAY SUPPORT IN HWC
ENABLE_HYPER_DMABUF_SHARING := true

# sepolicy to access hyper_dmabuf device
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/hyper-dmabuf-sharing
##############################################################
# Source: device/intel/project-celadon/mixins/groups/allow-missing-dependencies/true/BoardConfig.mk
##############################################################
ALLOW_MISSING_DEPENDENCIES := true
##############################################################
# Source: device/intel/project-celadon/mixins/groups/debugfs/true/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/debugfs
##############################################################
# Source: device/intel/project-celadon/mixins/groups/factory-scripts/true/BoardConfig.mk
##############################################################
# Include factory archive in 'make dist' output
TARGET_BUILD_INTEL_FACTORY_SCRIPTS := true

##############################################################
# Source: device/intel/project-celadon/mixins/groups/filesystem_config/common/BoardConfig.mk
##############################################################
TARGET_FS_CONFIG_GEN += $(INTEL_PATH_COMMON)/filesystem_config/config.fs
##############################################################
# Source: device/intel/project-celadon/mixins/groups/load_modules/true/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS +=  $(INTEL_PATH_SEPOLICY)/load_modules

TARGET_FS_CONFIG_GEN += $(INTEL_PATH_COMMON)/load_modules/filesystem_config/config.fs

##############################################################
# Source: device/intel/project-celadon/mixins/groups/widevine/true/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/drm-default
##############################################################
# Source: device/intel/project-celadon/mixins/groups/aosp_carrier-config/default/BoardConfig.mk
##############################################################
DEVICE_PACKAGE_OVERLAYS += $(INTEL_PATH_COMMON)/ims/carrier/res_ims
##############################################################
# Source: device/intel/project-celadon/mixins/groups/autodetect/default/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/autodetect/false
##############################################################
# Source: device/intel/project-celadon/mixins/groups/embms/default/BoardConfig.mk
##############################################################
#setting for embms dep in framework
TARGET_HAS_EMBMS_ENABLE := false
##############################################################
# Source: device/intel/project-celadon/mixins/groups/jpeg-turbo/default/BoardConfig.mk
##############################################################
USE_JPEG_TURBO := no
# ------------------ END MIX-IN DEFINITIONS ------------------
