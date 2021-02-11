#!/bin/bash

export IANDROID_SRC_PATH=/root/android
export ISYNC_FLAGS='-j8 -c --force-sync --no-clone-bundle --no-tags'
export ICUSTOM_ROM_PREFIX=dot
export IBUILD_DEVICE=tiffany
export IBUILD_TYPE=userdebug
export ILUNCH=$ICUSTOM_ROM_PREFIX"_"$IBUILD_DEVICE"-"$IBUILD_TYPE
export IBUILD_THREAD=$(nproc --all)

cd $IANDROID_SRC_PATH
source build/envsetup.sh
repo sync $ISYNC_FLAGS
lunch $ILUNCH
m bacon -j$IBUILD_THREAD
