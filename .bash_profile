# *********************************************************************
# Author: Ahmid-Ra (github.com/snuggs)

# Gist: https://gist.github.com/snuggs/d4df3a974c482fe3473de361bb949b23
# *********************************************************************

# [ -r ~/.bashrc ] &bashrc

# colors.sh ***********************************************************
#   - Benchmark - https://imgur.com/xIyuaYt
#   - https://ditig.com/256-colors-cheat-sheet
#   - https://tldp.org/HOWTO/Bash-Prompt-HOWTO/c583.html
#   - https://misc.flogisoft.com/bash/tip_colors_and_formatting
#   - https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797
#   - https://stackoverflow.com/questions/4842424/list-of-ansi-color-escape-sequences
#   - https://unix.stackexchange.com/questions/274453/is-there-any-objective-benefit-to-escape-sequences-over-tput
#
#   Note: Some control escape sequences, like \e for ESC, are not guaranteed
#   to work in all languages and compilers. It is recommended to use
#   the decimal 27, octal \033, or hex \x1B representation as escape code.
# ----------------------------------------------------------
# 256 ansi colors # Where N is a color code {0-256}
# \e[38;5;Nm # foreground
# \e[48;5;Nm # background
# resets ----
NC=$(tput sgr0) # No Color
DEFAULT=$(tput setaf 9) # Default
# format ----
BOLD=$(tput bold)
DIM=$(tput dim)
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

echo -e "I ${REVERSE}${MAGENTA}love${NC} ${NC}devPunks\n"
# *********************************************************************

# ----------------------
# shell
# ----------------------
# https://bash.cyberciti.biz/guide/Reset_command
# https://bash.cyberciti.biz/guide/Console_management
# https://invisible-island.net/ncurses/man/tput.1.html#h2-HISTORY
# https://invisible-island.net/ncurses/man/tset.1.html#h2-HISTORY
# https://unix.stackexchange.com/questions/335648/why-does-the-reset-command-include-a-delay
# https://unix.stackexchange.com/questions/546918/any-reason-to-not-alias-reset-tput-reset-in-bashrc
# https://stackoverflow.com/questions/2518127/how-to-reload-bashrc-settings-without-logging-out-and-back-in-again
# exec $SHELL --login
# exec env -i HOME="$HOME" TERM="$TERM" "$SHELL" -l
# exec $SHELL --login
alias reload='(
  echo -e "\033c"
  clear
  reset
  stty sane
  tput reset
  setterm --initialize
  tput cup 0 0
  termux-info
  termux-reload-settings
  echo "\n\n\n\$BASH: $BASH Options:\n$BASHOPTS"
  echo "\n\$SHELL: $SHELL Options:\n$SHELLOPTS"
  echo && echo "PATH: $PATH"
  export LINES=$( tput lines )
  export COLUMNS=$( tput columns )
  echo && echo "TTY: $( tty ) Lines: $LINES x Columns: $COLUMNS" && echo
  ps
)'
# https://invisible-island.net/ncurses/man/toe.1m.html
alias term='(
  clear
  echo & echo $(tty) Colors: $(tput colors) Size: $(stty size | tr " " "x")
  echo && echo "TERM=$TERM $( tput -V )" && toe
  echo && echo "stty $(stty -g)" && stty -a
  echo && infocmp -l
  echo && dircolors --print-ls-colors
  echo && colors
)'
alias environment='(
  # https://gnu.org/software/bash/manual/html_node/Programmable-Completion-Builtins.html
  clear
  echo "\n\n\n\$BASH: $BASH\n👇Options👇\n$BASHOPTS"
  echo "\n\$SHELL: $SHELL\n👇Options👇\n$SHELLOPTS"

  # echo && echo Commands:
  # compgen -c
  # echo && echo Var Names:
  # compgen -v

  echo && echo 👇Exports👇
  echo $( compgen -e )
  echo && echo 👇Aliases👇
  echo $( compgen -a ) # alias -p # for declaration
  echo && echo 👇Built-ins👇
  echo $( compgen -b )

  # echo && echo Functions:
  # compgen -A function
  # echo && echo Env Var Names:
  # compgen -k
  # echo && echo Env Vars:
  # env
  # echo && echo Shell Vars:
  # (set -o posix; set; set +o posix)
  # echo && echo Declarations:
  # declare -p | cut -d " " -f 3
)'

alias cl=clear

alias ..='cd ..'
alias pop='popd'
alias push='pushd'

alias dirs='dirs -p'
alias mkdir='mkdir -pv'
alias dir='(
  dir -ailsAFR --time --author --human-readable --group-directories-first --color=auto --hyperlink=auto --hide="{.git,log,node_modules,storage}"
)'

alias most='most +u -s -t2'
# https://unix.stackexchange.com/a/82358
alias tree='tree -ahACDF --du -L 3 --dirsfirst --gitignore'
alias list='exa -FahlT --git --grid --icons --group-directories-first --level=2'
# https://gist.github.com/egmontkob/eb114294efbcd5adb1944c9f3cb5feda
# https://unix.stackexchange.com/questions/282648/using-grep-with-the-exclude-dir-flag-to-exclude-multiple-directories
alias ls='ls -AhlFG --color=auto --hyperlink=auto -k --group-directories-first --hide="{.git,log,node_modules,storage}"'

alias echo='echo -e' # - https://stackoverflow.com/questions/8467424/echo-newline-in-bash-prints-literal-n

alias diff='diff --color=auto' # - https://geeksforgeeks.org/diff-command-linux-examples

# - https://stackoverflow.com/questions/1987926/how-do-i-recursively-grep-all-directories-and-subdirectories
GREP_OPTIONS='-iIn --color=auto --devices=skip --directories=skip --binary-files=without-match --exclude-dir="{.git,log,node_modules,storage}"'
alias grep='grep $GREP_OPTIONS' # https://linuxcommand.org/lc3_man_pages/grep1.html
alias fgrep='LC_ALL=C grep -F $GREP_OPTS'
alias egrep='grep -E $GREP_OPTS'

alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias fc='fc -e vi' # https://geeksforgeeks.org/fc-command-linux-examples
# - https://en.m.wikipedia.org/wiki/Rm_(Unix)
alias rm='echo "rm is disabled, use delete, destroy, or command rm instead."'
alias delete='command rm -dIrv --preserve-root'
# https://geeksforgeeks.org/paste-command-in-linux-with-examples
alias zipper='paste'

alias now='date +"%T"'
alias ping='ping -c 100 -s.2'
alias ports='netstat -tulanp'
alias mount='mount |column -t'
alias path='echo -e ${PATH//:/\\n}'

alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

alias top=htop
alias ps='ps auxf'
alias header='curl -I'
alias wget='wget --continue --no-hsts' # resume downloads & prevent writing HSTs

alias archive='command tar cvf --' # - https://geeksforgeeks.org/tar-command-linux-examples
# SSH(d)------------------------------------------------------------------
#   - https://wiki.termux.com/wiki/Remote_Access
#   - https://github.com/termux/termux-packages/issues/3620
#
# -d - debug level
# -c - for host_certificate_file
# -f - /data/data/com.termux/files/usr/etc/ssh/sshd_config
# -T - test mode
# check
# ~/.ssh/rc
# ~/.ssh/environment
# ~/.ssh/known_hosts
# /data/data/com.termux/files/usr/etc/ssh/ssh_known_hosts
# ~/.ssh/authorized_keys
#   - id_rsa.pub
# SEE ALSO
#   scp(1), sftp(1), ssh(1), ssh-add(1), ssh-agent(1), ssh-keygen(1), ssh-
#   keyscan(1), chroot(2), login.conf(5), moduli(5), sshd_config(5),
#   inetd(8), sftp-server(8)
# alias ss='sshd -DdddT -p22'
alias ss='sshd -Dddd -p8022'

# ----------------------
# tmux
# ----------------------
alias tmux.config='(
  echo && echo Server Options:
  tmux show-options -s
  echo && echo Global Options:
  tmux show-options -g
  echo && echo Global Window Options:
  tmux show-window-options -g
)'

# ----------------------
# Ruby
# ----------------------
alias be='bundle exec'

# ----------------------
# Git Aliases
# ----------------------
alias ga='git add -p'
alias gb='git branch'
alias gc='git commit --message '
alias gd='git diff'
alias gl='git log --graph --oneline --decorate --all --pretty=format:"%h %ad %s" --date=short --all'
alias gp='git push'
alias gr='git rebase -i'
alias gs='git status'
alias gt="(
  # https://git-scm.com/book/en/v2/Git-Basics-Viewing-the-Commit-History
  git log --graph --since='1 day ago' --pretty=format:'%h %ad %an (%ar) \"%s\"'
  echo && echo Total:
  git log --since='1 day ago' | wc -l
)"



# ALIAS WITH PARAMETER - https://stackoverflow.com/a/7131683
# AKA FUNCTIONS
#   - MISC. - https://github.com/RobertAudi/.dotfiles/tree/master/common/.local/bin

# - syslog() - https://stackify.com/syslog-101/
# - systemd Journal Fields - https://real-world-systems.com/docs/systemd.1.html#journal-fields
# - https://cyberciti.biz/tips/howto-linux-unix-write-to-syslog.html
alias logs.sshd="command logcat -s 'sshd:*'"
function logs () {
  command logcat
}
vie () {
  termux-open-url "$1"
  # am start -a android.intent.action.VIEW -d "$1" > /dev/null
}

# https://geeksforgeeks.org/paste-command-in-linux-with-examples
alias zipper=''
# Zip
#   - https://geeksforgeeks.org/zip-command-in-linux-with-examples
function zip {
  clear
  local file=$1
  local contents=${@:2}

  echo file: $file
  echo contents: $contents

  command zip -rv $file $contents # -u for update only

  test -e "$file" \
   && command view $file \
    && command zipinfo $file
}

# Destroy
# - https://en.m.wikipedia.org/wiki/Shred_(Unix)
# - https://computerhope.com/unix/shred.htm
# - https://geeksforgeeks.org/shred-command-in-linux-with-examples
function destroy {
  [ ! -e "$1" ] && return

  shred --force --zero --iterations=5 --remove $1
  echo "💣 destroyed 💥 $1"
}

# Trash
#   - https://manpages.ubuntu.com/manpages/xenial/man1/trash.1.html
function trash {
  #   [ -f "$1" ] || \
  #     [ -d "$1" ]  \
  #       return tree -L 1 $TMPDIR

  [[ -f  "$1" ]] \
    && echo "🚮  Sending to trash \n 🗑 ${1}" \
    && mv -i --strip-trailing-slashes "$1" $TMPDIR

  tree -L 1 $TMPDIR
}

# stream protocol
function stream {
  yes "$1"
}

# https://gnu.org/software/coreutils/manual/html_node/nohup-invocation.html
# https://digitalocean.com/community/tutorials/nohup-command-in-linux
function hold () {
  command nohup --version # https://en.m.wikipedia.org/wiki/Nohup
  # Redirect to stderror AND file
  # tee - https://en.m.wikipedia.org/wiki/Tee_(command)
  # nohup ./foo.sh > out.txt >2&1
}

# Linus - https://gcc.gnu.org/legacy-ml/gcc/2007-12/msg00165.html
function git_clean () {
  # https://stackoverflow.com/questions/5613345/how-to-shrink-the-git-folder
  git repack -a -d --depth=250 --window=250
  # https://web.archive.org/web/20190207210108/http://stevelorek.com/how-to-shrink-a-git-repository.html
  # time git gc --aggressive --prune
}

monitor () {
  htop
  ps
}

weigh () {
  clear
  local location=`realpath ${1:-.}`
  local hide="--exclude={.git,log,node_modules,storage}"

  echo location 👉 $location
  echo hide 👉 $hide

  echo && echo # - https://dev.yorhel.nl/ncdu/man
  [[ -d $location ]] && \
    ncdu -2 -e --color=dark-bg $hide -- "$location"

  # https://geeksforgeeks.org/df-command-in-linux-with-examples
  echo && echo # https://redhat.com/sysadmin/linux-df-command
  df -ah -- "$location"

  # https://geeksforgeeks.org/du-command-linux/
  echo && echo # https://redhat.com/sysadmin/du-command-options
  du --summarize --total --time \
    --human-readable $hide \
  -- "$location"
}

colors () { color && echo && spectrum ; }
color () {
  # https://unix.stackexchange.com/questions/9957/how-to-check-if-bash-can-print-colors
  for i in {0..255} ; do
      printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
      if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
          printf "\n";
      fi
  done
}
spectrum () {
  # https://unix.stackexchange.com/questions/404414/print-true-color-24-bit-test-pattern/404415#404415
  awk \
    -v term_cols="${width:-$(tput cols || echo 80)}" \
    -v term_lines="${height:-$(tput lines || echo 1)}" \
    'BEGIN{
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


# -----------------------------------------------------------------------
# Bindings
#   - https://geeksforgeeks.org/bind-command-in-linux-with-examples
# -----------------------------------------------------------------------
#   See to avoid potential conflicts:
#     - $HOME/.vimrc
#     - $HOME/.termux.conf
#     - $HOME/.termux/termux.properties

alias shortcuts='bind -P'
#
# Case insensitive tab completion in Bash
# http://superuser.com/questions/90196/case-insensitive-tab-completion-in-bash
# bind "set completion-ignore-case on"
# bind "set show-all-if-ambiguous on"

echo "Bash Profile"
