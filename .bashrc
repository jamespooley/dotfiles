shopt -s globstar

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'

alias timestamp='date "+%s"'

alias R='R --no-save'

alias tmux='tmux -2'

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

mkpass {
  if [ $1 ]; then
    length=$1
  else
    length=12
  fi
  _hash=`python3 -c "
  import os,base64
  exec('print(base64.b64encode(os.urandom(64))[:${length}].decode(\'utf-8\'))')"`
  echo $_hash | xclip -selection clipboard
  echo "New password copied to system clipboard"
}

try {
  python3 -c "
  exec('''
  try:
      import ${1} as _
      print(_.__file__)
  except Exception as e:
      print(e)
  ''')"
}

csv2json {
  python3 -c "
  exec('''
  import csv,json
  print(json.dumps(list(csv.reader(open(\'${1}\')))))
  ''')"
}

export EDITOR=`which vim`

export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# export PS1="\[\033[95m\]\u@\h \[\033[32m\]\W\[\033[33m\] [\$(git symbolic-ref --short HEAD 2>/dev/null)]\[\033[00m\]\$ "

if [[ -e /usr/lib/git-core/git-sh-prompt ]]; then

  source /usr/lib/git-core/git-sh-prompt
  export GIT_PS1_SHOWCOLORHINTS=true
  export GIT_PS1_SHOWDIRTYSTATE=true
  export GIT_PS1_SHOWUNTRACKEDFILES=true
  export GIT_PS1_SHOWUPSTREAM="auto"
  # PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'

  # use existing PS1 settings
  PROMPT_COMMAND=$(sed -r 's|^(.+)(\\\$\s*)$|__git_ps1 "\1" "\2"|' <<< $PS1)
fi

function mcd() {
  if [[ ! -d "$1" ]]; then
    mkdir -p "$1"
    cd "$1"
  fi
}

. ~/.bash_prompt

export SPARK_HOME="$HOME/bin/spark-3.0.0"'
