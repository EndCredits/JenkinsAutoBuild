#!/bin/bash

export IREPO_PATH=$HOME/jk-scripts/repo
export RC_PATH=$HOME
export RC_NAME=.bashrc

mkdir -p $IREPO_PATH

curl https://mirrors.tuna.tsinghua.edu.cn/git/git-repo -o $IREPO_PATH/repo

chmod a+x $IREPO_PATH/repo

echo "# Add repo tool to PATH" >> $RC_PATH/$RC_NAME
echo "PATH="$IREPO_PATH:$PATH"" >> $RC_PATH/$RC_NAME
source $RC_PATH/$RC_NAME
