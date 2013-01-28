#!/bin/bash
# This must be run within the config directory
CONFIG_DIR=$(pwd)
ln -s $CONFIG_DIR/vim ~/.vim
ln -s $CONFIG_DIR/vimrc ~/.vimrc
ln -s $CONFIG_DIR/gvimrc ~/.gvimrc
ln -s $CONFIG_DIR/irbrc ~/.irbrc
ln -s $CONFIG_DIR/terminator ~/.terminator
ln -s ~/.terminator ~/.config/terminator/config
ln -s $CONFIG_DIR/bashrc ~/.bashrc
ln -s $CONFIG_DIR/zshrc ~/.zshrc
ln -s $CONFIG_DIR/oh-my-zsh ~/.oh-my-zsh
ln -s $CONFIG_DIR/vmailrc ~/.vmailrc
