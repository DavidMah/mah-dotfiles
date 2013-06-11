#!/bin/bash
# This must be run within the config directory
CONFIG_DIR=$(pwd)
ln -b -s $CONFIG_DIR/vim ~/.vim
ln -b -s $CONFIG_DIR/vimrc ~/.vimrc
ln -b -s $CONFIG_DIR/gvimrc ~/.gvimrc
ln -b -s $CONFIG_DIR/irbrc ~/.irbrc
ln -b -s $CONFIG_DIR/terminator ~/.terminator
ln -b -s ~/.terminator ~/.config/terminator/config
ln -b -s $CONFIG_DIR/bashrc ~/.bashrc
ln -b -s $CONFIG_DIR/zshrc ~/.zshrc
ln -b -s $CONFIG_DIR/oh-my-zsh ~/.oh-my-zsh
ln -b -s $CONFIG_DIR/vmailrc ~/.vmailrc
