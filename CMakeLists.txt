# Used strictly for syntax checking and code spelunking in CLion
# See the README for build instructions

cmake_minimum_required(VERSION 3.14)
set(PROJECT_NAME imx296)
project(${PROJECT_NAME})

# File structure is set up by vc-jetson-driver-release
set(JDR_DIR $ENV{HOME}/projects/vc-jetson-driver-release)

# Cross-compile settings
set(TOOLCHAIN_DIR ${JDR_DIR}/aarch64--glibc--stable-2022.08-1)
SET(CMAKE_C_COMPILER ${TOOLCHAIN_DIR}/bin/aarch64-linux-gcc)
SET(CMAKE_CXX_COMPILER ${TOOLCHAIN_DIR}/bin/aarch64-linux-gcc)
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(KERNEL_SRC ${JDR_DIR}/Linux_for_Tegra/kernel/linux-headers-5.15.148-tegra-ubuntu22.04_aarch64/3rdparty/canonical/linux-jammy/kernel-source)

# Copied from RPi and modified
add_library(rp_imx296 rp_imx296.c)

target_include_directories(rp_imx296 PRIVATE
    ${KERNEL_SRC}/arch/arm64/include
    ${KERNEL_SRC}/arch/arm64/include/generated
    ${KERNEL_SRC}/include
    ${KERNEL_SRC}/arch/arm64/include/uapi
    ${KERNEL_SRC}/include/uapi
    ${KERNEL_SRC}/include/generated/uapi
    ${KERNEL_SRC}/ubuntu/include
    ${JDR_DIR}/out/nvidia-conftest
    ${JDR_DIR}/nvidia-oot/include
    ${JDR_DIR}/nvidia-oot/include
    ${JDR_DIR}/nvidia-oot/drivers/gpu/host1x/hw
    ${JDR_DIR}/nvidia-oot/drivers/video/tegra/host
    ${JDR_DIR}/nvidia-oot/drivers/gpu/host1x/include
    ${JDR_DIR}/nvidia-hwpm/include
)

target_compile_options(rp_imx296 PRIVATE
    -include ${KERNEL_SRC}/include/linux/kconfig.h
)

target_compile_definitions(rp_imx296 PRIVATE
    __KERNEL__
    KASAN_SHADOW_SCALE_SHIFT=
    CONFIG_CC_HAS_K_CONSTRAINT=1
    CONFIG_V4L2_ASYNC
    CONFIG_V4L2_FWNODE
    CONFIG_VIDEOBUF2_DMA_CONTIG
    MODULE
    KBUILD_BASENAME=nv_rp_imx296
    KBUILD_MODNAME="rp_imx296"
    __KBUILD_MODNAME="kmod_nv_rp_imx296"
)
