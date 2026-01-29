################################################################################
#
# aic8800s
#
################################################################################

AIC8800S_VERSION = f82c5a87e205a569a0a8f862f0ec92b5cbd7e679
# AIC8800S_SITE = $(call github,radxa-pkg,aic8800,$(AIC8800S_VERSION))
AIC8800S_SITE = $(call github,radxa-pkg,aic8800,$(AIC8800S_VERSION))
AIC8800S_LICENSE = GPL-3.0
AIC8800S_LICENSE_FILES = COPYING
AIC8800S_DEPENDENCIES = linux
AIC8800S_MODULE_SUBDIRS = src/SDIO/driver_fw/driver/aic8800
AIC8800S_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED) \
	CONFIG_AIC_WLAN_SUPPORT=m \
	CONFIG_AIC8800_BTLPM_SUPPORT=n \
	CONFIG_AIC8800_WLAN_SUPPORT=m

AIC8800S_FW_SRC_DIR = $(@D)/src/SDIO/driver_fw/fw/aic8800D80
AIC8800S_FW_TARGET_DIR = $(TARGET_DIR)/lib/firmware/aic8800

define AIC8800S_INSTALL_FIRMWARE
	$(INSTALL) -d -m 0755 $(AIC8800S_FW_TARGET_DIR)
	cp -f $(AIC8800S_FW_SRC_DIR)/* $(AIC8800S_FW_TARGET_DIR)/
	chmod 644 $(AIC8800S_FW_TARGET_DIR)/*
endef
AIC8800S_POST_INSTALL_TARGET_HOOKS += AIC8800S_INSTALL_FIRMWARE

$(eval $(kernel-module))
$(eval $(generic-package))