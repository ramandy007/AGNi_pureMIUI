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
echo " Cross-compiling AGNi pureMIUI pie kernel tulip..."
echo ""

cd $KERNELDIR/

if [ ! -f /mnt/ANDROID/COMPILED_OUT/.config ];
then
    make defconfig O=/mnt/ANDROID/COMPILED_OUT ARCH=arm64 agni_tulip-miui_defconfig
fi

make -j12 O=/mnt/ANDROID/COMPILED_OUT ARCH=arm64

rm -rf $KERNELDIR/BUILT_tulip-miui_pie
mkdir -p $KERNELDIR/BUILT_tulip-miui_pie

#find -name '*.ko' -exec mv -v {} $KERNELDIR/BUILT_tulip-miui/system/lib/modules \;

mv /mnt/ANDROID/COMPILED_OUT/arch/arm64/boot/Image.*-dtb $KERNELDIR/BUILT_tulip-miui_pie/

echo ""
echo "AGNi pureMIUI pie has been built for tulip !!!"

