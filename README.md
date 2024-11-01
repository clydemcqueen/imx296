# IN DEVELOPMENT, DO NOT USE

We would like to use a [Raspberry Pi Global Shutter Camera](https://www.raspberrypi.com/products/raspberry-pi-global-shutter-camera/)
with a [Jetson Orin Nano](https://developer.nvidia.com/embedded/learn/get-started-jetson-orin-nano-devkit)
running [JetPack 6.1](https://developer.nvidia.com/embedded/jetpack).

This project backports Laurent Pinchart's camera driver from Linux 6.6 to Linux 5.15, and adds a device tree blob for the Orin.

> Status: the driver compiles and links, but does not successfully load on the Orin Nano.
> There are certainly bugs in the device tree blob, and quite possibly bugs in the driver itself.

## Driver History

* Laurent Pinchart added a driver for the Sony IMX296 sensor to the Linux kernel on 5-Feb-2023.
[See commit.](https://github.com/torvalds/linux/commit/cb33db2b6ccfe3ccc13347755ab3ef38691d59c3)
This was released in Linux kernel version 6.3.
* The driver is present in Raspbian Bookworm (Linux kernel 6.6) and supports the Raspberry Pi Global Shutter Camera.
* The driver is also present in Ubuntu 24.04 LTS and 22.04.5 LTS (HWE)

## Build and Install

Use the framework and instructions in [vc-jetson-driver-release](https://github.com/apl-ocean-engineering/vc-jetson-driver-release)
to build and install the driver.

The CMakeLists.txt file is used by CLion to aid development. It is not sufficient to build the driver.