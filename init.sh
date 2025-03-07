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
#
# `http://freedesktop.org
#
#==========================================================================

pkg upgrade
pkg update

pkg install mount-utils

# {{{ Termux --------------------------------------------------------------
termux-open "${HOME}/.termux/Termux_Boot_0.7.apk"
pkg install termux-services
pkg install termux-auth
pkg install termux-api
termux-setup-storage
termux-info

# }}}

# {{{ Shell ---------------------------------------------------------------
pkg install bc
pkg install pv # progress
pkg install man
pkg install eza
pkg install git
pkg install tmux
pkg install entr # http://eradman.com/entrproject
pkg install wget
pkg install most
pkg install lynx
pkg install tree
pkg install ncdu
pkg install htop
pkg install which
pkg install chrony
pkg install multitail
pkg install shellcheck
pkg install uuid-utils # uuidgen
# pkg install expect

pkg install figlet
pkg install barcode
pkg install cmatrix
pkg install ncurses
pkg install busybox # http://busybox.net/downloads
pkg install no-more-secrets # https://github.com/bartobri/no-more-secrets

# }}}

# {{{ Communications ------------------------------------------------------
pkg install weechat

# MAIL CLIENTS - https://reddit.com/r/commandline/comments/p36vp0
#  - https://meli-email.org
#  - https://github.com/neomutt/neomutt
#  - https://github.com/lukesmithxyz/mutt-wizard
#  - https://mailutils.org/manual/html_section/mail.html
#  - https://bence.ferdinandy.com/2023/07/20/email-in-the-terminal-a-complete-guide-to-the-unix-way-of-email
#  - https://chiraag.me/blog/2019/08/21/managing-multiple-email-accounts-with-mutt-and-fetchmail

pkg install mutt
pkg install mailutils
pkg install fetchmail # https://fetchmail.info
# https://tug.org/levels.html
# https://en.m.wikipedia.org/wiki/Texinfo
# https://gnu.org/software/texinfo/manual/texinfo/texinfo.html
# https://tex.stackexchange.com/q/49/what-is-the-difference-between-tex-and-latex
pkg install texinfo

# }}}

# {{{ Jobs -------------------------------------------------------------
pkg install runit # http://smarden.org/runit
pkg install cronie

# }}}

# {{{ Security ------------------------------------------------------------
pkg install tsu # https://pypi.org/project/tsu

pkg install whois
pkg install gnupg
pkg install strace
pkg install openssh

echo Cloning Authorized Keys from...
# TODO: use readline to get username
# https://blog.prabir.me/posts/allow-github-username-to-ssh-authorized-keys
mkdir --verbose -m 700 ~/.ssh
curl --location=https://github.com/snuggs.keys >> ~/.ssh/authorized_keys

# }}}

# {{{ Multimedia ----------------------------------------------------------
pkg install sox
pkg install vlc
pkg install ffmpeg
pkg install graphviz
pkg install asciinema
pkg install youtubedr
echo TODO: Install yt-dlp https://github.com/yt-dlp/yt-dlp

# }}}

# {{{ Networking ----------------------------------------------------------
# TODO: deprecate ifconfig and netstat
# - https://redhat.com/sysadmin/ifconfig-vs-ip
# - https://wiki.linuxfoundation.org/networking/iproute2
# - https://github.com/termux/termux-packages/issues/12758
pkg install iproute2 # ip addr instad of ifconfig -a
pkg install net-tools # https://net-tools.sourceforge.io
pkg install traceroute # https://traceroute.sourceforge.net
pkg install tracepath # https://linux.die.net/man/8/tracepath
# NMAP
#   - https://upguard.com/blog/how-to-use-nmap
#   - https://redhat.com/sysadmin/use-cases-nmap
#   - https://freecodecamp.org/news/what-is-nmap-and-how-to-use-it-a-tutorial-for-the-greatest-scanning-tool-of-all-time
# pkg install nmap
pkg install socat
pkg install dnsutils # nslookup
pkg install netcat-openbsd

pkg install nginx
pkg install apache2 # https://httpd.apache.org/docs
pkg install lighttpd # https://lighttpd.net
pkg install tinyproxy # https://tinyproxy.github.io

# }}}

# {{{ Programming ---------------------------------------------------------
pkg install jq
pkg install vim
pkg install tidy

pkg install cmake
pkg install tcc # tiny C Compiler https://bellard.org/tcc
# pkg install clang # https://clang.llvm.org

pkg install golang

pip install pytest
pkg install python
pkg install python-pip
pkg install python-numpy

pkg install ruby && gem update --system

pkg install nodejs-lts && npm install -g npm

pkg install php # PHP
pkg install php-fpm # FastCGI Process Manager
pkg install php-pgsql # PostgreSQL Modules
pkg install php-redis # Redis Interface
pkg install php-apache # Apache 2.0 Handler Module
pkg install php-apache-pgsql # PostgreSQL modules for PHP/Apache 2.0

# }}}

# {{{ Database ------------------------------------------------------------
pkg install sqlite
pkg install postgis
pkg install postgresql
# TODO: Install pgvector - https://github.com/pgvector

# }}}

# {{{ Archive -------------------------------------------------------------
pkg install tar
pkg install zip
pkg install gzip
pkg install p7zip
pkg install unrar
pkg install unzip
pkg install rsync
pkg install brotli
pkg install zopfli
pkg install logrotate

# }}}

# {{{ Submodules ----------------------------------------------------------
echo Cloning home directory...
# git clone https://github.com/devpunks/.files.git $HOME
git status

# Submodules
#  - https://stackoverflow.com/q/10666085
#  - https://github.blog/2016-02-01-working-with-submodules
echo Cloning submodules...
git submodule
git submodule update --init

echo 'devPunks😈studio init.sh'
echo

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

# vim: foldmethod=marker
