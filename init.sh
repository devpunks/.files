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

pkg upgrade && pkg update

pkg install mount-utils
pkg install bash-completion

# {{{ Dependencies --------------------------------------------------------
pkg install make
pkg install cmake
pkg install libtool
pkg install autoconf
pkg install automake
pkg install readline

# }}}

# {{{ Termux --------------------------------------------------------------
# https://github.com/YurinDoctrine/termux-essentials/blob/main/termux-essentials.sh
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
pkg install bash-completion
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
pkg install ncurses-utils
pkg install busybox # http://busybox.net/downloads
pkg install no-more-secrets # https://github.com/bartobri/no-more-secrets

# }}}

# {{{ Jobs -------------------------------------------------------------
pkg install runit # http://smarden.org/runit
pkg install cronie

# }}}

# {{{ Archive -------------------------------------------------------------
pkg install tar
pkg install zip
pkg install gzip
pkg install liblzma
pkg install zlib libzlib
pkg install zstd # https://github.com/facebook/zstd
pkg install p7zip
pkg install unrar
pkg install unzip
pkg install rsync
pkg install brotli
pkg install zopfli
pkg install logrotate

# }}}

# {{{ Security ------------------------------------------------------------
pkg install tsu # https://pypi.org/project/tsu
pkg install proot # https://wiki.termux.com/wiki/PRoot

pkg install whois # mkpasswd
pkg install gnupg # https://gnupg.org
pkg install strace # https://man7.org/linux/man-pages/man1/strace.1.html
pkg install argon2 # https://en.m.wikipedia.org/wiki/Argon2
pkg install scrypt # https://tarsnap.com/scrypt.html
pkg install openssl # https://openssl.org
pkg install openssh # https://openssh.com/manual.html
pkg install sharutils # https://gnu.org/software/sharutils

echo Cloning Authorized Keys from...
# TODO: use readline to get username
# https://blog.prabir.me/posts/allow-github-username-to-ssh-authorized-keys
mkdir --verbose -m 700 ~/.ssh
curl --location=https://github.com/snuggs.keys >> ~/.ssh/authorized_keys

# }}}

# {{{ Networking ----------------------------------------------------------
# TODO: deprecate ifconfig and netstat
#  - https://redhat.com/sysadmin/ifconfig-vs-ip
#  - https://wiki.linuxfoundation.org/networking/iproute2
#  - https://github.com/termux/termux-packages/issues/12758
pkg install iproute2 # ip addr instad of ifconfig -a
pkg install net-tools # https://net-tools.sourceforge.io
pkg install traceroute # https://linux.die.net/man/8/traceroute
pkg install tracepath # https://linux.die.net/man/8/tracepath
# NMAP
#  - https://upguard.com/blog/how-to-use-nmap
#  - https://redhat.com/sysadmin/use-cases-nmap
#  - https://freecodecamp.org/news/what-is-nmap-and-how-to-use-it-a-tutorial-for-the-greatest-scanning-tool-of-all-time
pkg install nmap
pkg install socat
pkg install dnsutils # Installs BIND for nslookup dig
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

pkg install libyaml
pkg install libxml2
pkg install libxslt
pkg install libiconv

pkg install gcc # C Compiler
pkg install tcc # tiny C Compiler https://bellard.org/tcc
pkg install clang # https://clang.llvm.org

pkg install golang

pkg install nodejs-lts
npm install -g npm@latest

pkg install python
pip install pytest
pkg install python-pip
pkg install python-numpy

pkg install php # PHP
pkg install php-fpm # FastCGI Process Manager
pkg install php-pgsql # PostgreSQL Modules
pkg install php-redis # Redis Interface
pkg install php-apache # Apache 2.0 Handler Module
pkg install php-apache-pgsql # PostgreSQL modules for PHP/Apache 2.0

# https://stackoverflow.com/q/57538555
# https://gist.github.com/lnfel/d84ead4b914fd3e4e7897537d8f61535
# https://linkedin.com/pulse/installing-running-ruby-rails-7-android-antonio-nesic
pkg install ruby # https://wiki.termux.com/wiki/Ruby
pkg install libffi
pkg install binutils
pkg install gumbo-parser
# https://github.com/termux/termux-packages/issues/1940
pkg install libxml2 && gem install libxml-ruby
# https://en.m.wikipedia.org/wiki/Pkg-config
pkg install pkg-config && gem install pkg-config
# RVM on termux - https://github.com/rvm/rvm/issues/4734
pkg install build-essential # Ruby HEAVY!!!! (600+Mb)
gem update --system && PATH=$PATH gem environment # Must set PATH to prevent Nil split error
# https://github.com/termux/termux-packages/discussions/8583
bundle config set force_ruby_platform true
# https://github.com/sparklemotion/nokogiri/issues/1739
# https://github.com/sparklemotion/nokogiri/issues/1884
# https://nokogiri.org/tutorials/installing_nokogiri.html#termux
# Installing Rails (Nokogiri) https://github.com/termux/termux-packages/discussions/8855
# https://nokogiri.org/tutorials/installing_nokogiri.html#why-would-i-not-want-to-use-a-native-gem
# $$$$ Set PATH fixes most ENV['PATH'] errors
PATH=$PATH gem install nokogiri --platform=ruby -- --use-system-libraries
PATH=$PATH gem install sqlite3 && gem info sqlite3
PATH=$PATH [ -e Gemfile ] && bundle
PATH=$PATH gem install rubygems-server && gem server & open http://localhost:8808

pkg install cscope # https://cscope.sourceforge.net
PATH=$PATH gem install starscope # https://github.com/eapache/starscope

# tags https://github.com/universal-ctags/ctags
[[  $( uname-s ) =~ Darwin ]] \
  && pkg install universal-ctags
[[  $( uname-s ) =~ Linux ]] \
  && pkg install ctags
# }}}

# {{{ Database ------------------------------------------------------------
pkg install redis
pkg install sqlite
pkg install postgis
pkg install postgresql
pkg install unixodbc
[[  $( uname-s ) =~ 'Darwin' ]] \
  && brew install libpq
# TODO: Install pgvector - https://github.com/pgvector

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

# {{{ Multimedia ----------------------------------------------------------
pkg install sox
pkg install vlc
pkg install ffmpeg
pkg install graphviz
pkg install asciinema
pkg install youtubedr
echo TODO: Install yt-dlp https://github.com/yt-dlp/yt-dlp

# }}}

# {{{ Submodules ----------------------------------------------------------
echo Git Settings...
# https://stackoverflow.com/q/49500943/what-is-git-rerere-and-how-does-it-work
git config --global rerere.enabled true
git config --global submodule.recurse true
git config --global status.submoduleSummary true # Add submodules to git summary

echo Cloning home directory...
# git clone --recurse-submodules https://github.com/devpunks/.files.git $HOME
git status

# Submodules
#  - https://stackoverflow.com/q/10666085
#  - https://github.blog/2016-02-01-working-with-submodules

echo Cloning submodules...
# https://github.com/skywind3000/asyncrun.vim

# https://github.com/mhinz/vim-startify

# https://github.com/obcat/vim-sclow
# https://github.com/lornix/vim-scrollbar

# https://github.com/preservim/nerdtree
# https://github.com/Xuyuanp/nerdtree-git-plugin

# https://github.com/lambdalisue/vim-fern
# https://github.com/lambdalisue/vim-fern-bookmark
# https://github.com/lambdalisue/vim-fern-git-status
#
# https://github.com/chr4/nginx
# https://github.com/chrisbra/csv.vim
# https://github.com/othree/html5.vim
# https://github.com/hail2u/vim-css3-syntax
# https://github.com/airblade/vim-gitgutter
# https://github.com/tpope/vim-rails
# https://github.com/sunaku/vim-ruby-minitest
# https://github.com/vim-test/vim-test
# https://github.com/tpope/vim-endwise
# https://github.com/alvan/vim-closetag
# https://github.com/tpope/vim-surround
# https://github.com/vim-scripts/ZoomWin
# https://github.com/tpope/vim-commentary
# https://github.com/kshenoy/vim-signature
# https://github.com/Asheq/close-buffers.vim
# https://github.com/preservim/vim-indent-guides
# https://github.com/ntpeters/vim-better-whitespace
# https://github.com/Raimondi/delimitMate # quotes, parenthesis, brackets

# Telesense (auto completion) -----------------
# https://github.com/yegappan/taglist
# https://github.com/preservim/tagbar # See ctags
# https://github.com/ludovicchabant/vim-gutentags # See ctags
# https://github.com/ctrlpvim/ctrlp.vim
# https://github.com/tacahiroy/ctrlp-funky
# https://github.com/ivalkeen/vim-ctrlp-tjump
# https://github.com/SirVer/ultisnips
# https://github.com/honza/vim-snippets
# https://github.com/alvan/vim-indexer
# https://github.com/lifepillar/vim-mucomplete
# https://github.com/yegappan/taglist
# https://github.com/preservim/tagbar # See ctags
# https://github.com/ludovicchabant/vim-gutentags # See ctags
# https://github.com/sunaku/vim-ruby-minitest
# https://github.com/prabirshrestha/async.vim
# https://github.com/prabirshrestha/asyncomplete.vim
# https://github.com/prabirshrestha/asyncomplete-file.vim
# https://github.com/prabirshrestha/asyncomplete-tags.vim
# https://github.com/prabirshrestha/asyncomplete-emoji.vim
# https://github.com/prabirshrestha/asyncomplete-buffer.vim
# https://github.com/prabirshrestha/asyncomplete-ultisnips.vim

# LSP (Language Server Protocols) ---------
# https://github.com/rhysd/vim-healthcheck
# https://github.com/prabirshrestha/vim-lsp
# https://github.com/mattn/vim-lsp-settings
# https://github.com/thomasfaingnaert/vim-lsp-snippets
# https://github.com/thomasfaingnaert/vim-lsp-ultisnips
# https://github.com/prabirshrestha/asyncomplete-lsp.vim
#
# https://github.com/dense-analysis/ale
# https://github.com/andreypopp/asyncomplete-ale.vim
# https://github.com/rhysd/vim-lsp-ale
# https://github.com/neoclide/coc.nvim

# Language Servers ------------------------
# https://github.com/bash-lsp/bash-language-server
npm install -g bash-language-server

git submodule
git submodule update --init --recursive

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


# Homebrew information
[[  $( uname-s ) =~ 'Darwin' ]]
  \ && brew config
  \ && brew services list

# Enable Side Mouse Buttons
[[  $( uname-s ) =~ 'Darwin' ]]
  \ && brew install --cask sanesidebuttons
  \ && open 'https://github.com/thealpa/SaneSideButtons#automatic-launch'

# List Installed Packages
[[  $( uname-s ) =~ 'Linux' ]]
  \ && pkg list --installed

# vim: foldmethod=marker
