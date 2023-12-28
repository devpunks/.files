# ******************************************************
echo 😈devPunks
echo

TZ='Etc/UTC'

# Author: Ahmid-Ra (github.com/snuggs)

# Gist: https://gist.github.com/snuggs/d4df3a974c482fe3473de361bb949b23
#
#   - GNU `coreutils`
#     - https://en.m.wikipedia.org/wiki/GNU_Core_Utilities
#     - https://en.m.wikipedia.org/wiki/List_of_GNU_Core_Utilities_commands
#   - https://stackoverflow.com/questions/9953005/should-the-bashrc-in-the-home-directory-load-automatically/9954208#9954208
#   - Common environment variables
#     - https://gnu.org/software/bash/manual/html_node/Bash-Variables.html
#     - https://gnu.org/software/grep/manual/html_node/Environment-Variables.html
#     - https://cyberciti.biz/faq/linux-list-all-environment-variables-env-command/
# ******************************************************

export EDITOR=vi

# Software Flow Control
#  - https://unix.stackexchange.com/questions/515252
#  - https://unix.stackexchange.com/questions/12107
#  - https://en.m.wikipedia.org/wiki/Software_flow_control
#  - https://bugs.launchpad.net/ubuntu/+source/bash/+bug/80635
#  - UART - https://en.wikipedia.org/wiki/Universal_asynchronous_receiver-transmitter
#  - https://sites.ualberta.ca/dept/chemeng/AIX-43/share/man/info/C/a_doc_lib/cmds/aixcmds5/stty.htm
# prevent C-s. (C-q to resume) - https://catonmat.net/annoying-keypress-in-linux
stty -ixon # Disable XON/XOFF output control
stty -ixoff # Disable sending START/STOP characters
stty stop undef # Undefine STOP character
stty start undef # Undefine START character
#stty ixany # Enable any key to resume (not just START)
#stty columns 500 # enable control-s and control-q in VIM
#stty columns 110 # enable control-s and control-q in VIM


# for rc in ~in `find ~/*.{ba}sh -maxdepth 1 -type f`; do
#   # (r)un (c)omm(ands)
#   #   - https://superuser.com/questions/144339/vimrc-screenrc-bashrc-kshrc-etc-what-does-the-rc-mean
#   echo Sourcing ~/.bash run commands \(where available\)
#   source $rc
# done

# export PATH="/usr/local/sbin:$PATH"
# export PATH="~/Library/Python/2.7/bin:$PATH"
if [ -n "${PREFIX}" ]; then
  echo "FOUND $PREFIX ON TERMUX"
  unset PATH
  export PATH="$HOME:$PREFIX/bin"
  # uptime/htop - https://github.com/termux/termux-app/issues/819
  # export LD_LIBRARY_PATH="/system/bin/uptime"
fi


# Locale ******************************************************
#  - https://superuser.com/a/1779369
#  - https://github.com/termux/termux-packages/issues/3009
#  - https://github.com/termux/termux-packages/issues/2796#issuecomment-424589888
#  - https://www.gnu.org/software/gettext/manual/html_node/The-LANGUAGE-variable.html
#  - https://www.gnu.org/software/gettext/manual/html_node/Setting-the-POSIX-Locale.html
export LANGUAGE=en:fr:de  # LC_MESSAGES Override
export LANG=en_US.UTF-8   # Locale override (from "C")
export LC_ALL=$LANG
  # LC_TIME
  # LC_CTYPE
  # LC_COLLATE
  # LC_NUMERIC
  # LC_MONETARY
  # LC_MESSAGES # Overridden by `LANGUAGE`


# Terminal ******************************************************
# ncurses
#   - https://stackoverflow.com/questions/76148896/how-install-curses-1-06-module-in-termux
#   - tput - https://linuxcommand.org/lc3_adv_tput.php
export CURSES_CFLAGS="-I/data/data/com.termux/files/usr/include"
export CURSES_LDFLAGS="-L/data/data/com.termux/files/usr/lib -lncurses"

# https://unix.stackexchange.com/questions/198794/where-does-the-term-environment-variable-default-get-set
# https://unix.stackexchange.com/questions/9957/how-to-check-if-bash-can-print-colors
export TERM=xterm-256color
export COLORTERM=truecolor
# tput init # https://manpages.ubuntu.com/manpages/jammy/man1/tput.1.html

# - stty - https://www.computerhope.com/unix/ustty.htm
# - https://www.mkssoftware.com/docs/man1/stty.1.asp
# - tty  - https://www.linusakesson.net/programming/tty/
shopt checkwinsize
echo "$(tput lines) $(tput columns)"
echo "$(stty size)"

#https://stackoverflow.com/questions/1780483/lines-and-columns-environmental-variables-lost-in-a-script
LINES=$(tput lines)
COLUMNS=$(tput columns)

set -o nolog
set -o notify

# https://man7.org/linux/man-pages/man1/setterm.1.html
# setterm --reverse on # reverse terminal coloring
setterm --resize

# https://unix.stackexchange.com/questions/32409/set-and-shopt-why-two/32446
# https://linuxhint.com/how-to-customize-a-bash-shell-with-the-shopt-command/
# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
# https://stackoverflow.com/questions/13517818/bash-shopt-xpg-echo
# shopt –s xpg_echo
shopt -s dotglob # https://unix.stackexchange.com/questions/40662/what-is-the-setting-in-bash-for-globbing-to-control-whether-matches-dot-files
shopt -s mailwarn # last access on login
shopt -s cdspell # https://linux.101hacks.com/cd-command/shopt-s-cdspell/
shopt -s dirspell # https://linux.101hacks.com/cd-command/shopt-s-cdspell/
shopt -s direxpand # https://stackoverflow.com/questions/6438341/what-does-shopt-s-dirspell-do
shopt -s checkjobs # on exit
shopt -s nocaseglob # https://stackoverflow.com/questions/25331100/bash-match-string-with-regex
shopt -s nocasematch # https://www.baeldung.com/linux/shell-case-insensitive-matching
shopt -s hostcomplete # https://blog.sanctum.geek.nz/bash-hostname-completion
# https://unix.stackexchange.com/questions/700199/why-is-the-bash-double-star-globstar-operator-often-disabled-by-default
shopt -s globstar # https://www.linuxjournal.com/content/globstar-new-bash-globbing-option


# History ******************************************************
# - https://www.gnu.org/software/bash/manual/html_node/Bash-History-Builtins.html
# https://superuser.com/questions/788428/how-to-port-my-current-bash-history-over-when-opening-a-tmux-session
# - Reverse Search
#   - https://www.gnu.org/software/emacs/manual/html_node/emacs/Basic-Isearch.html
#   - https://www.gnu.org/software/bash/manual/html_node/Commands-For-History.html
#   - https://superuser.com/questions/472846/how-to-reverse-i-search-back-and-forth
#   - https://codeburst.io/use-reverse-i-search-to-quickly-navigate-through-your-history-917f4d7ffd37
shopt -s histappend
shopt -s histverify
export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTFILE="$HOME/.bash_history"
export HISTTIMEFORMAT="%d/%m/%y %T - "
export HISTIGNORE=bg:fg:exit:cd:ls:pwd
# https://www.google.com/amp/s/www.geeksforgeeks.org/histcontrol-command-in-linux-with-examples/amp/
# https://unix.stackexchange.com/questions/18212/bash-history-ignoredups-and-erasedups-setting-conflict-with-common-history
export HISTCONTROL=ignoredups:ignorespace:erasedups # ignoreboth

export PROMPT_COMMAND="history -n; history -w; history -c; history -r;"

# more, less, most - https://askubuntu.com/questions/1191862/what-is-the-difference-between-more-and-less-commands
#   - https://linux.die.net/man/1/lesskey
#   - https://manpages.ubuntu.com/manpages/bionic/en/man1/most.1.html
#   - https://ascending.wordpress.com/2011/02/11/unix-tip-make-less-more-friendly/
export LESSHISTSIZE=0
export LESSHISTFILE=- # /dev/null
export LESSKEY="" # https://man7.org/linux/man-pages/man1/lesskey.1.html


# Prompt ******************************************************
#tput smam # tput rmam to disable - http://heyrod.com/snippets/toggle-line-wrapping-in-terminal.html

# - https://bash-prompt-generator.org
# - https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x264.html
# - https://unix.stackexchange.com/questions/105958/terminal-prompt-not-wrapping-correctly
# - https://www.cyberciti.biz/faq/bash-shell-change-the-color-of-my-shell-prompt-under-linux-or-unix/
# - https://unix.stackexchange.com/questions/611419/how-does-the-escape-character-work-in-bash-prompt
# export PS1="📂  \[\033[0;95m\]\w\[\033[00m\]\$(git_branch) 👉  "
#PS1="\[\e[0;32m\]\w\[\e[0m\] \[\e[0;97m\]\$\[\e[0m\]"
# export PS1="\[\u@\h:\w \]"
# export PS1="\[non-printing terminal escapes here\e[0;0m\]\n\[\033[0;47m💲\e[0;0m\]"
PS1_RESET='\001$(tput sgr0)\002'
# PS1_ERROR='$(code=${?##0};echo ${code:+\001$(tput setaf 1)\002[${code}]\ })'"$PS1_RESET"

# PS1_DATE='\001$(tput setaf 5)\002\D{%H:%M:%S} '"$PS1_RESET"
# PS1_USER='\001$(tput setaf 6)\002\u'"$PS1_RESET"
# PS1_AT='\001$(tput sgr0)\002@'"$PS1_RESET"
# PS1_HOST='\001$(tput setaf 2)\002\H'"$PS1_RESET"
# PS1_COLON='\001$(tput sgr0)\002:'"$PS1_RESET"
# PS1_PATH='\001$(tput setaf 3)\002\w'"$PS1_RESET"
# 

PS1_DATE='$(tput dim)$(tput setaf 5)\D{%H:%M:%S}'"$PS1_RESET"
PS1_USER='$(tput setaf 6)\u'"$PS1_RESET"
PS1_AT='$(tput sgr0)@'"$PS1_RESET"
PS1_HOST='$(tput dim)$(tput sitm)$(tput setaf 2)\H'"$PS1_RESET"
PS1_COLON='$(tput sgr0):'"$PS1_RESET"
PS1_PATH='$(tput setaf 3)\w'"$PS1_RESET"

# PS1_GIT='$(__git_ps1 " (%s)")'"$PS1_RESET"
PS1_PROMPT='$(tput setab 13)💲'"$PS1_RESET"

# export PS1="\001\n$PS1_DATE$PS1_USER$PS1_AT$PS1_HOST$PS1_COLON$PS1_PATH$PS1_PROMPT\002"


# COLORS ******************************************************
# https://linuxcommando.blogspot.com/2007/10/grep-with-color-output.html
GREP_COLOR='1;4;38;5;13;48;5;235'
export GREP_COLORS="ln=1;4;38;5;241:ms=${GREP_COLOR}:"

# https://gist.github.com/thomd/7667642
# https://github.com/trapd00r/LS_COLORS?tab=readme-ov-file
# http://www.bigsoft.co.uk/blog/2008/04/11/configuring-ls_colors
# https://unix.stackexchange.com/questions/94299/dircolors-modify-color-settings-globaly
# https://github.com/RobertAudi/.dotfiles/blob/master/docs/cheat-sheets/ls-colors-cheat-sheet.txt
# https://stackoverflow.com/questions/41849875/how-to-format-the-output-of-tree-in-linux-so-the-colour-scheme-still-applies
export LS_COLORS='*.7z=38;5;40:*.WARC=38;5;40:*.a=38;5;40:*.arj=38;5;40:*.br=38;5;40:*.bz2=38;5;40:*.cpio=38;5;40:*.gz=38;5;40:*.lrz=38;5;40:*.lz=38;5;40:*.lzma=38;5;40:*.lzo=38;5;40:*.rar=38;5;40:*.s7z=38;5;40:*.sz=38;5;40:*.tar=38;5;40:*.tbz=38;5;40:*.tgz=38;5;40:*.warc=38;5;40:*.xz=38;5;40:*.z=38;5;40:*.zip=38;5;40:*.zipx=38;5;40:*.zoo=38;5;40:*.zpaq=38;5;40:*.zst=38;5;40:*.zstd=38;5;40:*.zz=38;5;40:*@.service=38;5;45:*AUTHORS=38;5;220;1:*CHANGELOG=38;5;220;1:*CHANGELOG.md=38;5;220;1:*CHANGES=38;5;220;1:*CODEOWNERS=38;5;220;1:*CONTRIBUTING=38;5;220;1:*CONTRIBUTING.md=38;5;220;1:*CONTRIBUTORS=38;5;220;1:*COPYING=38;5;220;1:*COPYRIGHT=38;5;220;1:*CodeResources=38;5;239:*Dockerfile=38;5;155:*HISTORY=38;5;220;1:*INSTALL=38;5;220;1:*LICENSE=38;5;220;1:*LICENSE.md=38;5;220;1:*LS_COLORS=48;5;89;38;5;197;1;3;4;7:*MANIFEST=38;5;243:*Makefile=38;5;155:*NOTICE=38;5;220;1:*PATENTS=38;5;220;1:*PkgInfo=38;5;239:*README=38;5;220;1:*README.md=38;5;220;1:*README.rst=38;5;220;1:*VERSION=38;5;220;1:*authorized_keys=1:*cfg=1:*conf=1:*config=1:*core=38;5;241:*id_dsa=38;5;192;3:*id_ecdsa=38;5;192;3:*id_ed25519=38;5;192;3:*id_rsa=38;5;192;3:*known_hosts=1:*lock=38;5;248:*lockfile=38;5;248:*pm_to_blib=38;5;240:*rc=1:*.1p=38;5;7:*.32x=38;5;213:*.3g2=38;5;115:*.3ga=38;5;137;1:*.3gp=38;5;115:*.3p=38;5;7:*.82p=38;5;121:*.83p=38;5;121:*.8eu=38;5;121:*.8xe=38;5;121:*.8xp=38;5;121:*.A64=38;5;213:*.BAT=38;5;172:*.BUP=38;5;241:*.C=38;5;81:*.CFUserTextEncoding=38;5;239:*.DS_Store=38;5;239:*.F=38;5;81:*.F03=38;5;81:*.F08=38;5;81:*.F90=38;5;81:*.F95=38;5;81:*.H=38;5;110:*.IFO=38;5;114:*.JPG=38;5;97:*.M=38;5;110:*.MOV=38;5;114:*.PDF=38;5;141:*.PFA=38;5;66:*.PL=38;5;160:*.R=38;5;49:*.RData=38;5;178:*.Rproj=38;5;11:*.S=38;5;110:*.S3M=38;5;137;1:*.SKIP=38;5;244:*.TIFF=38;5;97:*.VOB=38;5;115;1:*.a00=38;5;213:*.a52=38;5;213:*.a64=38;5;213:*.a78=38;5;213:*.aac=38;5;137;1:*.accdb=38;5;60:*.accde=38;5;60:*.accdr=38;5;60:*.accdt=38;5;60:*.adf=38;5;213:*.adoc=38;5;184:*.afm=38;5;66:*.agda=38;5;81:*.agdai=38;5;110:*.ahk=38;5;41:*.ai=38;5;99:*.aiff=38;5;136;1:*.alac=38;5;136;1:*.allow=38;5;112:*.am=38;5;242:*.amr=38;5;137;1:*.ape=38;5;136;1:*.apk=38;5;215:*.application=38;5;116:*.aria2=38;5;241:*.asc=38;5;192;3:*.asciidoc=38;5;184:*.asf=38;5;115:*.asm=38;5;81:*.ass=38;5;117:*.astro=38;5;135;1:*.atr=38;5;213:*.au=38;5;137;1:*.automount=38;5;45:*.avi=38;5;114:*.awk=38;5;172:*.bak=38;5;241:*.bash=38;5;172:*.bash_login=1:*.bash_logout=1:*.bash_profile=1:*.bat=38;5;172:*.bfe=38;5;192;3:*.bib=38;5;178:*.bin=38;5;124:*.bmp=38;5;97:*.bsp=38;5;215:*.c=38;5;81:*.c++=38;5;81:*.cab=38;5;215:*.caf=38;5;137;1:*.cap=38;5;29:*.car=38;5;57:*.cbr=38;5;141:*.cbz=38;5;141:*.cc=38;5;81:*.cda=38;5;136;1:*.cdi=38;5;213:*.cdr=38;5;97:*.chm=38;5;141:*.cjs=38;5;074;1:*.cl=38;5;81:*.clj=38;5;41:*.cljc=38;5;41:*.cljs=38;5;41:*.cljw=38;5;41:*.cnc=38;5;7:*.coffee=38;5;079;1:*.comp=38;5;136:*.cp=38;5;81:*.cpp=38;5;81:*.cr=38;5;81:*.crx=38;5;215:*.cs=38;5;81:*.css=38;5;105;1:*.csv=38;5;78:*.ctp=38;5;81:*.cue=38;5;116:*.cxx=38;5;81:*.dart=38;5;51:*.dat=38;5;137;1:*.db=38;5;60:*.deb=38;5;215:*.def=38;5;7:*.deny=38;5;196:*.description=38;5;116:*.device=38;5;45:*.dhall=38;5;178:*.dicom=38;5;97:*.diff=48;5;197;38;5;232:*.directory=38;5;116:*.divx=38;5;114:*.djvu=38;5;141:*.dll=38;5;241:*.dmg=38;5;215:*.dmp=38;5;29:*.doc=38;5;111:*.dockerignore=38;5;240:*.docm=38;5;111;4:*.docx=38;5;111:*.drw=38;5;99:*.dtd=38;5;178:*.dts=38;5;137;1:*.dump=38;5;241:*.dwg=38;5;216:*.dylib=38;5;241:*.ear=38;5;215:*.ejs=38;5;135;1:*.el=38;5;81:*.elc=38;5;241:*.eln=38;5;241:*.eml=38;5;90;1:*.enc=38;5;192;3:*.entitlements=1:*.epf=1:*.eps=38;5;99:*.epsf=38;5;99:*.epub=38;5;141:*.err=38;5;160;1:*.error=38;5;160;1:*.etx=38;5;184:*.ex=38;5;7:*.example=38;5;7:*.f=38;5;81:*.f03=38;5;81:*.f08=38;5;81:*.f4v=38;5;115:*.f90=38;5;81:*.f95=38;5;81:*.fcm=38;5;137;1:*.feature=38;5;7:*.fish=38;5;172:*.flac=38;5;136;1:*.flif=38;5;97:*.flv=38;5;115:*.fm2=38;5;213:*.fmp12=38;5;60:*.fnt=38;5;66:*.fon=38;5;66:*.for=38;5;81:*.fp7=38;5;60:*.frag=38;5;136:*.ftn=38;5;81:*.fvd=38;5;124:*.fxml=38;5;178:*.gb=38;5;213:*.gba=38;5;213:*.gbc=38;5;213:*.gbr=38;5;7:*.gel=38;5;213:*.gemspec=38;5;41:*.ger=38;5;7:*.gg=38;5;213:*.ggl=38;5;213:*.gif=38;5;97:*.git=38;5;197:*.gitattributes=38;5;240:*.github=38;5;197:*.gitignore=38;5;240:*.gitmodules=38;5;240:*.go=38;5;81:*.gp3=38;5;115:*.gp4=38;5;115:*.gpg=38;5;192;3:*.gs=38;5;81:*.h=38;5;110:*.h++=38;5;110:*.hi=38;5;110:*.hidden-color-scheme=1:*.hidden-tmTheme=1:*.hin=38;5;242:*.hjson=38;5;178:*.hpp=38;5;110:*.hs=38;5;81:*.htm=38;5;125;1:*.html=38;5;125;1:*.http=38;5;90;1:*.hxx=38;5;110:*.icns=38;5;97:*.ico=38;5;97:*.ics=38;5;7:*.ii=38;5;110:*.img=38;5;124:*.iml=38;5;166:*.in=38;5;242:*.info=38;5;184:*.ini=1:*.ipa=38;5;215:*.ipk=38;5;213:*.ipynb=38;5;41:*.iso=38;5;124:*.j64=38;5;213:*.jad=38;5;215:*.jar=38;5;215:*.java=38;5;079;1:*.jhtm=38;5;125;1:*.jpeg=38;5;97:*.jpg=38;5;97:*.js=38;5;074;1:*.jsm=38;5;079;1:*.json=38;5;178:*.json5=38;5;178:*.jsonc=38;5;178:*.jsonl=38;5;178:*.jsonnet=38;5;178:*.jsp=38;5;079;1:*.jsx=38;5;074;1:*.jxl=38;5;97:*.kak=38;5;172:*.key=38;5;166:*.lagda=38;5;81:*.lagda.md=38;5;81:*.lagda.rst=38;5;81:*.lagda.tex=38;5;81:*.last-run=1:*.less=38;5;105;1:*.lhs=38;5;81:*.libsonnet=38;5;142:*.lisp=38;5;81:*.lnk=38;5;39:*.localized=38;5;239:*.localstorage=38;5;60:*.log=38;5;190:*.lua=38;5;81:*.m=38;5;110:*.m2v=38;5;114:*.m3u=38;5;116:*.m3u8=38;5;116:*.m4=38;5;242:*.m4a=38;5;137;1:*.m4v=38;5;114:*.map=38;5;7:*.markdown=38;5;184:*.md=38;5;184:*.md5=38;5;116:*.mdb=38;5;60:*.mde=38;5;60:*.mdump=38;5;241:*.mdx=38;5;184:*.merged-ca-bundle=1:*.mf=38;5;7:*.mfasl=38;5;7:*.mht=38;5;125;1:*.mi=38;5;7:*.mid=38;5;136;1:*.midi=38;5;136;1:*.mjs=38;5;074;1:*.mkd=38;5;184:*.mkv=38;5;114:*.ml=38;5;81:*.mm=38;5;7:*.mobi=38;5;141:*.mod=38;5;137;1:*.moon=38;5;81:*.mount=38;5;45:*.mov=38;5;114:*.mp3=38;5;137;1:*.mp4=38;5;114:*.mp4a=38;5;137;1:*.mpeg=38;5;114:*.mpg=38;5;114:*.msg=38;5;178:*.msql=38;5;222:*.mtx=38;5;7:*.mustache=38;5;135;1:*.mysql=38;5;222:*.nc=38;5;60:*.ndjson=38;5;178:*.nds=38;5;213:*.nes=38;5;213:*.nfo=38;5;184:*.nib=38;5;57:*.nim=38;5;81:*.nimble=38;5;81:*.nix=38;5;155:*.norg=38;5;184:*.nrg=38;5;124:*.nth=38;5;97:*.numbers=38;5;112:*.o=38;5;241:*.odb=38;5;111:*.odp=38;5;166:*.ods=38;5;112:*.odt=38;5;111:*.oga=38;5;137;1:*.ogg=38;5;137;1:*.ogm=38;5;114:*.ogv=38;5;115:*.old=38;5;242:*.opus=38;5;137;1:*.org=38;5;184:*.orig=38;5;241:*.otf=38;5;66:*.out=38;5;242:*.p12=38;5;192;3:*.p7s=38;5;192;3:*.pacnew=38;5;33:*.pages=38;5;111:*.pak=38;5;215:*.part=38;5;239:*.patch=48;5;197;38;5;232;1:*.path=38;5;45:*.pbxproj=1:*.pc=38;5;7:*.pcap=38;5;29:*.pcb=38;5;7:*.pcf=1:*.pcm=38;5;136;1:*.pdf=38;5;141:*.pem=38;5;192;3:*.pfa=38;5;66:*.pfb=38;5;66:*.pfm=38;5;66:*.pgn=38;5;178:*.pgp=38;5;192;3:*.pgsql=38;5;222:*.php=38;5;81:*.pi=38;5;7:*.pid=38;5;248:*.pk3=38;5;215:*.pl=38;5;208:*.plist=1:*.plt=38;5;7:*.ply=38;5;216:*.pm=38;5;203:*.png=38;5;97:*.pod=38;5;184:*.pot=38;5;7:*.pps=38;5;166:*.ppt=38;5;166:*.ppts=38;5;166:*.pptsm=38;5;166;4:*.pptx=38;5;166:*.pptxm=38;5;166;4:*.profile=1:*.properties=38;5;116:*.prql=38;5;222:*.ps=38;5;99:*.psd=38;5;97:*.psf=1:*.pug=38;5;135;1:*.pxd=38;5;97:*.pxm=38;5;97:*.py=38;5;41:*.pyc=38;5;240:*.qcow=38;5;124:*.r=38;5;49:*.r[0-9]{0,2}=38;5;239:*.rake=38;5;155:*.rb=38;5;41:*.rdata=38;5;178:*.rdf=38;5;7:*.rkt=38;5;81:*.rlib=38;5;241:*.rmvb=38;5;114:*.rnc=38;5;178:*.rng=38;5;178:*.rom=38;5;213:*.rpm=38;5;215:*.rs=38;5;81:*.rss=38;5;178:*.rst=38;5;184:*.rstheme=1:*.rtf=38;5;111:*.ru=38;5;7:*.s=38;5;110:*.s3m=38;5;137;1:*.sample=38;5;114:*.sass=38;5;105;1:*.sassc=38;5;244:*.sav=38;5;213:*.sc=38;5;41:*.scala=38;5;41:*.scan=38;5;242:*.sch=38;5;7:*.scm=38;5;7:*.scpt=38;5;219:*.scss=38;5;105;1:*.sed=38;5;172:*.service=38;5;45:*.sfv=38;5;116:*.sgml=38;5;178:*.sh=38;5;172:*.sid=38;5;137;1:*.sig=38;5;192;3:*.signature=38;5;192;3:*.sis=38;5;7:*.sms=38;5;213:*.snapshot=38;5;45:*.socket=38;5;45:*.sparseimage=38;5;124:*.spl=38;5;7:*.spv=38;5;217:*.sql=38;5;222:*.sqlite=38;5;60:*.srt=38;5;117:*.ssa=38;5;117:*.st=38;5;213:*.stackdump=38;5;241:*.state=38;5;248:*.stderr=38;5;160;1:*.stl=38;5;216:*.storyboard=38;5;196:*.strings=1:*.sty=38;5;7:*.sub=38;5;117:*.sublime-build=1:*.sublime-commands=1:*.sublime-keymap=1:*.sublime-project=1:*.sublime-settings=1:*.sublime-snippet=1:*.sublime-workspace=1:*.sug=38;5;7:*.sup=38;5;117:*.svelte=38;5;135;1:*.svg=38;5;99:*.swap=38;5;45:*.swift=38;5;219:*.swo=38;5;244:*.swp=38;5;244:*.sx=38;5;81:*.t=38;5;114:*.target=38;5;45:*.tcc=38;5;110:*.tcl=38;5;64;1:*.tdy=38;5;7:*.tex=38;5;184:*.textile=38;5;184:*.tf=38;5;168:*.tfm=38;5;7:*.tfnt=38;5;7:*.tfstate=38;5;168:*.tfvars=38;5;168:*.tg=38;5;7:*.theme=38;5;116:*.tif=38;5;97:*.tiff=38;5;97:*.timer=38;5;45:*.tmTheme=1:*.tmp=38;5;244:*.toast=38;5;124:*.toml=38;5;178:*.torrent=38;5;116:*.ts=38;5;074;1:*.tsv=38;5;78:*.tsx=38;5;074;1:*.ttf=38;5;66:*.twig=38;5;81:*.txt=38;5;253:*.typelib=38;5;60:*.un~=38;5;241:*.urlview=38;5;116:*.user-ca-bundle=1:*.v=38;5;81:*.vala=38;5;81:*.vapi=38;5;81:*.vb=38;5;81:*.vba=38;5;81:*.vbs=38;5;81:*.vcard=38;5;7:*.vcd=38;5;124:*.vcf=38;5;7:*.vdf=38;5;215:*.vdi=38;5;124:*.vert=38;5;136:*.vfd=38;5;124:*.vhd=38;5;124:*.vhdx=38;5;124:*.vim=38;5;172:*.viminfo=1:*.vmdk=38;5;124:*.vob=38;5;115;1:*.vpk=38;5;215:*.vtt=38;5;117:*.vue=38;5;135;1:*.war=38;5;215:*.wav=38;5;136;1:*.webloc=38;5;116:*.webm=38;5;115:*.webp=38;5;97:*.wgsl=38;5;97:*.wma=38;5;137;1:*.wmv=38;5;114:*.woff=38;5;66:*.woff2=38;5;66:*.wrl=38;5;216:*.wv=38;5;136;1:*.wvc=38;5;136;1:*.xcconfig=1:*.xcf=38;5;7:*.xcsettings=1:*.xcuserstate=1:*.xcworkspacedata=1:*.xib=38;5;208:*.xla=38;5;76:*.xln=38;5;7:*.xls=38;5;112:*.xlsx=38;5;112:*.xlsxm=38;5;112;4:*.xltm=38;5;73;4:*.xltx=38;5;73:*.xml=38;5;178:*.xpi=38;5;215:*.xpm=38;5;97:*.xsd=38;5;178:*.xsh=38;5;41:*.yaml=38;5;178:*.yml=38;5;178:*.z[0-9]{0,2}=38;5;239:*.zcompdump=38;5;241:*.zig=38;5;81:*.zlogin=1:*.zlogout=1:*.zprofile=1:*.zsh=38;5;172:*.zshenv=1:*.zwc=38;5;241:*.zx[0-9]{0,2}=38;5;239:bd=38;5;68:ca=38;5;17:cd=38;5;113;1:di=38;5;30:do=38;5;127:ex=38;5;208;1:pi=38;5;126:fi=0:ln=target:mh=38;5;222;1:no=0:or=48;5;196;38;5;232;1:ow=38;5;220;1:sg=48;5;3;38;5;0:su=38;5;220;1;3;100;1:so=38;5;197:st=38;5;86;48;5;234:tw=48;5;235;38;5;139;3:'


export CLICOLOR=1
export LS_COLORS="*LS_COLORS=48;5;89;38;5;197;1;3;4;7:readline-colored-completion-prefix=1;38;5;13;48;5;235:no=1;38;5;11;48;5;9:di=1;4;38;5;13;48;5;235:fi=0;38;5;250:ln=2;3;38;5;250:ex=1;4;38;5;5:so=1;4;5;38;5;9:or=1;38;5;11;48;5;9:"

# https://the.exa.website/docs/colour-themes
export EXA_COLORS="${LS_COLORS}:hd=1;4;38;5;13;48;5;8:sb=1;4;38;5;13:sn=1;4;38;5;13:da=3;38;5;13:uu=2;38;5;13:gd=1;4;38;5;2:.*=2;3;18;38;5;8:"

# FUNCTIONS -------------------------------------
#   - https://tldp.org/LDP/abs/html/functions.html
#   - https://cuddly-octo-palm-tree.com/posts/2021-10-31-better-bash-functions/
# ------------------------------------------------
# Slightly modified from: https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt
# # https://misc.flogisoft.com/bash/tip_colors_and_formatting
# Show current git branch in command line
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (🐙 \1)/'
}

echo Bash RC
