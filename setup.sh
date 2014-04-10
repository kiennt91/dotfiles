#!/bin/bash

#============================================================
# 使用しないファイルはシャープでコメントアウトすること。
#============================================================

DOT_FILES=(
.bashrc
.bash_profile
.gitconfig
.git-completion.bash
.git-flow-completion.sh
.git-prompt.sh
.vimrc
.vimrc.neobundle
)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done


