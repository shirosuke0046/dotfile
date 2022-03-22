#!/bin/bash

PREFIX=$HOME/.config

mkdir -p $PREFIX || exit

git clone https://github.com/shirosuke0046/dotfiles.git

for file in .vimrc; do
	ln -sf $PREFIX/dotfiles/$file $HOME/$file 
done
