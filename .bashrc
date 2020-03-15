shopt -s globstar

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'

alias R='R --no-save'

alias pyclean='find . \
  \( -type f -name "*.py[co]" -o -type d -name "__pycache__" \) -delete &&
  echo "Remove *.pyc files and __pycache__ directory"'

alias pg='ps aux | grep -v grep | grep $1'

if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'


vsed() {
  search=$1
  replace=$2
  shift
  shift
  vim -c "bufdo set! eventignore-=Syntax | %s/$search/$replace/gce" $*
}