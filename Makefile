SRC := $(shell pwd)

all:
	# Launch kbuild
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)

modules_install:
	# Same as vc-mipi, mostly works, but depmod will not run:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install
	# This runs depmod, but now it can't find modules.builtins and modules.order, among other errors:
	#$(MAKE) -C /home/clyde/nvidia/nvidia_sdk/JetPack_6.1_Linux_JETSON_ORIN_NANO_TARGETS/Linux_for_Tegra/source/out/nvidia-linux-header M=$(SRC) modules_install
	# Another variation:
	#$(MAKE) -C /home/clyde/nvidia/nvidia_sdk/JetPack_6.1_Linux_JETSON_ORIN_NANO_TARGETS/Linux_for_Tegra/source/kernel/kernel-jammy-src M=$(SRC) modules_install

overlay_install:
	mkdir -p $(INSTALL_MOD_PATH)/boot/
	install -m 0644 $(SRC)/overlay/tegra234-p3767-camera-p3768-dual-rp-imx296.dtbo $(INSTALL_MOD_PATH)/boot/

install: modules_install overlay_install

clean:
	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
	rm -f Module.markers Module.symvers modules.order
	rm -rf .tmp_versions Modules.symvers
