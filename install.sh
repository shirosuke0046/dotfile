#!/bin/bash

PREFIX=$HOME/.config
mkdir -p $PREFIX || exit

DOT_DIR=$PREFIX/dotfiles

if [ -d $DOT_DIR ]; then
    git clone https://github.com/shirosuke0046/dotfiles.git $DOT_DIR
else
    pushd $DOT_DIR
    git pull
    popd
fi

# vim
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf $DOT_DIR/.vimrc $HOME/.vimrc
