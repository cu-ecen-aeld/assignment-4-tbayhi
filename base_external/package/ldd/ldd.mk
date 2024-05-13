
##############################################################
#
# LDD
#
##############################################################

LDD_VERSION = 'a7aa7919d7cd7cd6b6ad804cd9920e0dd55b1e30'

# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-tbayhi.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = scull
LDD_MODULE_SUBDIRS += misc-modules
LDD_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(TARGET_DIR)/lib/modules/5.15.18/kernel/drivers
	$(INSTALL) -d 0755 $(TARGET_DIR)/lib/modules/5.15.18/kernel/drivers/scull
	$(INSTALL) -d 0755 $(TARGET_DIR)/lib/modules/5.15.18/kernel/drivers/misc-modules
	
	$(INSTALL) -m 0755 $(@D)/scull/*.ko $(TARGET_DIR)/lib/modules/5.15.18/kernel/drivers/scull
	$(INSTALL) -m 0755 $(@D)/misc-modules/*.ko $(TARGET_DIR)/lib/modules/5.15.18/kernel/drivers/misc-modules
endef

BR2_ROOTFS_OVERLAY = ../base_external/rootfs_overlay

$(eval $(kernel-module))
$(eval $(generic-package))
