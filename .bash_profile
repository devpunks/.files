#!/usr/bin/env bash
#
#      888                        888                                         .d888 d8b 888
#      888                        888                                        d88P"  Y8P 888
#      888                        888                                        888        888
#      88888b.   8888b.  .d8888b  88888b.           88888b.  888d888 .d88b.  888888 888 888  .d88b.
#      888 "88b     "88b 88K      888 "88b          888 "88b 888P"  d88""88b 888    888 888 d8P  Y8b
#      888  888 .d888888 "Y8888b. 888  888          888  888 888    888  888 888    888 888 88888888
#  d8b 888 d88P 888  888      X88 888  888          888 d88P 888    Y88..88P 888    888 888 Y8b.
#  Y8P 88888P"  "Y888888  88888P' 888  888 88888888 88888P"  888     "Y88P"  888    888 888  "Y8888
#                                                  888
#                                                  888
#                                                  888
#
# -------------------------------------------------------------------------
# Version: 0.1
# File: .bash_profile
# Source: https://github.com/devpunks
# Author: Ahmid-Ra (github.com/snuggs)
# Maintainer: devPunks <https://github.com/devpunks>
# Description: Bourne Again SHell profile on $SHELL login.
# -------------------------------------------------------------------------
#
# INVOCATION
#   - https://unix.stackexchange.com/questions/43953
#   - https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html

# [ -r $HOME/.bashrc ] && source $HOME/.bashrc

# ALIAS WITH PARAMETER - https://stackoverflow.com/a/7131683
# Paste - https://geeksforgeeks.org/paste-command-in-linux-with-examples
# Hyperlinks - https://gist.github.com/egmontkob/eb114294efbcd5adb1944c9f3cb5feda

# =========================================================================
# {{{ shell
# =========================================================================
alias matrix='command cmatrix -bas -C magenta' # ScreenSaver

alias cl=clear
alias ..='command cd ..'
alias mv='command mv -i'
alias cp='command cp -i'
alias ln='command ln -i'
alias fc='command fc -e vi' # https://geeksforgeeks.org/fc-command-linux-examples

alias ps='command ps auxf' # https://tecmint.com/ps-command-examples-for-linux-process-monitoring/
alias jobs='command jobs -l'

alias path='echo -e ${PATH//:/\\n}'
alias mount='command mount | column -t'
alias libpath='echo ${LD_LIBRARY_PATH//:/\\n}'
alias echo='command echo -e' # for escape characters

alias pop='command popd'
alias push='command pushd'
alias dirs='command dirs -p'
alias which='command type -a'
alias mkdir='command mkdir -pv'
alias most='command most +u -s -t2'
alias diff='command diff --color=auto' # - https://geeksforgeeks.org/diff-command-linux-examples

# https://unix.stackexchange.com/questions/344213
# https://askubuntu.com/questions/103913/difference-between-dir-and-ls-terminal-commands
# https://unix.stackexchange.com/questions/50377/whats-the-difference-between-dir-and-ls
alias vdir='command vdir -alAF --author --human-readable --group-directories-first --color=auto --hyperlink=auto --hide="{.git,log,node_modules,storage}"'
alias find='command find -type f -iname'
alias ls='command ls -C -AFGhklp --color=auto --hyperlink=auto --group-directories-first'
alias branch='gb && echo && tree -d -L 4'
alias tree='command tree -ahACDF --du -L 2 --dirsfirst --gitignore -I ".git|log|node_modules|storage"'
alias list='weight \
  && command exa -ahlFT --git --grid --icons --level=2 \
      --group-directories-first -I ".git|log|node_modules|storage"
'

# https://en.m.wikipedia.org/wiki/Named_pipe
# https://stackoverflow.com/questions/4113986
alias pipe='command mkfifo'
# - https://stackoverflow.com/questions/1987926/how-do-i-recursively-grep-all-directories-and-subdirectories
alias grep='command grep $GREP_OPTIONS'
alias egrep='command grep -E $GREP_OPTS'
alias fgrep='LC_ALL=C command grep -F $GREP_OPTS'

alias delete='command rm -dIrv --preserve-root'
# https://tecmint.com/fswatch-monitors-files-and-directory-changes-modifications-in-linux/
alias watch='command watch -n 2 $1'
alias wait='command wait' # https://www.baeldung.com/linux/wait-command
# - https://en.m.wikipedia.org/wiki/Rm_(Unix)
alias rm='echo "rm is disabled, use delete, destroy, or command rm instead."'

alias rand='echo $RANDOM'
alias random='echo $SRANDOM'
alias ports='netstat -tulanp'
alias calendar='command cal -1 --iso --color=auto'
# https://www.gnu.org/software/coreutils/manual/html_node/Date-conversion-specifiers.html
alias date='command date +"%Y-%m-%d - %A" && echo && calendar'
# https://gnu.org/software/coreutils/manual/html_node/Time-conversion-specifiers.html
alias now='command date +"%T - %::z %Z (${TZ})"'

alias who='id && (
  id | tr "[\w|\,] " "\n" | tr "groups=" "\n\nGroups:"
)'
alias ping='command ping -c 100 -s.2'
alias chown='command chown --preserve-root'
alias chmod='command chmod --preserve-root'
alias chgrp='command chgrp --preserve-root'

alias header='command curl -I'
alias wget='command wget --continue --no-hsts' # resume downloads & prevent writing HSTs
alias ip='ip addr | grep -Po '\''(?<=inet)\s(?!127)[^/]+'\'

alias zipper='command paste' # https://geeksforgeeks.org/paste-command-in-linux-with-examples

# ----------------------
# Ruby
# ----------------------
alias be='bundle exec'

# }}}

# =========================================================================
# {{{ Server(s)
# ==========================================================================
# SSh ---------------------------------------------------------------------
# - https://superuser.com/questions/141044
# - https://www.ssh.com/academy/ssh
# - https://www.ssh.com/academy/ssh/add-command
# - http://blog.joncairns.com/2013/12/understanding-ssh-agent-and-ssh-add/
alias ssadd='(
  clear
  echo adding ssh
  eval $( ssh-agent )
  command ssh-add
  ps x | grep ssh-agent
)'

# SSh(d) ------------------------------------------------------------------
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
alias ss='command sshd -X -Dddd -p8022'
# https://www.ssh.com/academy/ssh/add-command
alias ssh.add='echo adding ssh'

# HTTP(s) ------------------------------------------------------------------
alias serve='command python -m http.server'

# - syslog() - https://stackify.com/syslog-101/
# - https://cyberciti.biz/tips/howto-linux-unix-write-to-syslog.html
# - systemd Journal Fields - https://real-world-systems.com/docs/systemd.1.html#journal-fields
alias logs.sshd="command logcat -s 'sshd:*'"
function logs () {
  command logcat
}

# TMUX --------------------------------------------------------------------
alias tmux.config='(
  tmux info
  echo && echo Server Options:
  tmux show-options -s
  echo && echo Global Options:
  tmux show-options -g
  echo && echo Global Window Options:
  tmux show-window-options -g
)'

# }}}

# =========================================================================
# {{{ Git Aliases
# https://git-scm.com/book/en/v2/Git-Basics-Viewing-the-Commit-History
alias ga='git add -p'
alias gb='git -P branch -a'
alias gc='git commit --message '
alias gd='git diff'
alias gg='git grep --break --heading'
alias gl='git log --reverse --since=1.week --decorate --all'
alias gll='git log -L'
alias gp='git push && git push --tags'
alias gr='git rebase -i'
alias gs='git status --column --verbose'
alias gt='git tag -a'
alias g#="(
  # https://git-scm.com/book/en/v2/Git-Basics-Viewing-the-Commit-History
  # https://stackoverflow.com/questions/2183900/how-do-i-prevent-git-diff-from-using-a-pager
  GIT_PAGER=cat \
    gl --since='1 day ago'
  echo && echo Total: \
    && gl --since='1 day ago' | wc -l
  echo
)"

# }}}

# =========================================================================
# {{{ Bindings # see ~/.inputrc
# =========================================================================
# bind -x '"TAB":complete'  # default
# bind -x '"TAB":menu-complete'
bind -x '"\C-l":clear'
# RETURN: "\e\n"

alias shortcuts='bind -vP'

# }}}

# =========================================================================
# {{{ FUNCTIONS
#   - https://tldp.org/LDP/abs/html/functions.html
#   - https://cuddly-octo-palm-tree.com/posts/2021-10-31-better-bash-functions/
# =========================================================================
open () {
  # apk
  [[ -f $1 ]] && [[ -x $1 ]] && termux-open $1

  # file
  [[ -f $1 ]] && termux-open $1

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

  command tar cvzf $file $contents # -u for update only
  command zip -rv $file $contents # -u for update only

  # Creates an archive (*.tar.gz) from given directory.
  # tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"

  # Create a ZIP archive of a file or folder.
  # zip -r "${1%%/}.zip" "$1"

  test -e "$file" \
   && command view $file \
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

  # destroy "${TMPDIR}/*.*"
  command rm -v $TMPDIR/*

  trash
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

  weight
}

function weight () {
  local location=`realpath ${1:-.}`
  # https://geeksforgeeks.org/df-command-in-linux-with-examples
  echo && echo # https://redhat.com/sysadmin/linux-df-command
  df -ah -- "$location"

  # https://geeksforgeeks.org/du-command-linux/
  echo && echo # https://redhat.com/sysadmin/du-command-options
  du --summarize --total --time \
    --human-readable $hide \
  -- "$location"

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
  echo $( compgen -a ) | sort | column --fillrows # alias -p

  echo && echo 👇Reserved Words:👇
  compgen -k | sort | column --fillrows
  echo && echo 👇Env Vars:👇
  # https://unix.stackexchange.com/questions/123473
  env | sort | column --fillrows # printenv | export -p
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
  source .bashrc && source .bash_profile
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
  echo && echo "TTY: $(tty)"
  echo "\nSize \033[3mROWS\033[23mX\033[3mCOLUMNS\033[23m: $(stty size | tr " " "x")"
  echo && [[ -n $TMUX ]] && echo "TMUX INFO:" && tmux info
  echo && echo "TERM=${TERM} $( tput -V )" && toe
  echo && echo "stty: $(stty -g)" && stty -a
  echo && infocmp -l # terminfo description
  echo && infocmp -lCr # termcap description
  echo "\033[27m"
  echo && echo "Bindings \033[3m( see ~/.inputrc )\033[23m & alias shortcuts"
  shortcuts
  [[ $( type -t colors ) == function ]] && echo && colors
}

# }}}

echo 'devPunks😈studio .bash_profile'
echo

# vim: foldmethod=marker
