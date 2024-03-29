#!/usr/bin/env bash
#
# d8b          d8b 888                888
# Y8P          Y8P 888                888
#                  888                888
# 888 88888b.  888 888888    .d8888b  88888b.
# 888 888 "88b 888 888       88K      888 "88b
# 888 888  888 888 888       "Y8888b. 888  888
# 888 888  888 888 Y88b.  d8b     X88 888  888
# 888 888  888 888  "Y888 Y8P 88888P' 888  888
#
# -------------------------------------------------------------------------
# Version: 0.1
# File: init.sh
# Source: https://github.com/devpunks
# Author: Ahmid-Ra (github.com/snuggs)
# Maintainer: devPunks <https://github.com/devpunks>
# Description: Init install script
# -------------------------------------------------------------------------

#==========================================================================

pkg upgrade
pkg update

# {{{ Termux --------------------------------------------------------------

pkg install termux-services
pkg install termux-api
termux-open $HOME/.termux/Termux_Boot_0.7.apk
termux-setup-storage
termux-info

# }}}

# {{{ Shell ---------------------------------------------------------------

pkg install bc
pkg install jq
pkg install man
pkg install eza
pkg install git
pkg install vim
pkg install tmux
pkg install htop
pkg install most
pkg install lynx
pkg install wget
pkg install tree
pkg install which
pkg install ncurses
pkg install cmatrix
pkg install shellcheck

# }}}

# {{{ Mail ----------------------------------------------------------------

# MAIL CLIENTS - https://www.reddit.com/r/commandline/comments/p36vp0
#   - https://meli-email.org/
#   - https://github.com/neomutt/neomutt
#   - https://github.com/lukesmithxyz/mutt-wizard
#   - https://mailutils.org/manual/html_section/mail.html
#   - https://bence.ferdinandy.com/2023/07/20/email-in-the-terminal-a-complete-guide-to-the-unix-way-of-email/
#   - https://web.archive.org/web/20210126200507/https://chiraag.me/blog/2019/08/21/managing-multiple-email-accounts-with-mutt-and-fetchmail/

pkg install mutt
pkg install mailutils
pkg install fetchmail # https://www.fetchmail.info

# }}}

# {{{ Security ------------------------------------------------------------

pkg install whois
pkg install gnupg
pkg install strace
pkg install openssh
pkg install iproute2

# }}}

# {{{ Multimedia ----------------------------------------------------------

pkg install sox
pkg install vlc
pkg install ffmpeg
pkg install asciinema
pkg install youtubedr

# }}}

# {{{ Networking ----------------------------------------------------------

pkg install socat
pkg install dnsutils
pkg install netcat-openbsd

# }}}

# {{{ Programming ---------------------------------------------------------

pkg install golang
pkg install python
pip install pytest
pkg install python-numpy
pkg install ruby && gem update --system
pkg install nodejs-lts && npm install -g npm

# }}}

# {{{ Database ------------------------------------------------------------

pkg install sqlite
pkg install postgis
pkg install postgresql

# }}}

# {{{ Archive -------------------------------------------------------------

pkg install tar
pkg install zip
pkg install unzip
pkg install rsync
pkg install brotli
pkg install zopfli
pkg install logrotate

# }}}

# {{{ Versioning ----------------------------------------------------------

tmux -V
git --version
vim --version

pip list
pip --version
python --version

go version

gem help env
gem --version
ruby --version

npm --version
node --version

vlc --version
ffmpeg -version

# }}}

# {{{ Submodules ----------------------------------------------------------

echo Cloning Authorized Keys from...
# TODO: use readline to get username
# https://blog.prabir.me/posts/allow-github-username-to-ssh-authorized-keys/
mkdir -m 700 ~/.ssh
curl --location=https://github.com/snuggs.keys >> ~/.ssh/authorized_keys

echo Cloning home directory...
# git clone https://github.com/devpunks/-..git .
git status

# Submodules
#   - https://github.blog/2016-02-01-working-with-submodules/
#   - https://stackoverflow.com/questions/10666085/how-do-i-get-git-clone-recursive-to-recreate-submodules-remotes-and-branche
echo Cloning submodules...
git submodule
git submodule update --init

echo 'devPunks😈studio init.sh'
echo

# }}}

# vim: foldmethod=marker
