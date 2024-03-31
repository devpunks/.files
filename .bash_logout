#!/usr/bin/env bash
#
#     888                        888               888                                     888
#     888                        888               888                                     888
#     888                        888               888                                     888
#     88888b.   8888b.  .d8888b  88888b.           888  .d88b.   .d88b.   .d88b.  888  888 888888
#     888 "88b     "88b 88K      888 "88b          888 d88""88b d88P"88b d88""88b 888  888 888
#     888  888 .d888888 "Y8888b. 888  888          888 888  888 888  888 888  888 888  888 888
# d8b 888 d88P 888  888      X88 888  888          888 Y88..88P Y88b 888 Y88..88P Y88b 888 Y88b.
# Y8P 88888P"  "Y888888  88888P' 888  888 88888888 888  "Y88P"   "Y88888  "Y88P"   "Y88888  "Y888
#                                                                   888
#                                                              Y8b d88P
#                                                               "Y88P"
#
# -------------------------------------------------------------------------
# Version: 0.1
# File: .bash_logout
# Source: https://github.com/devpunks
# Author: Ahmid-Ra (github.com/snuggs)
# Maintainer: devPunks <https://github.com/devpunks>
# Description: Bourne Again $SHell logout.
# -------------------------------------------------------------------------
#
# INVOCATION
#   - https://unix.stackexchange.com/q/423958/what-is-the-purpose-of-bash-logout

# ALIAS WITH PARAMETER - https://stackoverflow.com/a/7131683
# Paste - https://geeksforgeeks.org/paste-command-in-linux-with-examples
# Hyperlinks - https://gist.github.com/egmontkob/eb114294efbcd5adb1944c9f3cb5feda

# =========================================================================
# {{{ FUNCTIONS
#   - https://tldp.org/LDP/abs/html/functions.html
#   - https://cuddly-octo-palm-tree.com/posts/2021-10-31-better-bash-functions/
# =========================================================================

# teardown
function teardown () {
  echo 'Tearing $BASH down...GOODBYE! 👋🏽😈'

  echo logout TMUX $TMUX

  [[ -n ${TMUX} ]] \
    && echo 'Logout Tearing $TMUX down...GOODBYE! 👋🏽😈' \
    && tmux display-message 'Logout Tearing $TMUX down...GOODBYE! 👋🏽😈'

  echo logout SHLVL $SHLVL

  [[ "SHLVL" = 1 ]]
  echo 'Logout Tearing $SHELL down...GOODBYE! 👋🏽😈'

  sleep 2
}
trap teardown EXIT

# }}}


echo 'devPunks😈studio .bash_logout'
echo

# vim: foldmethod=marker
