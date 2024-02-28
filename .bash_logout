#!/usr/bin/env bash
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
#   - https://unix.stackexchange.com/questions/423958/what-is-the-purpose-of-bash-logout

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

# vim: foldmethod=marker
