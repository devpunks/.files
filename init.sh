pkg upgrade
pkg update
pkg install termux-api
termux-setup-storage
termux-info

pkg install jq
pkg install exa
pkg install git
pkg install tar
pkg install zip
pkg install unzip
pkg install man
pkg install vim
pkg install most
pkg install htop
pkg install tmux
pkg install tree
pkg install wget
pkg install whois
pkg install which
pkg install openssh
pkg install ncurses
pkg install vlc && vlc --version
pkg install youtubedr
pkg install ffmpeg
pkg install ruby && gem update --system
pkg install golang
pkg install nodejs-lts && npm install -g npm
pkg install python
pip install pytest
pkg install python-numpy
pkg install sqlite
pkg install postgresql
pkg install postgis
pkg install zopfli
pkg install brotli
pkg install asciinema

pip list
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

echo
source ~/.bashrc
echo

echo Cloning home directory...
# git clone https://github.com/devpunks/-..git .
git status
# Submodules
#   - https://github.blog/2016-02-01-working-with-submodules/
#   - https://stackoverflow.com/questions/10666085/how-do-i-get-git-clone-recursive-to-recreate-submodules-remotes-and-branche
echo Cloning submodules...
git submodule
git submodule update --init
