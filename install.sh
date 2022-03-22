#!/bin/bash

PREFIX=$HOME/.config

mkdir -p $PREFIX || exit

git clone https://github.com/shirosuke0046/dotfiles.git $PREFIX/dotfiles

# vim
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf $PREFIX/dotfiles/.vimrc $HOME/.vimrc
vim +":PlugInstall"
