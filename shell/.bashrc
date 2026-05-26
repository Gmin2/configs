# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# Be nice to sysadmins
if [ -f /etc/bashrc ]; then
  source /etc/bashrc
elif [ -f /etc/bash.bashrc ]; then
  source /etc/bash.bashrc
fi
# History management
export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTIGNORE="clear:bg:fg:cd:cd -:cd ..:exit:date:w:* --help:ls:l:ll:lll"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# AsyncAPI CLI Autocomplete
ASYNCAPI_AC_BASH_SETUP_PATH=/home/mintu-ubuntu/.cache/@asyncapi/cli/autocomplete/bash_setup && test -f $ASYNCAPI_AC_BASH_SETUP_PATH && source $ASYNCAPI_AC_BASH_SETUP_PATH; # asyncapi autocomplete setup

source ~/.safe-chain/scripts/init-posix.sh # Safe-chain bash initialization script