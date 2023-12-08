# ******************************************************
# Author: Ahmid-Ra (github.com/snuggs)

# Gist: https://gist.github.com/snuggs/d4df3a974c482fe3473de361bb949b23
#
#   - GNU `coreutils`
#     - https://en.m.wikipedia.org/wiki/GNU_Core_Utilities
#     - https://en.m.wikipedia.org/wiki/List_of_GNU_Core_Utilities_commands
#   - https://stackoverflow.com/questions/9953005/should-the-bashrc-in-the-home-directory-load-automatically/9954208#9954208
# ******************************************************

echo 😈devPunks
echo

export EDITOR=vi

# Terminal ---------------------------------------------
# https://stackoverflow.com/questions/76148896/how-install-curses-1-06-module-in-termux
export CURSES_CFLAGS="-I/data/data/com.termux/files/usr/include"
export CURSES_LDFLAGS="-L/data/data/com.termux/files/usr/lib -lncurses"
# https://unix.stackexchange.com/questions/198794/where-does-the-term-environment-variable-default-get-set
# https://unix.stackexchange.com/questions/9957/how-to-check-if-bash-can-print-colors
export TERM=xterm-256color
# - tty  - https://www.linusakesson.net/programming/tty/
# - stty - https://www.computerhope.com/unix/ustty.htm
#stty -ixon columns 500 # enable control-s and control-q in VIM
stty -ixon columns 111 # enable control-s and control-q in VIM

# export PATH="/usr/local/sbin:$PATH"
# export PATH="~/Library/Python/2.7/bin:$PATH"
if [ -n "${PREFIX}" ]; then
  echo "FOUND $PREFIX ON TERMUX"
  unset PATH
  export PATH="$HOME:$PREFIX/bin"
fi

# History
# - https://www.gnu.org/software/bash/manual/html_node/Bash-History-Builtins.html
# https://superuser.com/questions/788428/how-to-port-my-current-bash-history-over-when-opening-a-tmux-session
#   - Reverse Search - https://codeburst.io/use-reverse-i-search-to-quickly-navigate-through-your-history-917f4d7ffd37
shopt -s histappend
export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTIGNORE="cd:ls:pwd"
export HISTTIMEFORMAT="%d/%m/%y %T - "
export HISTFILE="$HOME/.bash_history"
export HISTCONTROL=ignoredups:erasedups

export PROMPT_COMMAND="history -a; history -c; history -r;"

# more, less, most - https://askubuntu.com/questions/1191862/what-is-the-difference-between-more-and-less-commands
#   - https://linux.die.net/man/1/lesskey
#   - https://manpages.ubuntu.com/manpages/bionic/en/man1/most.1.html
#   - https://ascending.wordpress.com/2011/02/11/unix-tip-make-less-more-friendly/
export LESSHISTSIZE=0
export LESSHISTFILE=- # /dev/null
export LESSKEY="" # https://man7.org/linux/man-pages/man1/lesskey.1.html


# - https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x264.html
# export PS1="📂  \[\033[0;95m\]\w\[\033[00m\]\$(git_branch) 👉  "
#PS1="\[\e[0;32m\]\w\[\e[0m\] \[\e[0;97m\]\$\[\e[0m\]"

# https://superuser.com/questions/788428/how-to-port-my-current-bash-history-over-when-opening-a-tmux-session
export PROMPT_COMMAND="history -a;"


# FUNCTIONS -------------------------------------
#   - https://tldp.org/LDP/abs/html/functions.html
#   - https://cuddly-octo-palm-tree.com/posts/2021-10-31-better-bash-functions/
# ------------------------------------------------
# Slightly modified from: https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt
# # https://misc.flogisoft.com/bash/tip_colors_and_formatting
# Show current git branch in command line
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (🐙 \1)/'
}

echo Bash RC
