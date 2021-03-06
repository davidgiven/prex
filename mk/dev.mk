INCLUDE=	-I$(BUILDDIR) -I$(SRCDIR) -I$(SRCDIR)/dev/$(ARCH)/include \
		-I$(BUILDDIR)/dev/$(ARCH)/$(PLATFORM) \
		-I$(SRCDIR)/dev/include -I$(SRCDIR)/include

ASFLAGS+=	$(INCLUDE)
CFLAGS+=	$(INCLUDE) -nostdinc -fno-builtin -D__KERNEL__ -D__DRIVER__
CPPFLAGS+=	$(INCLUDE) -D__KERNEL__ -D__DRIVER__
LDFLAGS+=	-static -nostdlib -L$(BUILDDIR)/conf
LINTFLAGS+=	-D__KERNEL__ -D__DRIVER__

ifeq ($(DRIVER_BASE),AUTODETECT)
LDFLAGS+=	-r
endif

-include $(SRCDIR)/dev/$(ARCH)/$(PLATFORM)/dev.mk
include $(SRCDIR)/mk/Makefile.inc
