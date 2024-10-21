cmake_minimum_required(VERSION 3.14)
set(PROJECT_NAME imx296)
project(${PROJECT_NAME})

# Cross-compile settings
SET(CMAKE_C_COMPILER $ENV{HOME}/l4t-gcc/aarch64--glibc--stable-2022.08-1/bin/aarch64-linux-gcc)
SET(CMAKE_CXX_COMPILER $ENV{HOME}/l4t-gcc/aarch64--glibc--stable-2022.08-1/bin/aarch64-linux-gcc)
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(TEGRA_SRC_DIR $ENV{HOME}/nvidia/nvidia_sdk/JetPack_6.1_Linux_JETSON_ORIN_NANO_TARGETS/Linux_for_Tegra/source)
set(KERNEL_HEADERS ${TEGRA_SRC_DIR}/kernel/kernel-jammy-src)

# Copied from RPi
add_library(imx296 imx296.c)

target_include_directories(imx296 PRIVATE
    ${KERNEL_HEADERS}/arch/arm64/include
    ${KERNEL_HEADERS}/arch/arm64/include/generated
    ${KERNEL_HEADERS}/include
    ${KERNEL_HEADERS}/arch/arm64/include/uapi
    ${KERNEL_HEADERS}/include/uapi
    ${KERNEL_HEADERS}/include/generated/uapi
    ${KERNEL_HEADERS}/ubuntu/include
    ${TEGRA_SRC_DIR}/out/nvidia-conftest
    ${TEGRA_SRC_DIR}/nvidia-oot/include
    ${TEGRA_SRC_DIR}/nvidia-oot/include
    ${TEGRA_SRC_DIR}/nvidia-oot/drivers/gpu/host1x/hw/
    ${TEGRA_SRC_DIR}/nvidia-oot/drivers/video/tegra/host/
    ${TEGRA_SRC_DIR}/nvidia-oot/drivers/gpu/host1x/include
    ${TEGRA_SRC_DIR}/hwpm/include
)

target_compile_options(imx296 PRIVATE
    -include ${KERNEL_HEADERS}/include/linux/kconfig.h
)

target_compile_definitions(imx296 PRIVATE
    __KERNEL__
    KASAN_SHADOW_SCALE_SHIFT=
    CONFIG_CC_HAS_K_CONSTRAINT=1
    CONFIG_V4L2_ASYNC
    CONFIG_V4L2_FWNODE
    CONFIG_VIDEOBUF2_DMA_CONTIG
    MODULE
    KBUILD_BASENAME=nv_imx296
    KBUILD_MODNAME=imx296
    __KBUILD_MODNAME=kmod_nv_imx296
)

# Copied from L4T 36.4 -- an example
add_library(imx219 imx219.c)

target_include_directories(imx219 PRIVATE
    ${KERNEL_HEADERS}/arch/arm64/include
    ${KERNEL_HEADERS}/arch/arm64/include/generated
    ${KERNEL_HEADERS}/include
    ${KERNEL_HEADERS}/arch/arm64/include/uapi
    ${KERNEL_HEADERS}/include/uapi
    ${KERNEL_HEADERS}/include/generated/uapi
    ${KERNEL_HEADERS}/ubuntu/include
    ${TEGRA_SRC_DIR}/out/nvidia-conftest
    ${TEGRA_SRC_DIR}/nvidia-oot/include
    ${TEGRA_SRC_DIR}/nvidia-oot/include
    ${TEGRA_SRC_DIR}/nvidia-oot/drivers/gpu/host1x/hw/
    ${TEGRA_SRC_DIR}/nvidia-oot/drivers/video/tegra/host/
    ${TEGRA_SRC_DIR}/nvidia-oot/drivers/gpu/host1x/include
    ${TEGRA_SRC_DIR}/hwpm/include
)

target_compile_options(imx219 PRIVATE
    -include ${KERNEL_HEADERS}/include/linux/kconfig.h
)

target_compile_definitions(imx219 PRIVATE
    __KERNEL__
    KASAN_SHADOW_SCALE_SHIFT=
    CONFIG_CC_HAS_K_CONSTRAINT=1
    CONFIG_V4L2_ASYNC
    CONFIG_V4L2_FWNODE
    CONFIG_VIDEOBUF2_DMA_CONTIG
    MODULE
    KBUILD_BASENAME=nv_imx219
    KBUILD_MODNAME=imx219
    __KBUILD_MODNAME=kmod_nv_imx219
)

# Copied from L4T 36.4 -- an example
add_library(ov5645 ov5645.c)

target_include_directories(ov5645 PRIVATE
    ${KERNEL_HEADERS}/arch/arm64/include
    ${KERNEL_HEADERS}/arch/arm64/include/generated
    ${KERNEL_HEADERS}/include
    ${KERNEL_HEADERS}/arch/arm64/include/uapi
    ${KERNEL_HEADERS}/include/uapi
    ${KERNEL_HEADERS}/include/generated/uapi
    ${KERNEL_HEADERS}/ubuntu/include
    ${TEGRA_SRC_DIR}/out/nvidia-conftest
    ${TEGRA_SRC_DIR}/nvidia-oot/include
    ${TEGRA_SRC_DIR}/nvidia-oot/include
    ${TEGRA_SRC_DIR}/nvidia-oot/drivers/gpu/host1x/hw/
    ${TEGRA_SRC_DIR}/nvidia-oot/drivers/video/tegra/host/
    ${TEGRA_SRC_DIR}/nvidia-oot/drivers/gpu/host1x/include
    ${TEGRA_SRC_DIR}/hwpm/include
)

target_compile_options(ov5645 PRIVATE
    -include ${KERNEL_HEADERS}/include/linux/kconfig.h
)

target_compile_definitions(ov5645 PRIVATE
    __KERNEL__
    KASAN_SHADOW_SCALE_SHIFT=
    CONFIG_CC_HAS_K_CONSTRAINT=1
    CONFIG_V4L2_ASYNC
    CONFIG_V4L2_FWNODE
    CONFIG_VIDEOBUF2_DMA_CONTIG
    MODULE
    KBUILD_BASENAME=nv_ov5645
    KBUILD_MODNAME=ov5645
    __KBUILD_MODNAME=kmod_nv_ov5645
)
