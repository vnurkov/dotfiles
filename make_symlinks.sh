#!/bin/bash

# get user homedir
HOMEDIR=$( getent passwd "$USER" | cut -d: -f6 )
OS_BASH_FILE=$HOMEDIR/.bashrc
OS_VIM_FILE=$HOMEDIR/.vimrc

if [ -f "$OS_BASH_FILE" ]; then
    echo "$OS_BASH_FILE exists"
fi

if [ -f "$OS_VIM_FILE" ]; then
    echo "$OS_VIM_FILE exists"
fi

# make bashrc symlink
ln -sf $PWD/.bashrc $HOMEDIR/.bashrc && echo "bashrc link created"

# make vimrc symlink
ln -sf $PWD/.vimrc $HOMEDIR/.vimrc && echo "vimrc link created"
