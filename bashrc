#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# define prompt
function prompt {
    local OK_OR_ERR=$?

    local BLACK="\[\033[0;30m\]"
    local RED="\[\033[0;31m\]"
    local GREEN="\[\033[0;32m\]"
    local BROWN="\[\033[0;33m\]"
    local BLUE="\[\033[0;34m\]"
    local PURPLE="\[\033[0;35m\]"
    local CYAN="\[\033[0;36m\]"
    local LIGHT_GRAY="\[\033[0;37m\]"

    local DARK_GRAY="\[\033[1;30m\]"
    local LIGHT_RED="\[\033[1;31m\]"
    local LIGHT_GREEN="\[\033[1;32m\]"
    local YELLOW="\[\033[1;33m\]"
    local LIGHT_BLUE="\[\033[1;34m\]"
    local LIGHT_PURPLE="\[\033[1;35m\]"
    local LIGHT_CYAN="\[\033[1;36m\]"
    local WHITE="\[\033[1;37m\]"

    local NO_COLOR="\[\033[0m\]"

    local TIME="\A"
    local DATE="$(date +%y/%m/%d)"
    local USERNAME="\u"
    local HOSTNAME="\h"
    local PWD=`pwd | awk 'BEGIN { FS = "/"} ; { print $(NF-1)"/"$NF}'`

    if [ $OK_OR_ERR = 0 ]; then
        PS1=''$GREEN'[OK]'$BLUE'['$HOSTNAME':'$RED$PWD']'$NO_COLOR' '
    else
        PS1=''$RED'['$OK_OR_ERR']'$BLUE'['$HOSTNAME':'$RED$PWD']'$NO_COLOR' '
    fi
}

PROMPT_COMMAND=prompt

PS1='[\u@\h \W]\$ '

# python virtualenv initialization
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

# my commands

# default text editor
export VISUAL="vim"

# perl home for libraries - the library for perun-RPC modules
export PERL5LIB=/home/jm/Work/Java/perun/perun-rpc/src/main/perl

# the perun-RPC scripts need URL to connect
export PERUN_URL=https://perun-dev.meta.zcu.cz/krb/rpc-xmauritz/
#export PERUN_URL=https://perun-dev.meta.zcu.cz/krb/rpc/
#export PERUN_URL=https://perun.metacentrum.cz/krb/rpc/

# alias for kerberos login
alias ker="kinit xmauritz@META"
# alias for tunnel to perun
alias sspp="echo creating tunnel for db on port 5432; ssh -L5432:localhost:5432 perun@perun-dev.meta.zcu.cz"
# alias for my account to perun server
alias ssmp="ssh xmauritz@perun-dev.meta.zcu.cz"
# alias for listing newest downloaded
alias nd="ls -l --sort=time -1 -h ~/downloads | head"
# alias for searching
alias f="find -L . -name "

# aliases for ls
alias ls='ls --color=auto'
alias ll="ls -lhF"
alias l="ls -h"
alias la="ls -alh"

# aliases
alias perunprod="export PERUN_URL=https://perun.metacentrum.cz/krb/rpc/"
alias perundev="export PERUN_URL=https://perun-dev.meta.zcu.cz/krb/rpc/"

# alias for secure.ods
alias sec="gpg -d ~/.secure.ods.gpg > ~/.secure.ods && libreoffice ~/.secure.ods"
alias savesec="gpg -c ~/.secure.ods && rm ~/.secure.ods"

# z script
. ~/programmes/scripts/z.sh
