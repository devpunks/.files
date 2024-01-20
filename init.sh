pkg upgrade
pkg update
pkg install termux-services
pkg install termux-api
termux-open $HOME/.termux/Termux_Boot_0.7.apk
termux-setup-storage
termux-info

pkg install bc
pkg install jq
pkg install exa
pkg install git
pkg install tar
pkg install man
pkg install vim
pkg install zip
pkg install unzip
pkg install lynx
pkg install most
pkg install htop
pkg install tmux
pkg install tree
pkg install wget
pkg install whois
pkg install which
pkg install gnupg
pkg install golang
pkg install ffmpeg
pkg install strace
pkg install ncurses
pkg install cmatrix
pkg install openssh
pkg install iproute2
pkg install logrotate
pkg install youtubedr
pkg install vlc && vlc --version
pkg install ruby && gem update --system
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
