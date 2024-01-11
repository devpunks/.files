# =========================================================================
# .bash_profile
#
# Author: Ahmid-Ra (github.com/snuggs)
#
# INVOCATION
#   - https://unix.stackexchange.com/questions/43953
#   - https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html

# [ -r $HOME/.bashrc ] && source $HOME/.bashrc

# Hyperlinks
#   - https://gist.github.com/egmontkob/eb114294efbcd5adb1944c9f3cb5feda
# =========================================================================
# colors.sh
#   - Benchmark - https://imgur.com/xIyuaYt
#   - https://ditig.com/256-colors-cheat-sheet
#   - https://stackoverflow.com/questions/4842424
#   - https://stackoverflow.com/questions/27159322
#   - https://unix.stackexchange.com/questions/274453
#   - https://tldp.org/HOWTO/Bash-Prompt-HOWTO/c583.html
#   - https://misc.flogisoft.com/bash/tip_colors_and_formatting
#   - https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797
#   - ANSI Escape Codes - https://en.m.wikipedia.org/wiki/ANSI_escape_code
#   - TERM COLOR DISCUSSION - https://news.ycombinator.com/item?id=30483899
#   - https://tuxthink.blogspot.com/2012/02/changing-font-and-background-of.html?m=1
#
#   Note: Some control escape sequences, like \e for ESC, are not guaranteed
#   to work in all languages and compilers. It is recommended to use
#   the decimal 27, octal \033, or hex \x1B representation as escape code.
# -------------------------------------------------------------------------
# https://gnu.org/software/coreutils/manual/html_node/dircolors-invocation.html
[ -e "$HOME/.dircolors" ] && eval $( dircolors -b "$HOME/.dircolors" )

# 256 ansi colors # Where N is a color code {0-256}
# \e[38;5;Nm # foreground
# \e[48;5;Nm # background
# resets ----
NC=$(tput sgr0) # No Color

# format ----
BOLD=$(tput bold)
DIM=$(tput dim)
REVERSE=$(tput rev)
UNDERLINE=$(tput smul)

# colors ------------
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
PURPLE=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)

# IBM Colors --------------
# https://retrocomputing.stackexchange.com/questions/20043
BLACK_LIGHT=$(tput setaf 8)
RED_LIGHT=$(tput setaf 9)
GREEN_LIGHT=$(tput setaf 10)
YELLOW_LIGHT=$(tput setaf 11)
BLUE_LIGHT=$(tput setaf 12)
PURPLE_LIGHT=$(tput setaf 13) # MAGENTA
CYAN_LIGHT=$(tput setaf 14)
WHITE_LIGHT=$(tput setaf 15)
MAGENTA=$PURPLE_LIGHT

# background ----
BG_BLACK=$(tput setab 0)
BG_RED=$(tput setab 1)
BG_GREEN=$(tput setab 2)
BG_YELLOW=$(tput setab 3)
BG_BLUE=$(tput setab 4)
BG_MAGENTA=$(tput setab 5)
BG_CYAN=$(tput setab 6)
BG_WHITE=$(tput setab 7)

echo "I ${REVERSE}${MAGENTA}love${NC} devPunks"
# =========================================================================
# ----------------------
# shell
# ----------------------
alias cl=clear
alias echo='command echo -e' # for escape characters
alias matrix='command cmatrix -bas -C magenta'

alias ..='command cd ..'
alias pop='command popd'
alias push='command pushd'
alias dirs='command dirs -p'
alias which='command type -a'
alias mkdir='command mkdir -pv'
alias most='command most +u -s -t2'
alias diff='command diff --color=auto' # - https://geeksforgeeks.org/diff-command-linux-examples
alias find='command find -type f -ls . -iname '*'"$1"'*''
alias ls='command ls -AhklFG --color=auto --hyperlink=auto --group-directories-first'
alias list='command exa -ahlFT --git --grid --icons --level=2 --group-directories-first -I ".git|log|node_modules|storage"'
# https://unix.stackexchange.com/a/82358
alias tree='command tree -ahACDF --du -L 2 --dirsfirst --gitignore -I ".git|log|node_modules|storage"'
alias diff='diff --color=auto' # - https://geeksforgeeks.org/diff-command-linux-examples

alias echo='echo -e' # - https://stackoverflow.com/questions/8467424/echo-newline-in-bash-prints-literal-n
alias which='type -a'
alias find='command find . -type f -iname '*'"$1"'*' -ls'

# - https://stackoverflow.com/questions/1987926/how-do-i-recursively-grep-all-directories-and-subdirectories
GREP_OPTIONS='-iIn --color=auto --devices=skip --directories=skip --binary-files=without-match --exclude-dir="{.git,log,node_modules,storage}"'
alias grep='grep $GREP_OPTIONS' # https://linuxcommand.org/lc3_man_pages/grep1.html
alias egrep='grep -E $GREP_OPTS'
alias fgrep='LC_ALL=C grep -F $GREP_OPTS'

alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias fc='fc -e vi' # https://geeksforgeeks.org/fc-command-linux-examples

# - https://en.m.wikipedia.org/wiki/Rm_(Unix)
alias rm='echo "rm is disabled, use delete, destroy, or command rm instead."'
alias delete='command rm -dIrv --preserve-root'
# https://geeksforgeeks.org/paste-command-in-linux-with-examples

alias now='date +"%T"'
alias rand='echo $RANDOM'
alias random='echo $SRANDOM'
alias ping='ping -c 100 -s.2'
alias ports='netstat -tulanp'
alias mount='mount |column -t'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo ${LD_LIBRARY_PATH//:/\\n}'


alias who=whoami
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# https://tecmint.com/ps-command-examples-for-linux-process-monitoring/
alias ps='command ps auxf'
alias jobs='command jobs -l'
alias header='command curl -I'
# https://tecmint.com/fswatch-monitors-files-and-directory-changes-modifications-in-linux/
alias watch='command watch -n 2 $1'
alias wget='command wget --continue --no-hsts' # resume downloads & prevent writing HSTs
alias ip='ip addr | grep -Po '\''(?<=inet)\s(?!127)[^/]+'\'

alias zipper='command paste' # https://geeksforgeeks.org/paste-command-in-linux-with-examples

# SSH(d) ------------------------------------------------------------------
#   - Terrapin Scanner: https://github.com/RUB-NDS/Terrapin-Scanner
#   - https://wiki.termux.com/wiki/Remote_Access
#   - https://www.man7.org/linux/man-pages/man1/ssh.1.html
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
# -X flag for Enable X11 forwarding
alias ss='sshd -X -Dddd -p8022'

# Server ------------------------------------------------------------------
alias serve='python -m http.server'

# TMUX ----------------------
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
  # https://stackoverflow.com/questions/2183900/how-do-i-prevent-git-diff-from-using-a-pager
  GIT_PAGER=cat \
    git log --graph --since='1 day ago' --pretty=format:'%h %ad %an (%ar) \"%s\"'
  echo && echo Total: \
    && git log --since='1 day ago' | wc -l
  echo
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

# {{{ FUNCTIONS ----------------------------------
#   - https://tldp.org/LDP/abs/html/functions.html
#   - https://cuddly-octo-palm-tree.com/posts/2021-10-31-better-bash-functions/
# ------------------------------------------------
open () {
  # apk
  [[ -f $1 ]] && [[ -x $1 ]] && termux-open $1

  # url
  [[ $1 == http* ]] && termux-open-url "$1"

  # android
  # am start -a android.intent.action.VIEW -d "$1" > /dev/null
}

# Archive
# - https://geeksforgeeks.org/tar-command-linux-examples
function archive {
  clear
  local file=$1
  local contents=${@:2}

  echo file: $file
  echo contents: $contents

  command zip -rv $file $contents # -u for update only
  command tar cvzf $file $contents # -u for update only

  # Creates an archive (*.tar.gz) from given directory.
  # tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"

  # Create a ZIP archive of a file or folder.
  # zip -r "${1%%/}.zip" "$1"

  test -e "$file" \
   && command view $file \
    && command zipinfo $file
}

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
    && command view "$file" \
    && echo && command zipinfo "$file" \
    && echo && command unzip -lv "$file"
}

# https://linuxhandbook.com/unzip-command
# https://linuxhandbook.com/gzip-directory
function unpack {
  clear
  local file=$1
  local destination=$2

  echo file: $file
  echo contents: $contents

  echo "Reading contents"
  test -e "$file" \
    && command view "$file" \
    && echo && command zipinfo "$file" \
    && echo && command unzip -lv "$file"

  echo 'Unpack using `unzip` or `tar`'
#  command unzip "$file" "$destination"

  return # for now

  # TODO: Archive routine
  if [ -f $file ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1     ;;
      *.tar.gz)    tar xvzf $1     ;;
      *.bz2)       bunzip2 $1      ;;
      *.rar)       unrar x $1      ;;
      *.gz)        gunzip $1       ;;
      *.tar)       tar xvf $1      ;;
      *.tbz2)      tar xvjf $1     ;;
      *.tgz)       tar xvzf $1     ;;
      *.zip)       unzip $1        ;;
      *.Z)         uncompress $1   ;;
      *.7z)        7z x $1         ;;
      *)           echo "'$1' cannot be extracted via >extract<" ;;
    esac
  else
      echo "'$file' is not a valid file!"
  fi
}

# Destroy
# - https://en.m.wikipedia.org/wiki/Shred_(Unix)
# - https://computerhope.com/unix/shred.htm
# - https://geeksforgeeks.org/shred-command-in-linux-with-examples
function destroy {
  [ ! -e "$1" ] && return

  shred --force --zero --iterations=5 --remove "${1}"
  echo "💣 destroyed 💥 ${1}"
}

function recycle {
  echo ♻ ♲ ♳ ♴ ♵ ♶ ♷ ♸ ♹ ♺ ♼ ♽

  destroy "${TMPDIR}/*.*"
}

# Trash
#   - https://manpages.ubuntu.com/manpages/xenial/man1/trash.1.html
function trash {
  #   [ -f "$1" ] || \
  #     [ -d "$1" ]  \
  #       return tree -L 1 $TMPDIR

  [[ -f  "$1" ]] \
    && echo "🚮  Sending to trash \n 🗑 ${1}" \
    && mv -i --strip-trailing-slashes "${1}" $TMPDIR

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
  htop && ps && echo "\n$(uptime)\n"
}

weigh () {
  clear
  local location=`realpath ${1:-.}`
  local hide="--exclude={.git,log,node_modules,storage}"

  echo location 👉 $location
  echo hide 👉 $hide

  echo && echo # - https://dev.yorhel.nl/ncdu/man
  [[ -d $location ]] && \
    ncdu -2 -e --color=dark-bg \
      $hide -- "$location"

  # https://geeksforgeeks.org/df-command-in-linux-with-examples
  echo && echo # https://redhat.com/sysadmin/linux-df-command
  df -ah -- "$location"

  # https://geeksforgeeks.org/du-command-linux/
  echo && echo # https://redhat.com/sysadmin/du-command-options
  du --summarize --total --time \
    --human-readable $hide \
  -- "$location"
}

colors () {
  echo && echo "$(tty) Colors: $(tput colors)"
  echo && color
  echo && spectrum
  echo
}

color () {
  # https://unix.stackexchange.com/questions/9957/how-to-check-if-bash-can-print-colors
  local bg="\e[48;5;"
  local fg="\e[38;5;"
  local columns=6

  echo && echo ' TERM 8bit'
  printf "  #  %-12s  %-12s\n" Foreground Background
  for n in {0..7} ; do
    printf " ${fg}%sm%2d  %-12s\e[0m  ${bg}%sm %-12s\e[0m\n" \
      "$n" "$n" "${fg}${n}m" "$n" "${bg}${n}m"
  done

  echo && echo ' IBM 16bit'
  printf "  #  %-12s  %-12s\n" Foreground Background
  for n in {8..15} ; do
    printf " ${fg}%sm%2d  %-12s\e[0m  ${bg}%sm %-12s\e[0m\n" \
      "$n" "$n" "${fg}${n}m" "$n" "${bg}${n}m"
  done

  echo && echo ' (extended) TrueColor'
  for n in {16..255} ; do
    printf " ${bg}%sm%3d\e[0m" "$n" "$n"
    if (( ( n > 15 ) && (n-15) % $columns == 0 ))
        then printf "\n";
    fi
  done
}

spectrum () {
  # https://unix.stackexchange.com/questions/404414/print-true-color-24-bit-test-pattern/404415#404415
  echo
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
    }' # BEGIN
}

function environment {
  # https://gnu.org/software/bash/manual/html_node/Programmable-Completion-Builtins.html
  clear
  echo "\n\n\n\$BASH: $BASH\n👇Options👇\n$BASHOPTS"
  echo "\n\$SHELL: $SHELL\n👇Options👇\n$SHELLOPTS"

  echo && echo 👇Commands:👇
  compgen -c | sort | column --fillrows
  echo && echo 👇Shell Variables:👇
  compgen -v | sort | column --fillrows
  echo && echo 👇Exports:👇
  echo $( compgen -e ) | sort | column --fillrows
  echo && echo 👇Built-ins:👇
  echo $( compgen -b ) | sort | column --fillrows
  echo && echo Functions:
  compgen -A function | sort | column --fillrows
  echo && echo 👇Aliases:👇
  echo $( compgen -a ) | sort | column --fillrows # alias -p # for declaration

  echo && echo 👇Reserved Words:👇
  compgen -k | sort | column --fillrows
  echo && echo 👇Env Vars:👇
  env | sort | column --fillrows
  echo && echo 👇Shell Vars:👇
  command echo -e "(set -o posix; set; set +o posix)" | sort | column --fillrows
  echo && command echo 👇Declarations:👇
  declare -p | cut -d " " -f 3 | sort | column --fillrows
}

# https://askubuntu.com/questions/29589/chmod-ux-versus-chmod-x#1075089
# https://superuser.com/questions/168578/why-must-a-folder-be-executable
# https://askubuntu.com/questions/44542/what-is-umask-and-how-does-it-work
# https://theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/how-permissions-chmod-with-numbers-command-explained-777-rwx-unix
# https://askubuntu.com/questions/932713/what-is-the-difference-between-chmod-x-and-chmod-755
function permit {
  echo umask: `umask`
  echo umask -S: `umask -S`

  test ! -e "$1" \
    && echo "Does not exist!" \
    && return

  # chmod -v 755 $1
  chmod -R u=rwX,g=rX,o= "$@"

  ls $1
}

# https://bash.cyberciti.biz/guide/Reset_command
# https://bash.cyberciti.biz/guide/Console_management
# https://invisible-island.net/ncurses/man/tput.1.html#h2-HISTORY
# https://invisible-island.net/ncurses/man/tset.1.html#h2-HISTORY
# https://unix.stackexchange.com/questions/335648/why-does-the-reset-command-include-a-delay
# https://unix.stackexchange.com/questions/546918/any-reason-to-not-alias-reset-tput-reset-in-bashrc
# https://stackoverflow.com/questions/2518127/how-to-reload-bashrc-settings-without-logging-out-and-back-in-again
# exec $SHELL --login
# exec env -i HOME="$HOME" TERM="$TERM" "$SHELL" -l
function reload {
  termux-reload-settings
  [[ -n ${TMUX} ]] && tmux source "$HOME/.tmux.conf"
  clear
# reset # slowwwwww
  tput reset
  tput sgro # reset attributes
  tput op # reset colors
  stty sane
  setterm --initialize
  setterm --resize
  tput cup 0 0
  [ -n ${TMUX} ] && echo && echo tmux -V
  echo && environment
  echo && termux-info
  echo "\n\n\n\$BASH: $BASH Options:\n$BASHOPTS"
  echo "\n\$SHELL: $SHELL Options:\n$SHELLOPTS"
  echo && echo "PATH: $PATH"
  export LINES=$( tput lines )
  export COLUMNS=$( tput columns )
  echo && echo "TTY: $( tty ) Lines: $LINES x Columns: $COLUMNS" && echo
}

# TOE - https://invisible-island.net/ncurses/man/toe.1m.html
# SIGWINCH - https://www.rkoucha.fr/tech_corner/sigwinch.html
# TERMINFO - https://bbs.archlinux.org/viewtopic.php?id=163103
# TIC - https://www.ibm.com/docs/ro/aix/7.1?topic=t-tic-command
# TERMINAL GREETER - https://yalneb.blogspot.com/2019/04/bash-terminal-greeter.html?m=1
function term {
  clear
  echo "\033[7m"
  echo && echo "$(tty) Colors: $(tput colors)"
  echo "\nSize \033[3mROWS\033[23mX\033[3mCOLUMNS\033[23m: $(stty size | tr " " "x")"
  echo && [[ -n $TMUX ]] && echo "TMUX INFO:" && tmux info
  echo && echo "TERM=${TERM} $( tput -V )" && toe
  echo && echo "Bindings \033[3m( see ~/.inputrc )\033[23m :" && shortcuts
  echo && echo "stty: $(stty -g)" && stty -a
  echo && infocmp -l # terminfo description
  echo && infocmp -lCr # termcap description
  echo "\033[27m"
  echo && dircolors --print-ls-colors
  echo && colors
}

# }}}

# -----------------------------------------------------------------------
# {{{ Bindings
#   - https://geeksforgeeks.org/bind-command-in-linux-with-examples
# -----------------------------------------------------------------------
#   See to avoid potential conflicts:
#     - $HOME/.vimrc
#     - $HOME/.termux.conf
#     - $HOME/.termux/termux.properties

#
# http://superuser.com/questions/90196/case-insensitive-tab-completion-in-bash
alias shortcuts='bind -P'
# Case insensitive tab completion in Bash
# bind "set show-all-if-ambiguous on" # SEE ~/.inputrc
# bind "set completion-ignore-case on" # SEE ~/.inputrc

# }}}

echo 'devPunks😈studio .bash_profile'
echo
