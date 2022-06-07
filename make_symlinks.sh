#!/bin/bash

# get user homedir
# HOMEDIR=$( getent passwd "$USER" | cut -d: -f6 )
HOMEDIR=$(eval printf "~$USER")
OS_BASH_FILE=$HOMEDIR/.bashrc 
OS_VIM_FILE=$HOMEDIR/.vimrc
OS_VIM_DIR=$HOMEDIR/.vim

if [ -f "$OS_BASH_FILE" ]; then
    if readlink -q "$OS_BASH_FILE"; then
        printf "bashrc symlink found, unlinking...\n"
        unlink $OS_BASH_FILE && printf "$OS_BASH_FILE Unlinked!\n\n"
    else
        printf "bashrc file found, deleting...\n"
        rm -f $OS_BASH_FILE && printf "$OS_BASH_FILE Deleted!\n\n"
    fi
fi

if [ -f "$OS_VIM_FILE" ]; then
    if readlink "$OS_VIM_FILE"; then
        printf "vimrc symlink found, unlinking...\n"
        unlink $OS_VIM_FILE && printf "$OS_VIM_FILE Unlinked!\n\n"
    else
        printf "vimrc file found, deleting...\n"
        rm -f $OS_VIM_FILE && printf "$OS_VIM_FILE Deleted!\n\n"
    fi
fi

if [ -d "$OS_VIM_DIR" ]; then
    if readlink "$OS_VIM_DIR"; then
        printf "vim folder symlink found, unlinking...\n"
        unlink $OS_VIM_DIR && printf "$OS_VIM_DIR Unlinked!\n\n"
    else
        printf "vim folder found, deleting...\n"
        rm -rf $OS_VIM_DIR && printf "$OS_VIM_DIR Deleted!\n\n"
    fi
fi

# make bashrc symlink
ln -sf $PWD/.bashrc $OS_BASH_FILE && printf "bashrc link created\n"

# make vimrc symlink
ln -sf $PWD/.vimrc $OS_VIM_FILE && printf "vimrc link created\n"

# make .vim folder symlink
ln -sf $PWD/.vim $OS_VIM_DIR && printf "vim folder link created\n"
