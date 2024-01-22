pkg upgrade
pkg update
pkg install termux-services
pkg install termux-api
termux-open $HOME/.termux/Termux_Boot_0.7.apk
termux-setup-storage
termux-info

# MAIL CLIENTS - https://www.reddit.com/r/commandline/comments/p36vp0
#   - https://meli-email.org/
#   - https://github.com/neomutt/neomutt
#   - https://github.com/lukesmithxyz/mutt-wizard
#   - https://bence.ferdinandy.com/2023/07/20/email-in-the-terminal-a-complete-guide-to-the-unix-way-of-email/
#   - https://web.archive.org/web/20210126200507/https://chiraag.me/blog/2019/08/21/managing-multiple-email-accounts-with-mutt-and-fetchmail/
pkg install mutt
pkg install fetchmail # https://www.fetchmail.info

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
