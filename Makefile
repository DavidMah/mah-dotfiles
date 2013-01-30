CONFIG_DIR=$(pwd)
vim:
	ln -s ${CONFIG_DIR}/vim ~/.vim

vimrc:
	ln -s ${CONFIG_DIR}/vimrc ~/.vimrc

gvimrc:
	ln -s ${CONFIG_DIR}/gvimrc ~/.gvimrc

irbrc:
	ln -s ${CONFIG_DIR}/irbrc ~/.irbrc

terminator:
	ln -s ${CONFIG_DIR}/terminator ~/.terminator
	ln -s ~/.terminator ~/.config/terminator/config

bashrc:
	ln -s ${CONFIG_DIR}/bashrc ~/.bashrc

zshrc:
	ln -s ${CONFIG_DIR}/zshrc ~/.zshrc

oh-my-zsh:
	ln -s ${CONFIG_DIR}/oh-my-zsh ~/.oh-my-zsh

vmailrc:
	ln -s ${CONFIG_DIR}/vmailrc ~/.vmailrc

all: vim vimrc gvimrc irbrc terminator bashrc zshrc oh-my-zsh vmailrc
