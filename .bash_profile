# *********************************************************************
# Author: Ahmid-Ra (github.com/snuggs)

# Gist: https://gist.github.com/snuggs/d4df3a974c482fe3473de361bb949b23
# *********************************************************************

# [ -r ~/.bashrc ] &bashrc

# colors.sh ***********************************************************
#   - https://misc.flogisoft.com/bash/tip_colors_and_formatting
#   - https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797
#
#   Note: Some control escape sequences, like \e for ESC, are not guaranteed to work in all languages and compilers. It is recommended to use the decimal 27, octal \033, or hex \x1B representation as escape code.
# ----------------------------------------------------------
# 256 ansi colors # Where N is a color code {0-256}
# \e[38;5;Nm # foreground
# \e[48;5;Nm # background
# resets ----
NC=$(tput sgr0) # No Color
DEFAULT=$(tput setaf 9) # Default
# format ----
BOLD=$(tput bold)
DIM='\e[2m'
REVERSE=$(tput rev)
UNDERLINE=$(tput smul)
# colors ----
BLACK=$(tput setaf 0)
GRAY='\033[1;30m'
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
GREEN_LIGHT='\033[1;32m'
YELLOW=$(tput setaf 3)
BROWN='\033[0;33m'
BLUE=$(tput setaf 4)
BLUE_LIGHT='\033[1;34m'
MAGENTA=$(tput setaf 5)
MAGENTA_LIGHT='\033[0;95m'
CYAN=$(tput setaf 6)
CYAN_LIGHT='\033[1;36m'
WHITE=$(tput setaf 7)
GRAY_LIGHT='\033[0;37m'
# background ----
BG_BLACK=$(tput setab 0)
BG_RED=$(tput setab 1)
BG_GREEN=$(tput setab 2)
BG_YELLOW=$(tput setab 3)
BG_BLUE=$(tput setab 4)
BG_MAGENTA=$(tput setab 5)
BG_CYAN=$(tput setab 6)
BG_WHITE=$(tput setab 7)

echo "I ${REVERSE}${MAGENTA}love${NC} ${WHITE}devPunks\n"
# *********************************************************************

# ----------------------
# shell
# ----------------------
alias reload='(
  termux-reload-settings
  stty sane
  tput reset
  export LINES=$(tput lines)
  export COLUMNS=$(tput columns)
)'
# https://invisible-island.net/ncurses/man/toe.1m.html
alias term='(
  clear
  echo Size: $(stty size | tr " " "x")
  echo Colors: $(tput colors)
  echo && colors
  echo && echo "stty $(stty -g)" && stty -a
  echo && stty -a
  echo && infocmp
  echo && toe
  echo && spectrum
)'
alias mo='most +u -s -t2'
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

colors() {
  # https://unix.stackexchange.com/questions/9957/how-to-check-if-bash-can-print-colors
  for i in {0..255} ; do
      printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
      if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
          printf "\n";
      fi
  done
}
spectrum() {
  # https://unix.stackexchange.com/questions/404414/print-true-color-24-bit-test-pattern/404415#404415
  awk -v term_cols="${width:-$(tput cols || echo 80)}" -v term_lines="${height:-$(tput lines || echo 1)}" 'BEGIN{
      s="/\\";
      total_cols=term_cols*term_lines;
      for (colnum = 0; colnum<total_cols; colnum++) {
          r = 255-(colnum*255/total_cols);
          g = (colnum*510/total_cols);
          b = (colnum*255/total_cols);
          if (g>255) g = 510-g;
          printf "\033[48;2;%d;%d;%dm", r,g,b;
          printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
          printf "%s\033[0m", substr(s,colnum%2+1,1);
          if (colnum%term_cols==term_cols) printf "\n";
      }
      printf "\n";
  }'
}

echo "Bash Profile"
