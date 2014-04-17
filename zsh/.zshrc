#!/usr/bin/sh

HISTFILE=~/.zsh_history

HISTSIZE=1000
SAVEHIST=1000

cdpath=(.. ~)

#prompt="<$USER@%m%%%~> "
#prompt="<`whoami`@%m%%%~> "
prompt="`hostname -s`# "
RPROMPT='[%~ %T]'
#export LC_ALL=ja_JP.eucJP
#export LANG=ja_JP.eucJP
export LC_ALL=C
export LANG=C

export PATH=/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/mysql/bin
export MANPATH=/usr/share/man:/usr/local/man:/usr/X11/man:/usr/X11R6/man
export JMANPATH=/usr/local/man:/usr/man:/usr/local/man/ja:/usr/share/man/ja:/usr/X11R6/man/ja:/usr/share/man:/usr/X11R6/man
export TERM=vt100

#export  PAGER=jless
#export  EXINIT='set showmode'
#export  HOST=`hostname`
export  EDITOR=vim

export HISTFILE=~/.history/history.`date +%y%m%d%H%M`

#export CVSROOT=:pserver:www@cvs.paq.to:/usr/local/CVS
export CVSEDITOR=vim

export PERL_BADLANG=0

bindkey -e

# aliases

alias   sl='ls -Fa'
alias   ls='ls -Fa'
alias   la='ls -a'
alias   ll='ls -la'
alias   dir='dir -pa'
alias   rm='rm -i'
alias   cp='cp -i'
alias   mv='mv -i'
alias   vi='vim'
alias   less='lv'

ulimit -n 65536

