#!/bin/bash

export IANDROID_SRC_PATH=$HOME//android
export ISYNC_FLAGS='-j8 -c --force-sync --no-clone-bundle --no-tags'
export ICUSTOM_ROM_PREFIX=aosp
export IBUILD_DEVICE=tiffany
export IBUILD_TYPE=userdebug
export ILUNCH=$ICUSTOM_ROM_PREFIX"_"$IBUILD_DEVICE"-"$IBUILD_TYPE
export IBUILD_THREAD=4

cd $IANDROID_SRC_PATH
source build/envsetup.sh
repo sync $ISYNC_FLAGS
lunch $ILUNCH
m bacon -j$IBUILD_THREAD
