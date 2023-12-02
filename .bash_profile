# Author: Ahmid-Ra (github.com/snuggs)

# Gist: https://gist.github.com/snuggs/d4df3a974c482fe3473de361bb949b23
# *********************************************************************

# [ -r ~/.bashrc ] && source ~/.bashrc


# ALIAS WITH PARAMETER - https://stackoverflow.com/a/7131683
# AKA FUNCTIONS

weigh() { # https://www.redhat.com/sysadmin/du-command-options
  #local FLAGS="--summarize --total --human-readable --time"
  local FLAGS="--total --all --human-readable --time --max-depth=1"
  # do things with parameters like $1 such as.
  du -hxd1 "$1"
}

alias cl=clear
alias b='bundle exec'
alias spec='bundle exec rspec'

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
