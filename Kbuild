obj-m := rp_imx296.o

ccflags-y += -Werror

# Required?
ccflags-$(CONFIG_TEGRA_OOT_MODULE) += -DNVIDIA -I $(srctree.nvidia-oot)/include -I$(srctree.nvconftest)

dtb-$(CONFIG_TEGRA_OOT_MODULE) += overlay/tegra234-p3767-camera-p3768-dual-rp-imx296.dtbo
