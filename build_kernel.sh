#!/bin/bash

export ARCH=arm64
export SUBARCH=arm64
mkdir -p out

export PATH=$(pwd)/toolchain/neutron-clang/bin:$PATH
export CC=clang
export CLANG_TRIPLE=aarch64-linux-gnu-
export CROSS_COMPILE=aarch64-linux-gnu-
KERNEL_MAKE_ENV="DTC_EXT=$(pwd)/tools/dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y"

make -j64 -C $(pwd) O=$(pwd)/out $KERNEL_MAKE_ENV ARCH=arm64 CROSS_COMPILE=$CROSS_COMPILE

cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image

