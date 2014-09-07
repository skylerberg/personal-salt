export EDITOR=vim
export PS1="\[\033[01;32m\]\u \[\033[01;31m\]\t\[\033[01;34m\] \w \$\[\033[00m\] "

alias mkcd='_(){ mkdir $1; cd $1; }; _'
alias update="sudo apt-get update && sudo apt-get -y upgrade"
alias ..="cd .."
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias vi='vim'
alias grep='grep --color=auto'
alias ls='ls --color'
alias l=ls


# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

