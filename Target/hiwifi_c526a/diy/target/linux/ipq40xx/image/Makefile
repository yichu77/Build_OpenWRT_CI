include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

define Device/Default
	PROFILES := Default
	KERNEL_DEPENDS = $$(wildcard $(DTS_DIR)/$$(DEVICE_DTS).dts)
	KERNEL_LOADADDR := 0x80208000
	DEVICE_DTS = $$(SOC)-$(lastword $(subst _, ,$(1)))
	DEVICE_DTS_CONFIG := config@1
	IMAGES := sysupgrade.bin
	IMAGE/sysupgrade.bin = sysupgrade-tar | append-metadata
	IMAGE/sysupgrade.bin/squashfs :=
endef

define Device/hiwifi_c526a
	$(call Device/FitzImage)
	$(call Device/UbiFit)
	DEVICE_VENDOR := HiWiFi
	DEVICE_MODEL := C526A
	DEVICE_DTS := qcom-ipq4019-c526a
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	DEVICE_PACKAGES := ipq-wifi-hiwifi_c526a kmod-mt7615e kmod-mt7615-firmware
endef
TARGET_DEVICES += hiwifi_c526a

include $(SUBTARGET).mk

$(eval $(call BuildImage))
