SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_VERSION 1)

# Specify the cross compiler
SET(CMAKE_C_COMPILER $ENV{HOME}/l4t-gcc/aarch64--glibc--stable-2022.08-1/bin/aarch64-linux-gcc)
SET(CMAKE_CXX_COMPILER $ENV{HOME}/l4t-gcc/aarch64--glibc--stable-2022.08-1/bin/aarch64-linux-gcc)

# Search for programs only in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# Search for libraries and headers only in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
