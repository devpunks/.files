# Author: Ahmid-Ra (github.com/snuggs)

# Gist: https://gist.github.com/snuggs/d4df3a974c482fe3473de361bb949b23
# *********************************************************************

# [ -r ~/.bashrc ] && source ~/.bashrc


# ----------------------
# shell
# ----------------------

alias cl=clear
alias ..='cd ..'
alias lsg='ls -AhlFG --group-directories-first'
alias list='exa -FahlT --git --grid --icons --group-directories-first --level=2'
alias tre='tree -CDFah --du -L 2 --dirsfirst --gitignore'

# ALIAS WITH PARAMETER - https://stackoverflow.com/a/7131683
# AKA FUNCTIONS

weigh() { # https://www.redhat.com/sysadmin/du-command-options
  #local FLAGS="--summarize --total --human-readable --time"
  local FLAGS="--total --all --human-readable --time --max-depth=1"
  # do things with parameters like $1 such as.
  echo LOCATION "$1"
  echo FLAGS 👉 $FLAGS

  du $FLAGS -- "$1"
}

# ----------------------
# Ruby
# ----------------------

alias be='bundle exec'

# ----------------------
# Git Aliases
# ----------------------

alias ga='git add -p'
alias gb='git branch'
alias gbd='git branch --delete '
#alias gc='git commit'
alias gc='git commit --message '
alias gco='git checkout'
alias gcob='git checkout -b'
alias gd='git diff'
alias gda='git diff HEAD'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gp='git push'
alias gpf='git push -f'
alias gpr='git pull --rebase'
alias gr='git rebase -i'
alias gs='git status'
alias gss='git status --short'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'

echo "Bash Profile"
