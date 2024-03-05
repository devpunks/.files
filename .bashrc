#!/usr/bin/env bash
#
#      888                        888
#      888                        888
#      888                        888
#      88888b.   8888b.  .d8888b  88888b.  888d888 .d8888b
#      888 "88b     "88b 88K      888 "88b 888P"  d88P"
#      888  888 .d888888 "Y8888b. 888  888 888    888
#  d8b 888 d88P 888  888      X88 888  888 888    Y88b.
#  Y8P 88888P"  "Y888888  88888P' 888  888 888     "Y8888P
#
# -------------------------------------------------------------------------
# Version: 0.1
# File: .bashrc
# Source: https://github.com/devpunks
# Author: Ahmid-Ra (github.com/snuggs)
# Maintainer: devPunks <https://github.com/devpunks>
# Description: Bourne Again SHell Run Commands for interactive $SHELL
# -------------------------------------------------------------------------
#
# INVOCATION
#   - https://superuser.com/a/183980
#   - https://stackoverflow.com/questions/9953005
#   - https://unix.stackexchange.com/questions/43953
#   - Sample .bashrc - https://tldp.org/LDP/abs/html/sample-bashrc.html
#   - https://gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html

#   - GNU `coreutils`
#     - https://en.m.wikipedia.org/wiki/GNU_Core_Utilities
#     - https://en.m.wikipedia.org/wiki/List_of_GNU_Core_Utilities_commands
#
#   - Common environment variables
#     - https://gnu.org/software/bash/manual/html_node/Bash-Variables.html
#     - https://gnu.org/software/grep/manual/html_node/Environment-Variables.html
#     - https://cyberciti.biz/faq/linux-list-all-environment-variables-env-command/
#
#   - OSC 52 base64 remote clipboard
#     - https://chromium.googlesource.com/apps/libapps/+/master/hterm/etc/osc52.sh
#
# =========================================================================
# {{{ Imports
# =========================================================================
# https://stackoverflow.com/questions/42757236/what-does-mean-in-bash
echo THE FLAGS $-
# [[ $- != *i* ]] 

# https://tldp.org/HOWTO/Bash-Prompt-HOWTO/setps.html
# [[ -z "$PS1" ]] && exit

# .colors
[ -e $HOME/.colors ] && source $HOME/.colors

# for rc in ~in `find ~/*.{ba}sh{rc} -maxdepth 1 -type f`; do
#   # (r)un (c)omm(ands) - https://superuser.com/questions/144339
#   echo Sourcing ~/.bash run commands \(where available\)
#   source $rc
# done

# }}}

# =========================================================================
# {{{ Exports
# =========================================================================
export EDITOR=vi
export PAGER=most
export VISUAL=$EDITOR

# https://gnu.org/software/libc/manual/html_node/TZ-Variable.html
export TZ='Etc/UTC'
export CRON_TZ=${TZ} # https://devicetests.com/set-timezone-crontab

# https://unix.stackexchange.com/questions/27588
# https://unix.stackexchange.com/questions/640495
export IGNOREEOF=10 # set -o ignoreeof

# https://gnu.org/software/bash/manual/html_node/Bash-Variables.html#index-HOSTFILE
export HOSTFILE="$HOME/.hosts"

# https://gnu.org/software/bash/manual/html_node/Bash-Variables.html#index-INPUTRC
export INPUTRC="$HOME/.inputrc"

unset PATH
PATH="${HOME}"
[ -d "$HOME/bin" ] && PATH="${PATH}:${HOME}/bin"
[ -d "$HOME/local/bin" ] && PATH="${PATH}:${HOME}/local/bin"

if [ -n "${PREFIX}" ]; then # TERMUX
  unset LD_LIBRARY_PATH
  echo "FOUND $PREFIX ON TERMUX"
  # https://askubuntu.com/questions/386629
 PATH=".:${PATH}:${PREFIX}/bin"
  # https://wiki.termux.com/wiki/Differences_from_Linux
  # uptime/htop
  #   - https://github.com/termux/termux-app/issues/819
  #   - https://site24x7.com/learn/linux/uptime.html
  # Prior to Android 7
  # export LD_LIBRARY_PATH="/system/bin/uptime:$PREFIX/bin/uptime"
fi
export CDPATH=".:$HOME" # https://theunixschool.com/2012/04/what-is-cdpath.html

export GLOBIGNORE=. # see shopt -s dotglob - https://gnu.org/software/bash/manual/html_node/Filename-Expansion.html

# TIME_STYLE [FORMAT,locale,iso,long-iso,full-iso]
# SIZE -
#   The SIZE argument is an integer and optional unit (example: 10K is 10*1024).
#   Units are K,M,G,T,P,E,Z,Y,R,Q (powers of 1024) or KB,MB, (powers of 1000).
#   Binary prefixes can be used, too: KiB=K, MiB=M, and so on.
# https://linuxquestions.org/questions/slackware-14/the-ls_options-variable-4175464331/
# https://linuxquestions.org/questions/slackware-14/anyone-familiar-with-splitvt-4175464327/#post4963357
export LS_OPTIONS='\
  --inode --size --escape --context --author --almost-all \
  --no-group --group-directories-first --hide-control-chars \
  --color=auto --hyperlink=auto --tabsize=0 --width=2 --format=vertical \
  --block-size=MiB --time-style=long-iso --indicator-style=classify --classify=auto --human-readable'

export GREP_OPTIONS='--context=1
  --directories=skip --devices=skip --binary-files=without-match
  --ignore-case --no-messages --line-number --with-filename --color=auto
  --group-separator=☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰☰
  --exclude-dir="{ .cache, .config, .git, .gnupg, .npm, .ssh, .vim, log, node_modules, storage }
'

# GIT ----------------------------------------------------------------------
export GIT_EDITOR=vi
export GIT_PAGER=most
export GIT_CONFIG_NOSYSTEM=true

# TIME --------------------------------------------------------------------
# https://baeldung.com/linux/bash-calculate-time-elapsed
# https://cyberciti.biz/faq/unix-linux-time-command-examples-usage-syntax/
export TIMEFORMAT=$'\n⌛real %3R seconds\tuser %3U\tsys %3S\tpcpu %P\n'

# }}}

# =========================================================================
# {{{ Locale
#  - https://superuser.com/a/1779369
#  - https://github.com/termux/termux-packages/issues/3009
#  - https://github.com/termux/termux-packages/issues/2796#issuecomment-424589888
#  - https://gnu.org/software/gettext/manual/html_node/The-LANGUAGE-variable.html
#  - https://gnu.org/software/gettext/manual/html_node/Setting-the-POSIX-Locale.html
# =========================================================================
export LANG=en_US.UTF-8 # Locale override
export LANGUAGE=en:fr:de  # LC_MESSAGES Override
export LC_ALL=$LANG
  # LC_TIME
  # LC_CTYPE
  # LC_COLLATE
  # LC_NUMERIC
  # LC_MONETARY
  # LC_MESSAGES # Overridden by `LANGUAGE`

# }}}

# =========================================================================
# {{{ Terminal
#  tty - https://linusakesson.net/programming/tty
#  stty - https://computerhope.com/unix/ustty.htm
#  setterm
#    - setterm --reverse on # reverse terminal coloring
#    - https://man7.org/linux/man-pages/man1/setterm.1.html
#  tput
#    - https://manpages.ubuntu.com/manpages/jammy/man1/tput.1.html
#    - tput - https://linuxcommand.org/lc3_adv_tput.php
#  ncurses
#    - https://en.m.wikipedia.org/wiki/Ncurses
#    - https://en.m.wikipedia.org/wiki/Curses_(programming_library)
# =========================================================================

tput init
setterm --resize # Sync kernel terminal driver to display

# PLEASE NOTE:
# Inside tmux TERM must be "screen", "tmux" "tmux-256color"
# Outside, it should match your terminal
# https://github.com/tmux/tmux/wiki/FAQ#what-is-term-and-what-does-it-do
export TERM='xterm-256color'

# Software Flow Control
#  - https://unix.stackexchange.com/questions/515252
#  - https://unix.stackexchange.com/questions/12107
#  - https://en.m.wikipedia.org/wiki/Software_flow_control
#  - https://bugs.launchpad.net/ubuntu/+source/bash/+bug/80635
#  - https://sites.ualberta.ca/dept/chemeng/AIX-43/share/man/info/C/a_doc_lib/cmds/aixcmds5/stty.htm
# prevent C-s. (C-q to resume) - https://catonmat.net/annoying-keypress-in-linux
stty stop undef # Undefine STOP character
stty start undef # Undefine START character
stty -ixon # Disable XON/XOFF output control
stty -ixoff # Disable sending START/STOP characters
stty -ixany # Disable any key to resume (not just START)
stty -ctlecho # Stop  echo - https://stackoverflow.com/questions/418073

# TERMUX nCurses- https://stackoverflow.com/questions/76148896
if [[ "$( tic -V )" == *"ncurses"* ]]; then
  export CURSES_CFLAGS="-I${PREFIX}/include"
  export CURSES_LDFLAGS="-L${PREFIX}/lib -lncurses"
  # https://stackoverflow.com/questions/1780483
  export LINES=$( tput lines )
  export COLUMNS=$( tput columns )

  # write tty terminal size
  echo && echo "💻 TTY SIZE: $( stty size | tr ' ' 'x' )" && echo

  # Check the window size after each command.
  # If necessary, Update the values of LINES and COLUMNS.
  # Correct line-wrapping-over-prompt issues when a window is resized.
  shopt -s checkwinsize # https://reddit.com/r/bash/comments/88tt7i
fi

# }}}

# =========================================================================
# {{{ Options
# =========================================================================
# https://gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
set -o notify # terminated background jobs to be reported immediately
set -o noclobber # Prevent redirection '>' from overwriting existing files

# shell options -------------------------------------------------------
# https://gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
# https://unix.stackexchange.com/questions/32409/set-and-shopt-why-two/32446
# https://linuxhint.com/how-to-customize-a-bash-shell-with-the-shopt-command/
shopt -s dotglob # https://unix.stackexchange.com/questions/40662
# https://unix.stackexchange.com/questions/700199
shopt -s globstar # https://linuxjournal.com/content/globstar-new-bash-globbing-option
# shopt –s xpg_echo # https://stackoverflow.com/questions/13517818/bash-shopt-xpg-echo
shopt -s cdspell # https://linux.101hacks.com/cd-command/shopt-s-cdspell/
shopt -s extglob # Extended glob pattern matching
shopt -s mailwarn # last access on login
shopt -s dirspell # https://linux.101hacks.com/cd-command/shopt-s-cdspell/
shopt -s checkjobs # on exit
shopt -s direxpand # https://stackoverflow.com/questions/6438341/what-does-shopt-s-dirspell-do
shopt -s checkhash # command exists in hashtable first
shopt -s nocaseglob # https://stackoverflow.com/questions/25331100/bash-match-string-with-regex
shopt -s nocasematch # https://baeldung.com/linux/shell-case-insensitive-matching
shopt -s cdable_vars # Change directory with shell vars
shopt -s hostcomplete # https://blog.sanctum.geek.nz/bash-hostname-completion
shopt -s no_empty_cmd_completion # on empty line attempts

# }}}

# =========================================================================
# {{{ History
#   - https://superuser.com/questions/788428
#   - https://gnu.org/software/bash/manual/html_node/Bash-History-Builtins.html
#   - Reverse Search
#     - https://gnu.org/software/emacs/manual/html_node/emacs/Basic-Isearch.html
#     - https://gnu.org/software/bash/manual/html_node/Commands-For-History.html
#     - https://superuser.com/questions/472846/how-to-reverse-i-search-back-and-forth
#     - https://codeburst.io/use-reverse-i-search-to-quickly-navigate-through-your-history-917f4d7ffd37
# =========================================================================
shopt -s histappend
shopt -s histverify
export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTFILE="$HOME/.bash_history"
export HISTTIMEFORMAT="%d/%m/%y %T - "
export HISTIGNORE=bg:fg:exit:cd:ls:pwd:echo
# https://google.com/amp/s/geeksforgeeks.org/histcontrol-command-in-linux-with-examples/amp/
# https://unix.stackexchange.com/questions/18212/bash-history-ignoredups-and-erasedups-setting-conflict-with-common-history
export HISTCONTROL=ignoredups:ignorespace:erasedups # ignoreboth

export PROMPT_COMMAND="history -n; history -w; history -c; history -r;"

# more, less, most - https://askubuntu.com/questions/1191862
#   - https://linux.die.net/man/1/lesskey
#   - https://manpages.ubuntu.com/manpages/bionic/en/man1/most.1.html
#   - https://ascending.wordpress.com/2011/02/11/unix-tip-make-less-more-friendly/
export LESSHISTSIZE=0
export LESSHISTFILE=- # /dev/null
export LESSKEY="" # https://man7.org/linux/man-pages/man1/lesskey.1.html

# }}}

# =========================================================================
# {{{ Cursor / Prompt
# =========================================================================
# cursor ------------------------------------------------------------------
# echo -ne '[5;0;0 q' see .inputrc
# echo -ne ']12;#FF0000\x7'

# prompt ------------------------------------------------------------------
# Shell Prompt - for many examples, see:
#  - https://bash-prompt-generator.org
#  - https://github.com/nojhan/liquidprompt
#  - https://askubuntu.com/questions/409599
#  - http://tldp.org/HOWTO/Bash-Prompt-HOWTO
#  - http://debian-administration.org/articles/205
#  - http://askapache.com/linux/bash-power-prompt.html
#  - https:/gnu.org/software/bash/manual/html_node/Controlling-the-Prompt.html
#  - https://unix.stackexchange.com/questions/105958/terminal-prompt-not-wrapping-correctly
#  - https://cyberciti.biz/faq/bash-shell-change-the-color-of-my-shell-prompt-under-linux-or-unix/
#  - https://unix.stackexchange.com/questions/611419/how-does-the-escape-character-work-in-bash-prompt
# -------------------------------------------------------------------------
tput smam # tput rmam to disable - http://heyrod.com/snippets/toggle-line-wrapping-in-terminal.html
export PROMPT_DIRTRIM=3 # https://stackoverflow.com/questions/5687446

PS_RESET="\[${DEFAULT}${NORMAL}${NORMAL_BG}\e[m\]"
PS_CHEVRON="\[${BOLD}\]❭〉$PS_RESET"
PS_USER="\[$( tput setaf 6 )\]\u$PS_RESET"
PS_HOST="\[${DIM}${ITALIC}$( tput setaf 2 )\]\H$PS_RESET"
PS_JOBS="\[${REVERSE}${BOLD}\] 🔧\j $PS_RESET"
PS_TIME="\[${ITALIC}${UNDERLINE}\]⏳XX secs.$PS_RESET "
PS_CLOCK="\[${REVERSE}${ITALIC}\]⌚\D{%H:%M:%S} $PS_RESET"
PS_PATH="\[${BOLD}${REVERSE}\]📂\[${ITALIC}\]\w/$PS_RESET"
PS_EXIT='$( exitstatus )'
PS_GIT="$( __git_ps1 '\[${REVERSE}${BOLD}\]【🌵%s】${PS_RESET}' )"
PS_PROMPT='$( prompts )'

PS0="\[$( tput sitm )\]Running command:$PS_RESET ⌛`command date '+%T'`\n"
PS1="${PS_EXIT}${PS_CHEVRON}${PS_TIME}${PS_JOBS}${PS_CLOCK}${PS_PATH}${PS_GIT}${PS_PROMPT}"
PS2='⋯ ➡' # Nested shell levels
PS3='Select：' # Select prompts
PS4='➕ ' # Verbose prompt tracing

# }}}

# =========================================================================
# {{{ FUNCTIONS
#   - https://tldp.org/LDP/abs/html/functions.html
#   - https://cuddly-octo-palm-tree.com/posts/2021-10-31-better-bash-functions/
# =========================================================================

function prompts () {
  for i in `seq 1 ${SHLVL}`; do
    printf '💲'
  done
} # prompts

function exitstatus () {
  local status=$?
  [[ ${status} == 0 ]] && \
    echo " ✅ ${status} "
  [[ ${status} != 0 ]] && \
    echo " ❌ ${status} "
} # exitstatus
# }}}

echo 'devPunks😈studio .bashrc'
echo

# vim: foldmethod=marker
