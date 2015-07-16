#!/bin/bash

#============================================================
# 使用しないファイルはシャープでコメントアウトすること。
#============================================================

BASH_FILES=(
.bashrc
.bash_profile
)

for file in ${BASH_FILES[@]}
do
    ln -s $HOME/dotfiles/bash/$file $HOME/$file
done

GIT_FILES=(
.gitconfig
.git-completion.bash
.git-flow-completion.sh
.git-prompt.sh
)

for file in ${GIT_FILES[@]}
do
    ln -s $HOME/dotfiles/git/$file $HOME/$file
done

VIM_FILES=(
.vimrc
.vimrc.neobundle
)

for file in ${VIM_FILES[@]}
do
    ln -s $HOME/dotfiles/vim/$file $HOME/$file
done

TMUX_FILES=(
.tmux.conf
)

for file in ${TMUX_FILES[@]}
do
    ln -s $HOME/dotfiles/tmux/$file $HOME/$file
done

