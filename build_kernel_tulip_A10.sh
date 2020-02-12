#!/bin/sh
export KERNELDIR=`readlink -f .`
if [ -f ~/WORKING_DIRECTORY/AGNi_stamp.sh ];
	then
	. ~/WORKING_DIRECTORY/AGNi_stamp.sh
fi
if [ -f ~/WORKING_DIRECTORY/gcc-7.5.0_linaro_aarch64.sh ];
	then
	. ~/WORKING_DIRECTORY/gcc-7.5.0_linaro_aarch64.sh
fi

export ARCH=arm64
export SUBARCH=arm64
mkdir -p /mnt/ANDROID/COMPILED_OUT

echo ""
echo " Cross-compiling AGNi Android 10 kernel tulip..."
echo ""

cd $KERNELDIR/

if [ ! -f /mnt/ANDROID/COMPILED_OUT/.config ];
then
    make defconfig O=/mnt/ANDROID/COMPILED_OUT ARCH=arm64 agni_tulip-A10_defconfig
fi

make -j12 O=/mnt/ANDROID/COMPILED_OUT ARCH=arm64

rm -rf $KERNELDIR/BUILT_tulip-A10
mkdir -p $KERNELDIR/BUILT_tulip-A10

#find -name '*.ko' -exec mv -v {} $KERNELDIR/BUILT_tulip-A10/system/lib/modules \;

mv /mnt/ANDROID/COMPILED_OUT/arch/arm64/boot/Image.*-dtb $KERNELDIR/BUILT_tulip-A10/

echo ""
echo "AGNi Android 10 has been built for tulip !!!"

