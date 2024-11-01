SRC := $(shell pwd)

all:
	# Launch kbuild
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)

modules_install:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install

overlay_install:
	mkdir -p $(INSTALL_MOD_PATH)/boot/
	install -m 0644 $(SRC)/overlay/tegra234-p3767-camera-p3768-dual-rp-imx296.dtbo $(INSTALL_MOD_PATH)/boot/

install: modules_install overlay_install

clean:
	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
	rm -f Module.markers Module.symvers modules.order
	rm -rf .tmp_versions Modules.symvers
