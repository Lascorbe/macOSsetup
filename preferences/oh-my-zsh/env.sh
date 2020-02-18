#!/bin/zsh

# rbenv
## PATH
export PATH="$HOME/.rbenv/bin:$PATH"
## Owner
eval "$(rbenv init -)"

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Editing config files
alias zshconfig="code ~/.zshrc"
alias envconfig="code ~/env.sh"

# Tries to find the Xcode workspace or project on the current folder, and opens it. By @orta
openx() {
  if test -n "$(find . -maxdepth 1 -name '*.xcworkspace' -print -quit)"
  then
    echo "Opening workspace"
    open *.xcworkspace
    return
  else
    if test -n "$(find . -maxdepth 1 -name '*.xcodeproj' -print -quit)"
    then
      echo "Opening project"
      open *.xcodeproj
      return
    else
      echo "Nothing found"
    fi
  fi
}
