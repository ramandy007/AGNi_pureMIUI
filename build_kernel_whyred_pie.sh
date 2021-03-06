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
echo " Cross-compiling AGNi purePIE kernel whyred..."
echo ""

cd $KERNELDIR/

if [ ! -f /mnt/ANDROID/COMPILED_OUT/.config ];
then
    make defconfig O=/mnt/ANDROID/COMPILED_OUT ARCH=arm64 agni_whyred-pie_defconfig
fi

make -j12 O=/mnt/ANDROID/COMPILED_OUT ARCH=arm64

rm -rf $KERNELDIR/BUILT_whyred-pie
mkdir -p $KERNELDIR/BUILT_whyred-pie

#find -name '*.ko' -exec mv -v {} $KERNELDIR/BUILT_whyred-pie/system/lib/modules \;

mv /mnt/ANDROID/COMPILED_OUT/arch/arm64/boot/Image.*-dtb $KERNELDIR/BUILT_whyred-pie/

echo ""
echo "AGNi purePIE has been built for whyred !!!"

