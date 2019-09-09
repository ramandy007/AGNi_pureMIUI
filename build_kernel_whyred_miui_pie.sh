#!/bin/sh
export KERNELDIR=`readlink -f .`
if [ -f ~/WORKING_DIRECTORY/AGNi_stamp.sh ];
	then
	. ~/WORKING_DIRECTORY/AGNi_stamp.sh
fi
if [ -f ~/WORKING_DIRECTORY/gcc-8.x-uber_aarch64.sh ];
	then
	. ~/WORKING_DIRECTORY/gcc-8.x-uber_aarch64.sh
fi

export ARCH=arm64
export SUBARCH=arm64
mkdir -p /mnt/ANDROID/COMPILED_OUT

echo ""
echo " Cross-compiling AGNi pureMIUI pie kernel whyred..."
echo ""

cd $KERNELDIR/

if [ ! -f /mnt/ANDROID/COMPILED_OUT/.config ];
then
    make defconfig O=/mnt/ANDROID/COMPILED_OUT ARCH=arm64 agni_whyred-miui_defconfig
fi

make -j8 O=/mnt/ANDROID/COMPILED_OUT ARCH=arm64

rm -rf $KERNELDIR/BUILT_whyred-miui_pie
mkdir -p $KERNELDIR/BUILT_whyred-miui_pie

#find -name '*.ko' -exec mv -v {} $KERNELDIR/BUILT_whyred-miui/system/lib/modules \;

mv /mnt/ANDROID/COMPILED_OUT/arch/arm64/boot/Image.*-dtb $KERNELDIR/BUILT_whyred-miui_pie/

echo ""
echo "AGNi pureMIUI pie has been built for whyred !!!"

