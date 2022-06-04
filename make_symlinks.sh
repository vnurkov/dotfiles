#!/bin/bash

# get user homedir
# HOMEDIR=$( getent passwd "$USER" | cut -d: -f6 )
HOMEDIR=$(eval echo "~$USER")
OS_BASH_FILE=$HOMEDIR/.bashrc
OS_VIM_FILE=$HOMEDIR/.vimrc
OS_VIM_DIR=$HOMEDIR/.vim

if [ -f "$OS_BASH_FILE" ]; then
    echo "$OS_BASH_FILE exists, replacing"
    rm -f $OS_BASH_FILE
fi

if [ -f "$OS_VIM_FILE" ]; then
    echo "$OS_VIM_FILE exists, replacing"
    rm -f $OS_VIM_FILE
fi

if [ -f "$OS_VIM_DIR" ]; then
    echo "$OS_VIM_DIR exists, replacing"
    rm -rf $OS_VIM_DIR
fi

# make bashrc symlink
ln -sf $PWD/.bashrc $HOMEDIR/.bashrc && echo "bashrc link created"

# make vimrc symlink
ln -sf $PWD/.vimrc $HOMEDIR/.vimrc && echo "vimrc link created"

# make .vim folder symlink
ln -sf $PWD/.vim $HOMEDIR/.vim && echo "vim folder link created"
