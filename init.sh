pkg upgrade
pkg update
pkg install termux-api
termux-setup-storage

pkg install jq
pkg install exa
pkg install git
pkg install man
pkg install vim
pkg install most
pkg install whois
pkg install which
pkg install htop
pkg install tree
pkg install openssh
pkg install git
pkg install tmux
pkg install wget
pkg install golang
pkg install youtubedr
pkg install ffmpeg
pkg install vlc
vlc --version
pkg install ruby
pkg install nodejs-lts
npm install -g npm
pkg install htop
pkg install jq
pkg install python
pip install pytest
pkg install python-numpy
pip list
pkg install asciinema
pkg install sqlite
pkg install postgresql
pkg install postgis
pkg install vim
pkg install zopfli
pkg install brotli
gem update --system
gem help env
ruby --version
gem --version
node --version
npm --version
python --version
pip --version
go version
git --version
vim --version
ffmpeg -version
tmux -V
pkg install exa

echo
source ~/.bashrc
echo

echo Cloning home directory...
# git clone https://github.com/devpunks/-..git .
git status
# Submodules - https://github.blog/2016-02-01-working-with-submodules/
echo Cloning submodules...
git submodule
git submodule update --init
