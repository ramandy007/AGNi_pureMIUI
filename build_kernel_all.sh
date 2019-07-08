#!/bin/sh
export KERNELDIR=`readlink -f .`
cd $KERNELDIR;
COUT="/mnt/ANDROID/COMPILED_OUT"

rm -rf BUILT_*
rm $COUT/.config $COUT/.config.old

echo "-----------------------------------------------------------------------"
echo " "
echo "          BATCH MODE: Building AGNi whyred MIUI variant..."
./build_kernel_whyred_miui.sh || exit 1
rm $COUT/.config $COUT/.config.old
echo " "
echo "          BATCH MODE: Built AGNi whyred MIUI variant!!!"
echo "-----------------------------------------------------------------------"
echo " "

echo "-----------------------------------------------------------------------"
echo " "
echo "          BATCH MODE: Building AGNi whyred MIUI f2fs variant..."
./build_kernel_whyred_miui-f2fs.sh || exit 1
rm $COUT/.config $COUT/.config.old
echo " "
echo "          BATCH MODE: Built AGNi whyred MIUI f2fs variant!!!"
echo "-----------------------------------------------------------------------"
echo " "

echo "-----------------------------------------------------------------------"
echo " "
echo "          BATCH MODE: Building AGNi whyred Pie variant..."
./build_kernel_whyred_pie.sh || exit 1
rm $COUT/.config $COUT/.config.old
echo " "
echo "          BATCH MODE: Built AGNi whyred Pie variant!!!"
echo "-----------------------------------------------------------------------"
echo " "

echo " "
echo "-----------------------------------------------------------------------"
echo " "
echo "          BATCH MODE: Building AGNi MIUI tulip variant..."
./build_kernel_tulip_miui.sh || exit 1
rm $COUT/.config $COUT/.config.old
echo " "
echo "          BATCH MODE: Built AGNi MIUI tulip variant!!!"
echo "-----------------------------------------------------------------------"
echo " "

echo "-----------------------------------------------------------------------"
echo " "
echo "          BATCH MODE: Building AGNi tulip PIE variant..."
./build_kernel_tulip_pie.sh || exit 1
rm $COUT/.config $COUT/.config.old
echo " "
echo "          BATCH MODE: Built AGNi tulip PIE variant!!!"
echo "-----------------------------------------------------------------------"
echo " "

echo "          BATCH MODE: Built ALL variants !!!"

