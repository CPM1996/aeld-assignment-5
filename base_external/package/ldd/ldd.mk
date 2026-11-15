
##############################################################
#
# LDD
#
##############################################################

# LDD_SOURCE = foo-$(LDD_VERSION).tar.xz
LDD_LICENSE = GPL-2.0
LDD_LICENSE_FILES = COPYING

LDD_VERSION = 'e3ba7e47a096728a0289810524095eaf5c1d623a'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'git@github.com:CPM1996/aeld-assignment-7.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

# LDD_SITE = '$(TOPDIR)/../../assignment7'
# LDD_SITE_METHOD = local

LDD_MODULE_SUBDIRS = misc-modules scull
LDD_MODULE_MAKE_OPTS = KERNELDIR=/lib/modules/$(LINUX_VERSION_PROBED)/build

define LDD_BUILD_CMDS
	$(MAKE) -C $(@D)/misc-modules modules
	$(MAKE) -C $(@D)/scull modules
endef
#
#define LDD_INSTALL_TARGET_CMDS
#	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules modules_install
#endef

$(eval $(kernel-module))
$(eval $(generic-package))
