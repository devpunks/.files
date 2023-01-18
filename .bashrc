# Author: Ahmid-Ra (github.com/snuggs)

# Gist: https://gist.github.com/snuggs/d4df3a974c482fe3473de361bb949b23

# ********************************************************************************

source ~/git-completion.bash

shopt -s histappend
# enable control-s and control-q in VIM
stty -ixon columns 500

export EDITOR=vi
export TERM=xterm-256color
export PS1="📂  \[\033[0;95m\]\w\[\033[00m\]\$(git_branch) 👉  "
# https://superuser.com/questions/788428/how-to-port-my-current-bash-history-over-when-opening-a-tmux-session
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# Slightly modified from: https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt
# # https://misc.flogisoft.com/bash/tip_colors_and_formatting
# Show current git branch in command line
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (🐙 \1)/'
}

export PS1="📂  \[\033[0;95m\]\w\[\033[00m\]\$(git_branch) 👉  "

# https://superuser.com/questions/788428/how-to-port-my-current-bash-history-over-when-opening-a-tmux-session
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
shopt -s histappend


export PATH="/usr/local/sbin:$PATH"
### Added by the Heroku Toolbelt CLI
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="~/Library/Python/2.7/bin:$PATH"

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s $NVM_DIR/bash_completion ] && source $NVM_DIR/bash_completion

echo "Bash RC"