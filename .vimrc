"                   .
"   ##############......##############
"   ##############......##############
"     ##########..........##########
"     ##########........##########
"     ##########.......##########
"     ##########.....##########..
"     ##########....##########.....
"   ..##########..##########.........
" ....##########.#########.............
"   ..################JJJ............
"     ################.............
"     ##############.JJJ.JJJJJJJJJJ
"     ############...JJ...JJ..JJ  JJ
"     ##########....JJ...JJ..JJ  JJ
"     ########......JJJ..JJJ JJJ JJJ
"     ######    .........
"                 .....
"                   .
" -------------------------------------------------------------------------
" File: .vimrc
" Source: https://github.com/devpunks
" Author: devPunks (github.com/devpunks)
" Description: Vim(rc) configuration file.
" Gist: https://gist.github.com/snuggs/612093
" -------------------------------------------------------------------------
"
" Screencasts - http://vimcasts.org
" Cheatsheets:
"   - https://vim.rtorr.com/
"   - https://devhints.io/vimscript
" TERM - https://vimhelp.org/term.txt.html
" Auto Commands - https://vimhelp.org/autocmd.txt.html
" Tutorial - http://learnvimscriptthehardway.stevelosh.com
" VIM9 Script - https://vimhelp.org/vim9.txt.html#Vim9-script
" Idiomatic .vimrc - https://github.com/romainl/idiomatic-vimrc
" Styleguide - https://google.github.io/styleguide/vimscriptguide.xml
" Programming - https://got-ravings.blogspot.com/2008/09/vim-pr0n-prototype-based-objects.html
"
" TODO:
" CLICKING LINE NUMBERS
"  - https:/reddit.com/r/vim/comments/86pjx4/does_vim_currently_have_a_way_to_handle_clicks_on

" =========================================================================

" -------------------------------------------------------------------------
" Reset all autocommand groups
augroup VimDefaults  | autocmd! | augroup END
augroup FileDefaults | autocmd! | augroup END
" -------------------------------------------------------------------------

set emoji encoding=UTF-8

" https://stackoverflow.com/q/5845557
" TODO: remove if &compatible | set nocompatible | endif

if ! exists('g:pluginname_setting')
  unlet! skip_defaults_vim
  let g:skip_defaults_vim=0
  source $VIMRUNTIME/defaults.vim
endif

execute 'set <FocusLost>=\<Esc>[O'
execute 'set <FocusGained>=\<Esc>[I'
" xterm-focus-event tracking - https://github.com/vim/vim/issues/9296
let &t_fe = '\<Esc>[?1004h' " enable focus-event tracking
let &t_fd = '\<Esc>[?1004l' " disable focus-event tracking
" https://groups.google.com/g/vim_use/c/VyQSx90uaPE

" NOTES -------------------------------------------------------------------
"  - https://superuser.com/q/935574/get-rid-of-null-character-in-vim-variable
"  - https://til.hashrocket.com/posts/qll3kizlzj-check-that-an-executable-exists-on-the-path
"  - Test executables - https://renenyffenegger.ch/notes/development/vim/script/vimscript/functions/executable
echom "VIM: "  .. v:version
echom "BASH: " .. system( 'echo -n $BASH_VERSION' )
if exists( '$TMUX' ) | echom "TMUX: " .. system( 'echo -n $(tmux -V)' ) | endif
if executable( 'termux-info' ) | echom "TERMUX: " .. $TERMUX_VERSION | endif

" =========================================================================
" {{{ SETTINGS
" =========================================================================
let &shell = $SHELL..' --login' " Add login"
let $prefix = exists('$PREFIX') ? $PREFIX : '/usr' " Check for TERMUX $PREFIX

" - https://gist.github.com/romainl/7e2b425a1706cd85f04a0bd8b3898805
" - https://stackoverflow.com/q/2288756/how-to-set-working-current-directory-in-vim
set path =./**
set path +=$HOME
set path +=$prefix/include

echo '(vi) PATH:'..&path
" increment formats - https://vimtricks.com/p/vimtrick-increment-numbers/
set nrformats+=alpha
set nrformats-=octal

set updatetime=150 " 150 Milliseconds
" https://vimhelp.org/options.txt.html#%27timeout%27
set timeout " on mappings
set ttimeout " on keycodes
set ttimeoutlen=-1  " mappings
set timeoutlen=5000 " keykodes

" https://vim.fandom.com/wiki/Folding
set foldenable
set foldlevel=1
set foldcolumn=2
set foldclose=all
set foldlevelstart=0
set foldmethod=indent " [ manual|indent|expr|marker|syntax|diff ]

set showcmd " show current command characters
set modeline " https://vim.fandom.com/wiki/Modeline_magic
set cmdheight=2 " sets the :ex command prompt line height
set modelines=1 " Head & tail mode lines (:help modeline)
set showcmdloc=statusline " Add current command to status
set showmatch matchtime=20 " jump to matching brace (in 1/10ths of seconds)

set wrapscan " Search respects wrapping
set hlsearch " result highlight grouping
set incsearch " highlight search matches
" TODO: Problematic for conditionals "A"=="a" vs "A"==?"a"
" set smartcase " Capitalization case-sensitive search
" https://vi.stackexchange.com/q/11236
" https://learnvimscriptthehardway.stevelosh.com/chapters/22.html
set ignorecase " Case in-sensitive search
set tagcase=followscs " Follow smartcase & ignorecase

" Bells -------------------------------------------------------------------
" Set termcap(ability) for visual bell
set errorbells " Unset audio bell on errors
"set belloff+=wildmode " Turn off insert completion bell
" Set the window bell to flash
set t_vb=
if has("gui_running")
  set visualbell t_vb=|250f " Nf - where N = milliseconds
elseif exists('$TMUX')
  set novisualbell " passthrough to TMUX
else
  " <N> - where N = milliseconds
  set visualbell t_vb=[?5h$<250>[?5l
endif

" Chrome ------------------------------------------------------------------
" tabs
set tabline=%!TabLine()
set showtabline=2 " :help setting-tabline
" shell window
set title " Turn on title
set titlelen=75 " Text length of title
set titlestring="VIM SHELL TITLE %<%F%=%l/%L-%P"  " Window Title String format

" Menus -------------------------------------------------------------------
" :menu " :help menu
let do_no_lazyload_menus = 1
source $VIMRUNTIME/menu.vim

" - http://vim.wikia.com/wiki/Great_wildmode/wildmenu_and_console_mouse
" - https://stackoverflow.com/q/9511253/how-to-effectively-use-vim-wildmenu
set wildmenu
set infercase
set wildchar=<Tab>
set wildoptions=pum
set wildcharm=<C-z> " macros
set wildmode=list:longest,full
set wildignore+=.DS_STORE,storage/,.cache/,.git/,.ssh/,.npm/,node_modules/

" Completion / LSPs -------------------------------------------------------
" https://github.com/neoclide/coc.nvim
" https://linuxhandbook.com/vim-auto-complete
" https://vim.fandom.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions
set complete=.,w,b,u,i " -t - https://mail-archive.com/vim@vim.org/msg03963.html
set completepopup+=align:item,border:on
set completeopt+=menu,menuone,noinsert,popup " noselect|noinsert for automatic completion

" }}}

" =========================================================================
" {{{ Copy & 🍝Pasta
" =========================================================================
set selection=exclusive " No EOL CR/LF
set pastetoggle=<Leader>p " Allow toggle of (paste) insert indentation
set nopaste " non paste mode - https://vimtricks.com/p/vimtricks-avoid-paste-formatting

if has('clipboard_working')
  echom 'Copy & 🍝Pasta'
else
  echom '❌ NO Copy & 🍝Pasta'
endif

" Clipboard Registers -----------------------------------------------------
"   - https://stackoverflow.com/q/11489428
"   - https://github.com/termux/termux-packages/issues/2308
"   - https://vimtricks.com/p/vimtrick-the-clipboard-register/
"   - https://reddit.com/r/termux/comments/c17rwf/how_to_paste_to_vim_from_external_clipboard/
"   - OSC52 Escape to system clipboard - https://chromium.googlesource.com/apps/libapps/+/master/hterm/etc/osc52.vim

" vnoremap <C-c> "*y<cr>
" inoremap <C-v> “*p<cr>
if has('unnamedplus') | set clipboard=unnamed,unnamedplus | endif
"
"  copy and paste
" vmap <C-c> "+yi
" vmap <C-x> "+c
" vmap <C-v> c<ESC>"+p
" imap <C-v> <ESC>"+pa

" Termux ------------------------------------------------------------------
" https://ibnishak.github.io/blog/post/copy-to-termux-clip/
if executable('termux-clipboard-set')
  echom 'Termux Copy & 🍝Pasta'
  " vnoremap <C-x> :!termux-clipboard-set<CR>
  " vnoremap <C-c> :w !termux-clipboard-set<CR><CR>
  " inoremap <C-v> <ESC>:read !termux-clipboard-get<CR>i
else
  echom '❌ NO Termux Copy & 🍝Pasta'
endif

" }}}

" =========================================================================
" {{{ BUFFERS
" =========================================================================
" set nohidden possibly overridden by ZoomWin https://vimtricks.com/p/what-is-set-hidden/
set hidden
set confirm "  on persistence
set autowrite " on lost focus
set bufhidden=unload " [hide|unload|delete]

set equalalways " on load
set winwidth=1 " initial width
set winheight=1 " initial height
set winminwidth=0 " minimum width
set winminheight=0 " minimum height
set history=1000 " Increase undo limit
set tabpagemax=50 " Maximum number of tab pages
set splitbelow splitright " new buffer locations
command! Flush :update | %bd | e# " https://vimtricks.com/p/closing-hidden-buffers/

" }}}

" =========================================================================
" {{{ VIEWS, SESSIONS, VIMINFO
"   - https://vimtricks.com/p/saving-session-state/
"   - https://learnvim.irian.to/basics/views_sessions_viminfo
" =========================================================================
" disable sessions
set viewoptions-=options
set viewoptions+=localoptions
set viewdir=$HOME/.vim/view

set sessionoptions-=options
set sessionoptions+=resize,winpos

set viminfo="NONE" " disable .viminfo
set viminfofile="NONE" " disable .viminfo
set viminfo='100,<50,s10,h,%

set viminfofile=$HOME/.vim/.viminfo

" }}}

" =========================================================================
" {{{ BACKUPS
"   - https://groups.google.com/g/vim_use/c/K2Utwkh5f30?pli=1
"   - https://alvinalexander.com/linux-unix/vi-vim-swap-backup-tilde-temporary-files-directory-move/
" =========================================================================
set backup " keep a backup file (nobackup for inverse)
" Undo location
" set nobackup
" set nowritebackup
" set noswapfile
" set noundofile

set undodir=$TMPDIR " undo location
set directory=$TMPDIR " swap location
set backupdir=$TMPDIR " backup location

" }}}

" =========================================================================
" {{{ CURSOR
" =========================================================================
set ttyfast " for redraws

set nolazyredraw " Fast non-macro updates
"set lazyredraw " Prevent slow macro updates
set ttyscroll=3 " number of characters for redraws

set cursorline " highlight current cursor line
set cursorcolumn " highlight current cursor column
set nostartofline " respect cursor column position
set cursorlineopt=both " [number,line,both,screenline]

" reset cursor escapes
" use  CSI for single quotes ('')
" use \e CSI for double quotes ("")
" https://stackoverflow.com/q/6488683
" https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = '' " START INSERT
let &t_SR = '' " START REPLACE
let &t_EI = '' " NORMAL (EXIT INSERT)

" CURSOR TYPE -------------------------------------------------------------
" 0 Default
" 1 Block (blinking)
" 2 Block (steady)
" 3 Underline (blinking)
" 4 Underline (steady)
" 5 Bar (blinking) (xterm)
" 6 Bar (steady) (xterm)
let &t_SI..="\e[5;0;0 q" " SI = START INSERT bar |
let &t_SR..="\e[3;0;0 q" " SR = START REPLACE underline _
let &t_EI..="\e[1;0;0 q" " EI = NORMAL (EXIT INSERT) block

" CURSOR COLOR ------------------------------------------------------------
let &t_SI..="\e]12;red\x7"   " INSERT = red cursor
let &t_SR..="\e]12;blue\x7"  " REPLACE = blue cursor
let &t_EI..="\e]12;green\x7" " NORMAL = green cursor
" reset cursor when vim exits
" autocmd VimLeave * silent !echo -ne "]12;cyan\x7"
autocmd VimDefaults VimLeave * silent !echo -ne '[0;0;0 q'

" GUI CURSOR --------------------------------------------------------------
if has('gui_running')
  set guioptions=egmrt " remove ugly toolbar :-)
  " https://vim.fandom.com/wiki/Configuring_the_cursor
  set guicursor=i:blinkwait90
  set guicursor+=i:ver100-iCursor
  set guicursor+=n-v-c:blinkwait10
  set guicursor+=n-v-c:block-Cursor
endif

" }}}

" =========================================================================
" {{{ MOUSE
"   - https://vimhelp.org/options.txt.html#%27ttymouse%27
" =========================================================================
set t_RV= " Disable automatic mouse detection
if has('mouse')
  echo "Has mouse"
elseif has('mouse_sgr') " https://vimhelp.org/options.txt.html#sgr-mouse
  set mouse=a " Enable mouse use in a(ll) modes
  set ttymouse=sgr " Set sgr mouse
else
  set ttymouse=xterm2 " degrade to xterm2 mouse
endif

" }}}

" =========================================================================
" {{{ GUTTER
" https://github.com/airblade/vim-gitgutter/commit/8db2fc5
" =========================================================================
set number
set numberwidth=4 " gutter columns

if has('signs') " https://vimdoc.sourceforge.net/htmldoc/sign.html
  " https://github.com/vim/vim/commit/394c5d8870b15150fc91a4c058dc571fd5eaa97e
  set signcolumn=yes " [auto|number|yes|no|off]
endif

" }}}

" =========================================================================
" {{{ STATUS
" Word Count - https://vimtricks.com/p/count-words-and-lines/
"   - <C-g> - short format
"   - g<C-g> - extended format
"   - Status line - https://cromwell-intl.com/open-source/vim-word-count.html
" =========================================================================
set showmode " in status Vi (not Vim)
set shortmess= " Verbose command messaging
set shortmess-=S " Show search count
set laststatus=2 " Always show status line
if has('win32') | set shortname=on | end

" https://vi.stackexchange.com/a/27508
set ruler " set cursor coordinates
set rulerformat=📏%P⏬%l⏩%c%V " overridden by statusline

set statusline=%#Statement# " initialize highlight group

" buffer number
set statusline+=﹟%n\ 

" mode
set statusline+=%{(mode()=~'^c')?'💲':''} " Command
set statusline+=%{(mode()=~'^i')?'📝':''} " Insert
set statusline+=%{(mode()=~'^n')?'📄':''} " Normal
set statusline+=%{(mode()=~'^R')?'📃':''} " Replace
set statusline+=%{(mode()=~#'^v')?'🔍':''} " Visual
set statusline+=%{(mode()=~#'^V')?'🔎':''} " Visual Line
" https://gnu.org/software/grep/manual/html_node/Character-Classes-and-Bracket-Expressions.html
set statusline+=%{(mode()=~'^[[:cntrl:]]')?'🔍':''} " Visual Block ()

" full file name
set statusline+=%-4.15F%m
" git changes
set statusline+=%{%g:GitChanges()%}
" file type
set statusline+=💻%Y
" (Guten)Tags
set statusline+=%{gutentags#statusline('#')}
"set statusline+=%{get(g:, 'gutentags_updated', '')}
" flags
set statusline+=\ %r%h
" change to default highlight
set statusline+=\ %#StatusLine#\ 
" percentage
set statusline+=%-7((%p%%)⇳%)
" cursor line, total lines
set statusline+=%L☰LOC
" breakpoint
set statusline+=\ %<
" align right
set statusline+=%=
" cursor column position
set statusline+=%5(%4l⇩%)✖%-8.(⇨%-c%-V%)
" Show Command
set statusline+=\|%1.(%k%)
" Show Control Character Value
set statusline+=\|%-2(%S%)
" Show Cursor Character Values
set statusline+=%{CursorCharacter()}

set statusline+=%< " breakpoint
set statusline+=%#Normal# " set highlight

" formatoptions
set statusline+=\ 📜\ %{&fo}
" show colorscheme on statusline
set statusline+=\ 🎨\ %{get(g:,'colors_name','NONE')}\ 

" }}}

" =========================================================================
" {{{ FILES
"   - Per type configuration - https://vimtricks.com/p/per-file-type-configs/
"   - autocommands - https://gist.github.com/romainl/6e4c15dfc4885cb4bd64688a71aa7063
" =========================================================================
" -------------------------------------------------------------------------
" Tar
"   - https://vi.stackexchange.com/a/2224
" -------------------------------------------------------------------------
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1

" -------------------------------------------------------------------------
" Zip
"   - https://vi.stackexchange.com/q/2223/how-to-tell-vim-not-to-try-to-unzip-a-file
" -------------------------------------------------------------------------
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1

set autoread " re-read files
set noautowrite " do not autowrite
set noautowriteall " do not autowrite (all)

" Indentation ------------------------------------
set smarttab " 'tab' insertion
set autoindent   " auto(matically smart)indent
set copyindent   " copy previous line indentation
set breakindent  " break with existing line indent
" TODO: remove set smartindent  " indent based off current line on load

filetype plugin indent on " filetype - https://vimdoc.sourceforge.net/htmldoc/filetype.html

" Meta-chars ------------------------------------
set fillchars+=fold:↯,foldopen:-,foldclose:+,foldsep:↯
set fillchars+=stl:▲,stlnc:\ ,vert:‖,diff:-,eob:𝕏,lastline:▶

" Format Options ------------------------------------
set joinspaces " Add two spaces after punctuation

" https://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
set formatoptions=   " reset
set formatoptions+=c " autowrap `c`omments (with leader)
set formatoptions+=j " Delete joining line comment
set formatoptions+=l " preserve existing lines
set formatoptions+=n " Format numbered lists
set formatoptions+=o " Preserve o/O insert comments
set formatoptions+=q " autowrap comments with gq program
set formatoptions+=r " Preserve comment on CRLF newline
set formatoptions+=t " autowrap using `t`extwidth
set formatoptions+=/ " do not insert // leader unless after statement unless BOL
set fileformats=unix,dos " set <LF> (unix) first, then try <CR><LF> (DOS)

" -------------------------------------------------------------------------
" Omni-Complete
"  - https://vim.fandom.com/wiki/Omni_completion
"  - Defaults - https://github.com/vim/vim/tree/master/runtime/autoload
" -------------------------------------------------------------------------
set omnifunc=syntaxcomplete#Complete " Default Completion

" -------------------------------------------------------------------------
" .vimrc
" -------------------------------------------------------------------------
" Autoload .vimrc on write
autocmd FileDefaults BufWritePost $MYVIMRC nested source $MYVIMRC

" -------------------------------------------------------------------------
" .tmux.conf
" -------------------------------------------------------------------------
augroup FileDefaults
  " Autoload .tmux.conf on write
  autocmd BufWritePost .tmux.conf
    \ :echom 'Loading TMUX Configuration' |
    \ call system('tmux source-file "$HOME/.tmux.conf"') |
    \ call system('tmux display-message "Source file loaded! (#{config_files})"')

augroup END

" -------------------------------------------------------------------------
" CSV - https://github.com/chrisbra/csv.vim
" -------------------------------------------------------------------------
autocmd FileDefaults BufReadPost,BufNewFile *.csv,*.dat call g:CSV ()

function g:CSV () abort
  setfiletype csv

" let b:csv_arrange_align = 'l*'

  ArrangeColumn

  echo 'loaded CSV (See https://github.com/chrisbra/csv.vim)'
  let g:csv_highlight_column = 'y'
endfunction " g:CSV

" -------------------------------------------------------------------------
" Markdown
"   - http://vimcasts.org/episodes/hard-wrapping-text
" -------------------------------------------------------------------------
augroup FileDefaults
  autocmd BufReadPost *.md setlocal formatoptions-=t formatoptions+=n
  autocmd BufReadPost README setlocal formatoptions-=t formatoptions+=n
augroup END

" -------------------------------------------------------------------------
" HTML
"   - https://vimtricks.com/p/vim-autocomplete-html-tags
" -------------------------------------------------------------------------
autocmd FileDefaults FileType html,eruby setlocal omnifunc=htmlcomplete#CompleteTags

" -------------------------------------------------------------------------
" CSS
"   - https://simplified.guide/vim/auto-complete-css
" -------------------------------------------------------------------------
autocmd VimDefaults VimEnter * call g:CSS()

augroup FileDefaults
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd BufNewFile,BufReadPost *.sss,*.sass,*.scss setlocal filetype=css
augroup END

function! g:CSS () abort
  if &rtp !~ 'vim-css3-syntax' | return | endif

  highlight VendorPrefix guifg=#00ffff gui=bold
  match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/
endfunction " g:CSS

" -------------------------------------------------------------------------
" Go
" -------------------------------------------------------------------------
autocmd FileDefaults FileType go setlocal omnifunc=syntaxcomplete#Complete

" -------------------------------------------------------------------------
" PHP
"   - https://simplified.guide/vim/auto-complete-php
" -------------------------------------------------------------------------
autocmd FileDefaults FileType php setlocal omnifunc=phpcomplete#CompletePHP

" -------------------------------------------------------------------------
" Python
"   - https://simplified.guide/vim/auto-complete-python
" -------------------------------------------------------------------------
autocmd FileDefaults FileType python setlocal omnifunc=python3complete#Complete

" -------------------------------------------------------------------------
" Javascript
"   - https://simplified.guide/vim/auto-complete-javascript
" -------------------------------------------------------------------------
augroup FileDefaults
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd BufNewFile,BufReadPost *.json,*.es,*.mjs,*.test setlocal filetype=javascript
augroup END

" -------------------------------------------------------------------------
" Nodejs
"   - https://simplified.guide/vim/auto-complete-javascript
" -------------------------------------------------------------------------
autocmd FileDefaults BufNewFile,BufReadPost * call s:DetectNode()

fun! s:DetectNode()
  if getline(1) !~ 'node' | return | endif

  setlocal filetype=javascript
  setlocal omnifunc=javascriptcomplete#CompleteJS
endfun

" -------------------------------------------------------------------------
" Ruby
"   - https://stackoverflow.com/q/15720313/vim-omnicomplete-with-ruby-only-partially-works/22805517#22805517
" -------------------------------------------------------------------------
augroup FileDefaults
  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  autocmd BufNewFile,BufReadPost Gemfile setlocal filetype=ruby
  autocmd BufNewFile,BufReadPost *.erb setlocal filetype=eruby
augroup END

" }}}

" =========================================================================
" {{{ FUNCTIONS
"  - https://tecmint.com/bash-scripts-linux-sysadmin
" =========================================================================
" -------------------------------------------------------------------------
" PopUp () - https://vimhelp.org/popup.txt.html
" -------------------------------------------------------------------------

function! PopUp () abort
  let l:choices = [ 'Suggestion #1', 'Suggestion #2', 'Suggestion #3' ]

  call popup_menu( l:choices
    \, #{ highlight: 'WildMenu', borderhighlight: ['WildMenu'], border: [], borderchars: ['•']
      \, padding: [1,1,0,1], close: 'button', scrollbar: 'TRUE', resize: 'FALSE', drag: 'TRUE', wrap: 'FALSE'
      \, title: '• devPunks😈Studio •', filtermode: 'a', zindex: 1, pos: 'botleft', col: 'cursor+1', callback: 'PopUpComplete' })
endfunction " PopUp

function! PopUpComplete (id, result) abort
  echo 'Hot Damn '..a:id..' '..a:result
endfunction " PopUpComplete


" -------------------------------------------------------------------------
" Browser ()
" -------------------------------------------------------------------------
function! Browser () abort " Opening URL
  const url = getline (".")->matchstr("http[^ ]*")

  if ! empty( url )
    echom "Opening URL: "..url
"   exec "!echo "..url
    exec "!type ls && type grep"
    exec "!type open"
    exec 'open '..url
  endif
endfunction " Browser

" -------------------------------------------------------------------------
" CursorCharacter ()
"   - :help ascii
"   - https://stackoverflow.com/q/20357800
"   - https://en.wikipedia.org/wiki/Unicode
"   - https://geeksforgeeks.org/program-decimal-octal-conversion
"   - https://unicode.org/mail-arch/unicode-ml/y2005-m11/0060.html
" -------------------------------------------------------------------------
function! CursorCharacter () abort " DecimalToOctal(27)"
  let l:char = strpart( getline('.'), col('.')-1, 1, 1 )
  let l:index = char2nr( char ) " char(acter) to number
  let l:character = printf( '|%-2s', char )

  " Formal Hexadecimal Unicode Notation (Code Point)
  " - https://en.wikipedia.org/wiki/UTF-8
  " - https://en.wikipedia.org/wiki/UTF-16
  " - https://en.wikipedia.org/wiki/Hexadecimal
  " - https://en.wikipedia.org/wiki/Percent-encoding (e.g. %20)
  let l:hexadecimal = printf( '|U+%-7s' , printf( '%04X', index ) )
  " Formal Decimal HTML Entity (Code Point) - https://en.wikipedia.org/wiki/Code_point
  let l:decimal = printf( '|&#%-7s', printf ( '%d;', index ) )
  " Octal (Code Point) - https://en.wikipedia.org/wiki/Numeric_character_reference
  let l:octal = printf( '|\0o%-6o', index )

  " Join character to escape sequences
  " - https://en.wikipedia.org/wiki/Escape_sequence
  return character..join( [ decimal, hexadecimal, octal ], ' ' )
endfunction " CursorCharacter

" -------------------------------------------------------------------------
" GetColor (group, attribute)
"   - https://reddit.com/r/neovim/comments/oxddk9
" -------------------------------------------------------------------------
function! GetColor (group, attr) abort " GetColor('LineNr', 'bg#')"
  let color = synIDattr( synIDtrans( hlID(a:group)), a:attr)

  echom "THE COLOR".color

  return color ? color : 'NONE'
endfunction " GetColor

" -------------------------------------------------------------------------
" :HighlightGroup () under cursor
" -------------------------------------------------------------------------
" https://vim.fandom.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
" https://gist.github.com/millermedeiros/1262085/d6376a5cd6b13ba4573abe0f45a458bf6ae596b7#file-gistfile1-vim-L306
function! HighlightGroup () abort
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction " HighlightGroup
command! Colors call HighlightGroup()

" -------------------------------------------------------------------------
" TabLine () :h(elp) setting-tablines
" -------------------------------------------------------------------------
function! TabLine () abort
  if ! exists('+showtabline') | return '' | endif

  " mouse
  let mouse="%{empty(&mouse)?'    ':'  🐭'}"

  let line = mouse " Initialize
  let line ..= ' devPunks😈studio %#TabLine#' " logo

  let l:tabs = range( tabpagenr('$') )
  for index in l:tabs
    let l:tab = index + 1
    let l:count = tabpagewinnr( tab,'$' )
    let l:window = tabpagewinnr( l:tab )
    let l:buffers = tabpagebuflist( l:tab )
    let l:index = l:buffers[ l:window - 1 ]
    let l:name = bufname( l:index )
    let l:modified = getbufvar( l:index, '&mod' )

    " set tab page number (for mouse clicks)
    let line ..='%' .. ( l:tab ) .. 'T'
    let line ..= (l:tab == tabpagenr() ? '%#TabLineSel#| ▼ ' : '%#TabLine#| ')
    let line ..= (l:tab == tabpagenr() ? '✎' : '')
    let line ..= ( l:name == '' ?  '[No Name]' : fnamemodify (l:name, ':t' ) )
    let line ..= ( l:modified ? '➕' : '' )
    let line ..= ( l:count > 1 ? ' ⊞'.l:count : '' )

    let l:others = ( len( l:tabs ) > 1 )
    let l:current = ( l:tab == tabpagenr() )
    " Close button
    " let line ..= '%=%999X%#TabLineSel#[X]' " Right justified on TabLine
    let line ..= ( l:others && l:current ? '%' .. (l:tab) .. 'X ❌%X' : '' )
    " Closing gliph
    let line ..= ( l:current ? ' ▼ |' : ' ' )

    let line ..= '%T' " Tab delineation
  endfor

  let line ..= '%<' " Overflow breakpoint
  let line ..= '%#TabLineFill#' " Tablist breakpoint

  return line
endfunction " TabLine

" }}}

" =========================================================================
" {{{ MAPPINGS
"  - :help ga
"  - https://vi.stackexchange.com/q/16161
"  - https://vi.stackexchange.com/q/2089
"  - https://vi.stackexchange.com/q/7722/how-to-debug-a-mapping

" set a map leader for more key combos
" - https://stackoverflow.com/q/1764263/what-is-the-leader-in-a-vimrc-file
" " https://stevelosh.com/blog/2010/09/coming-home-to-vim/#using-the-leader
" - https://subscription.packtpub.com/book/data/9781789341096/3/ch03lvl1sec26/the-leader-key
let g:mapleader = ','

" =========================================================================
" :h modifyOtherKeys
" let &t_TI = ''
" let &t_TE = ''
" let &t_TI = '[>4;2m'
" let &t_TE = '[>4;m'
echo 'modifyOtherKeys: t_TI='..&t_TI..' t_TI='..&t_TE

" Map semi-colon to colon (no need to press <SHIFT>)
nnoremap ; :
" Search (Find)
nnoremap <S-f> /

" :Bdelete menu<CR>
nnoremap <silent> <Del> x
nnoremap <silent> <Tab><Del> :Bwipeout menu<CR>
nnoremap <Space> za
nnoremap <Enter> :echo 'ENTER'
nnoremap <Space><Enter> :echo 'SPACE + ENTER'
inoremap <Space><Enter> <C-o>:echo 'INSERT SPACE + ENTER'
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>
inoremap <Tab> <C-o>:echo 'INSERT TAB'
inoremap <S-Tab> <C-o>:echo 'INSERT SHIFT + TAB'
nnoremap <Tab><Enter> :echo 'TAB + ENTER'<CR>
inoremap <Tab><Enter> <C-o>:echo 'INSERT TAB + ENTER'
nnoremap <Tab><Space> :echo 'TAB + SPACE'<CR>
" inoremap <Tab><Space> <C-o>:echo 'INSERT TAB + SPACE' " Hinders completion
nnoremap <Space><Tab> :echo 'SPACE + TAB'<CR>
inoremap <Space><Tab> <C-o>:echo 'INSERT SPACE + TAB'
nnoremap <Esc> :nohlsearch<CR>
nnoremap <Leader>? :h index<CR>
nnoremap <Leader>/ :verbose map<CR>

" Find and open file under cursor
nnoremap <C-w>o <c-w>f

" Splits
nnoremap _ :split<CR>
nnoremap <Bar> :vsplit<CR>

" Equal sized panes
nnoremap = <C-w>=
" Maximize pane (tmux zoom)
nnoremap <C-z> <C-w>_ \| <C-w>\|

" TODO: Prevent overriding <C-o> & C-t>
"   - https://stackoverflow.com/q/27588664/difference-between-c-t-and-c-o-in-vim
  " Open Url on this line with the browser \w
  cnoremap <C-o> :call Browser()<CR>
  " tabs - https://gist.github.com/Starefossen/5957088
  " TODO: <C-t> conflicts with :tab pop

" tabs
nnoremap <silent> <C-n> :tabnext<CR>
nnoremap <silent> <C-p> :tabprevious<CR>

" current buffer in new (t)ab
nnoremap <Leader>t <C-w>t
" simulate break pane in TMUX
nnoremap <C-w>t :tab split<CR>
" All buffers into tabs
nnoremap <C-w>T :tabo<CR> :bufdo tab split<CR>

" <CTRL+h> Focus on pane to left
nnoremap <C-h> <C-w>h
" <CTRL+j> Focus on pane down
nnoremap <C-j> <C-w>j
" <CTRL+k> Focus on pane up
nnoremap <C-k> <C-w>k
" <CTRL+l> Focus on pane to right
nnoremap <C-l> <C-w>l

" normal mode: save
nnoremap <C-s> :update<CR> :echo 'Updated'<CR>
" visual mode: escape to normal and update
vnoremap <C-s> :update<CR>
" insert mode: escape to normal and save
inoremap <C-s> <Esc>:write<CR>a

" (Insert) Tab complete
inoremap <Tab> <C-n>

" https://vimhelp.org/terminal.txt.html
if has('terminal')
  set termwinkey=<C-w>
  nnoremap <C-t> :terminal<CR>
endif

" Reload .vimrc configuration
" nnoremap <Leader>R :source ~/.vimrc
cnoremap <C-r> :source ~/.vimrc<CR>

" }}}

" =========================================================================
" {{{ PLUGINS - check loaded with &rtp =~ 'plugin-name'
" =========================================================================

echo 'All Plugins'
" scriptnames " List all loaded plugins

filetype plugin indent on " filetype - https://vimdoc.sourceforge.net/htmldoc/filetype.html

" -------------------------------------------------------------------------
" Startify - https://github.com/mhinz/vim-startify
"   - :h startify
"   - :h startify-faq
" -------------------------------------------------------------------------
autocmd VimDefaults VimEnter * call g:Start()

function! g:Start () abort
  echo 'Calling Startify'
  if &rtp !~ 'startify' | return | endif

  let g:startify_padding_left = 5
  let g:startify_session_sort = 0
  let g:startify_files_number = 20
  let g:startify_session_before_save = []
  let g:startify_session_dir = getcwd()
  let g:startify_session_persistence = 1
  let g:startify_custom_footer = ['😈', 'devPunks😈Studio', '😈']
  let g:startify_custom_header = 'startify#center(startify#fortune#boxed())'
  let g:startify_custom_indices = map(range(1,100), 'string(v:val)') " start from 1
  let g:startify_commands = [
    \ { 't': [ 'Tags', 'call Tag()' ] },
    \ { 'v': [ 'Edit .vimrc', 'tabnew $HOME/.vimrc' ] },
    \ { 'b': [ 'Edit .bashrc', 'tabnew $HOME/.bashrc' ] },
    \ { 'l': [ 'Edit .bash_login', 'tabnew $HOME/.bash_login' ] },
    \ { 's': [ 'LSP (Language Server Protocol)', 'call LSP()' ] },
    \ ]

  let g:startify_lists = [
    \ { 'type': 'commands',  'header': [ 'Commands' ]      },
    \ { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]     },
    \ { 'type': function('s:NerdtreeBookmarks'), 'header': [ 'NERDtree Bookmarks' ] },
    \ { 'type': function('s:gitModified'),  'header': [ 'git modified' ] },
    \ { 'type': 'dir',       'header': [ 'MRU', getcwd() ] },
    \ { 'type': 'files',     'header': [ 'MRU' ]           },
    \ { 'type': 'sessions',  'header': [ 'Sessions' ]      },
    \ ]
endfunction " g:Start

function! s:gitModified() abort
  let l:files = systemlist('git ls-files -m 2>/dev/null')

  echo 'startify gitModified'
  return map( l:files, "{ 'line': v:val, 'path': v:val }")
endfunction " s:gitModified

function! s:NerdtreeBookmarks() abort
  let l:bookmarks = systemlist( "cut -d' ' -f 2- ~/.NERDmarks")
  let l:bookmarks = bookmarks[0:-2] " Slice empty last line

  echo 'startify NERDTreeBookmarks'
  return map( l:bookmarks, "{ 'line': v:val, 'path': v:val }")
endfunction " s:NerdtreeBookmarks

" -------------------------------------------------------------------------
" OverflowMargin - http://blog.ezyang.com/2010/03/vim-textwidth
" -------------------------------------------------------------------------
augroup ViimDefaults
  autocmd VimResized * wincmd = " resize (see equalalways)
  autocmd FocusLost * :w " save on focus lost
augroup END

" (https://vi.stackexchange.com/a/15995)
" autocmd winEnter,BufEnter Double triggers event.
autocmd FileDefaults BufEnter * call OverflowMargin ()

function OverflowMargin () abort
  call clearmatches()

  if ! &tw | return | endif

  " call matchadd('ColorColumn', '\%75v.*')
  call matchadd('ColorColumn', '\%>' . &tw . 'v')
  " https://baeldung.com/linux/vim-ruler-on-specific-column
  let &colorcolumn= ( &tw +1 ) ..",".. ( &tw +2 )
endfunction " OverflowMargin

" -------------------------------------------------------------------------
" Scrollbar - https://github.com/obcat/vim-sclow
" -------------------------------------------------------------------------
" autocmd FileReadPost * call sclow#update()
autocmd VimDefaults BufReadPost * call g:ScrollBar()

function! g:ScrollBar() abort
  if g:loaded_sclow != 1 | return | endif

  echo 'Showing Scrollbar'

  let g:scrollbar_thumb = '⬜'
  let g:sclow_sbar_text = '⬜'
  let g:scrollbar_clear = '🔳'
  let g:sclow_bar_right_offset = -2

  " TODO: Remove
  " SclowDisable
endfunction " g:ScrollBar

" -------------------------------------------------------------------------
" Vim Signature - https://github.com/kshenoy/vim-signature
"   :h mark
"   :h marks
" -------------------------------------------------------------------------
autocmd VimDefaults ColorScheme * call g:Marks()

function! g:Marks() abort
  if ! exists('g:loaded_Signature') | return | endif

  echo 'Marking '..expand('%')

  let g:SignaturePurgeConfirmation = 1
  let g:SignatureDeleteConfirmation = 1

  highlight! link SignatureMarkText CursorLineNr
  highlight! link SignatureMarkLine CursorLineNr
  highlight! link SignatureMarkerText CursorLineNr
  highlight! link SignatureMarkerLine CursorLineNr

  autocmd FileDefaults BufEnter * :SignatureRefresh
endfunction " g:Marks

" -------------------------------------------------------------------------
" Vim (Git) Gutter - https://github.com/airblade/vim-gitgutter
" -------------------------------------------------------------------------
augroup FileDefaults
  autocmd BufReadPost * call g:GitGutter()
  autocmd InsertEnter * call g:GitFocus()
  autocmd InsertLeave * call g:GitBlur()
augroup END

function! g:GitFocus () abort
  if ! has('signs') || ! exists('g:loaded_gitgutter') | return | endif

  highlight! link GitGutterAdd DiffAdd
  highlight! link GitGutterChange DiffChange
  highlight! link GitGutterDelete DiffDelete

  GitGutterLineHighlightsEnable
endfunction " g:GitFocus

function! g:GitBlur () abort
  if ! has('signs') || ! exists('g:loaded_gitgutter') | return | endif

  highlight link GitGutterAdd NONE
  highlight link GitGutterChange NONE
  highlight link GitGutterDelete NONE

  GitGutterLineHighlightsDisable
endfunction " g:GitBlur

function! g:GitDiffs () abort
  let l:files = system('git diff --shortstat')
 :let l:summary = '%#Statement# '

 echo 'Buffer Name:'..bufname('')
  if true | let l:summary ..= printf( '%s', summary ) | endif
  let l:summary ..= '%#Statement# '

  return l:summary
endfunction " g:GitDiffs

function! g:GitChanges () abort
  if ! has('signs') || ! exists('g:loaded_gitgutter') | return | endif

  let [a,m,r] = GitGutterGetHunkSummary()

  let l:summary = '%#Statement# '
  if r > 0 | let l:summary ..= printf( '%%#DiffDelete# ➖%d ', r ) | endif
  if m > 0 | let l:summary ..= printf( '%%#DiffChange# ～%d ', m ) | endif
  if a > 0 | let l:summary ..= printf( '%%#DiffAdd# ➕%d '   , a ) | endif
  let l:summary ..= '%#Statement# '

  return l:summary
endfunction " g:GitChanges

function! g:GitGutter () abort
  if ! has('signs') || ! exists('g:loaded_gitgutter') | return | endif

  echo 'Git Gutter!'

  GitGutterEnable

  nnoremap <silent><buffer> ]h <Plug>(GitGutterNextHunk)
  nnoremap <silent><buffer> [h <Plug>(GitGutterPrevHunk)

  set foldtext=gitgutter#fold#foldtext()

  let g:gitgutter_grep=''
  let g:gitgutter_sign_priority = 1
  let g:gitgutter_sign_allow_clobber = 1
  let g:gitgutter_set_sign_backgrounds = 1

  sign define GitGutterLineAdded text=➕
  sign define GitGutterLineRemoved text=➖
  sign define GitGutterLineModified text=～

  let g:gitgutter_highlight_linenrs = 1
  let g:gitgutter_preview_win_floating = 1
  let g:gitgutter_terminal_reports_focus = 0

  let g:gitgutter_sign_added = 'xx'
  let g:gitgutter_sign_modified = 'yy'
  let g:gitgutter_sign_removed = 'zz'
  let g:gitgutter_sign_removed_first_line = '^^'
  let g:gitgutter_sign_removed_above_and_below = '{'
  let g:gitgutter_sign_modified_removed = 'ww'
endfunction " g:GitGutter

" -------------------------------------------------------------------------
" IndentGuides - https://github.com/preservim/vim-indent-guides
" -------------------------------------------------------------------------
autocmd VimDefaults VimEnter * call g:Indentation()

function! g:Indentation() abort
" if &rtp !~ 'vim-indent-guides' | return | endif

  echo 'Loading indentation guides'
  let g:indent_guides_guide_size = 1
  let g:indent_guides_auto_colors = 0

  autocmd FileDefaults BufLeave *
    \ if &rtp =~ 'vim-indent-guides' | :IndentGuidesEnable | endif
  autocmd FileDefaults BufEnter *
    \ if &rtp =~ 'vim-indent-guides' | :IndentGuidesDisable | endif

  highlight IndentGuidesOdd guifg=darkgrey guibg=NONE ctermfg=darkgrey ctermbg=NONE
  highlight IndentGuidesEven guifg=darkgrey guibg=NONE ctermfg=darkgrey ctermbg=NONE

endfunction " indentation

" -------------------------------------------------------------------------
" Scopes :h cscope
"   - https://stackoverflow.com/q/934233/cscope-or-ctags-why-choose-one-over-the-other
" -------------------------------------------------------------------------
autocmd VimDefaults VimEnter * call g:CScopes ()

function g:CScopes () abort
  let l:cscope = system('type command cscope')[-1]
  echo l:cscope

  if ! filereadable(l:cscope) | return | endif
  echo 'Found cscope path: '..&tags
" let l:tags = expand('$HOME/tags')


" echo 'Setting ctags path: '..&tags
" set omnifunc=ccomplete#Complete " CTags Complete
endfunction " g:CScopes

" -------------------------------------------------------------------------
" Tags :h tags-and-searches
"  :h tag
"  :h tags
"  :h ctags
"  :h tagstack
"  - https://en.m.wikipedia.org/wiki/Ctags
"  - https://github.com/universal-ctags/ctags
"  - https://andrewradev.com/2011/06/08/vim-and-ctags
"  - https://vim.fandom.com/wiki/Browsing_programs_with_tags
"  - https://vimways.org/2018/you-should-be-using-tags-in-vim
" -------------------------------------------------------------------------
set tags= " Unset
let tags = expand( '$HOME/tags' )
if filereadable( tags ) | let &tags=tags | endif
" \ .. ',' .. join( split( globpath('$HOME', '**/tags') ), ',' )
echo 'Current Dir: ' .. getcwd()
echo '(tags) path(s): '.. &tags
" set cpoptions+=d " Start from cwd
" set tags +=./**/tags " cwd tags
echo '(recursive tags) path(s): ' .. &tags

"   - https://stackoverflow.com/q/17783539/tag-navigation-in-vim
" :h tag - <C-]> jump to & push tag
" <C-t> pop tag (:pop)

" autocmd VimDefaults VimEnter * call g:Tags ()
autocmd VimDefaults VimEnter * call g:CTags ()

function g:Tag () abort
  echo 'Current Dir: ' ..getcwd()
  set cpoptions+=d " Start from cwd
  set tags +=./**/tags " cwd tags
  echo '(tags) path(s): '..&tags
endfunction " g:Tag

function g:CTags () abort
  let l:tags = expand('$HOME/tags')

  if ! filereadable(l:tags) | return | endif

  set omnifunc=ccomplete#Complete " CTags Complete
endfunction " g:CTags

" -------------------------------------------------------------------------
" vim-gutentags - https://github.com/ludovicchabant/vim-gutentags
" -------------------------------------------------------------------------
augroup FileDefaults
  autocmd BufReadPost * echo 'Loading gutentags for '..expand('%')
  autocmd BufWritePost * echo 'Saving gutentags for '..expand('%')
augroup END

augroup UserDefaults
  autocmd User GutentagsUpdated  let g:gutentags_updated = 1
  autocmd User GutentagsUpdating let g:gutentags_updated = 0
augroup END

" -------------------------------------------------------------------------
" vim-TagList - https://github.com/yegappan/taglist
" -------------------------------------------------------------------------
autocmd VimDefaults VimEnter * call g:TagList()
autocmd FileDefaults BufReadPost * call g:TagsList ()
autocmd FileDefaults BufWritePost * if exists(':TlistUpdate') | TlistUpdate | endif

function g:TagList () abort
  let g:Tlist_Ctags_Cmd = split( system( 'type ctags' ) )[-1]

  echo 'Setting TagList binary tags path to: ' .. g:Tlist_Ctags_Cmd
endfunction " g:TagList

function g:TagsList () abort
  if ! exists('g:loaded_taglist') | return | endif

  let g:Tlist_Sort_Type = 'name'
  let g:Tlist_Use_SingleClick = 1
  let g:Tlist_Use_Right_Window = 1
  let g:Tlist_Enable_Fold_Column = 0
  let g:Tlist_Show_One_File = 1 " v:true

  echo 'Opening Tags List for ' .. expand('%')
  TlistOpen
  " .foldopen!
  wincmd p " Preview

endfunction " g:TagsList

" -------------------------------------------------------------------------
" TagBar - https://github.com/preservim/tagbar
" -------------------------------------------------------------------------
autocmd VimDefaults VimEnter * call g:TagBar()
autocmd FileDefaults BufReadPost * call g:TagsBar ()

function g:TagBar () abort
  if &rtp !~ 'tagbar' | return | endif

  TagbarSetFoldlevel! 99

  let g:tagbar_left = 1
  let g:tagbar_expand = 1
  let g:tagbar_autoshowtag = 1
  " let g:tagbar_autopreview = 1
  let g:tagbar_singleclick = 1
  let g:tagbar_show_tag_count = 1
  let g:tagbar_show_data_type = 1
  let g:tagbar_help_visibility = 1
  let g:tagbar_show_tag_linenumbers = 1
  let g:tagbar_ichonchars = ['👉', '👇']
  let g:tagbar_visibility_symbols
    \ = { 'public': '👀', 'protected' : '⚠️', 'private' : '🚫' }
  " let g:tagbar_position = 'topleft vertical'
  let g:tagbar_ctags_bin = split( system( 'type ctags' ) )[-1]
  " Max 20% or 25 characters
  let g:tagbar_width = max([25, winwidth(0) / 5])
  echo 'Setting TagBar binary tags path to' .. g:tagbar_ctags_bin

  " Shortcut SHIFT+t
  nnoremap <S-t> :TagbarToggle<CR>
endfunction " g:TagBar

function g:TagsBar () abort
  if &rtp !~ 'tagbar' | return | endif
  if &filetype == 'taglist' | return | endif

  echo 'Opening Tags Bar for '..expand('%')
  TagbarOpen
" wincmd p " Preview

endfunction " g:TagsBar

" autocmd FileDefaults CursorHold * ++nested call g:CursorTag()
nnoremap <Space><Enter> :call g:CursorTag()<CR>
function g:CursorTag () abort
  let l:word = expand('<cword>')

  if empty( l:word ) || &previewwindow | return | endif

  try | exe 'ptag '..word
  catch | return | endtry

  echo 'Cursor Tag <cword>: '..word

" if ! &previewwindow |return | endif
" if has('folding') | .foldopen! | endif
  call search('$', 'b') " previous EOL"
  let word = substitute(word, '\\', '\\\\', '')
  call search('\<\V'..l:word..'\>')

  exe 'match CurSearch "\%' .. line('.') .. 'l\%' .. col('.') .. 'c\k*"'

  wincmd P " Preview
endfunction " g:CursorTag


nnoremap <Leader><Space> :TlistToggle<CR> \| :TagbarToggle<CR>

" -------------------------------------------------------------------------
" Moby Thesaurus - https://www.gutenberg.org/iles/3202/mthesaur.txt
" -------------------------------------------------------------------------
nnoremap <leader>t g:Thesaurus()

autocmd VimDefaults VimEnter * call g:Thesaurus()

function! g:Thesaurus () abort
  let l:path = expand('$HOME/mthesaur.txt')
  if ! filereadable( path ) | return | endif

  " https://github.com/vim/vim/issues/1611
  " https://thesynack.com/posts/vim-thesaurus
  echo 'setting thesaurus to '..path
  set thesaurus=path " https://stackoverflow.com/q/33453468

  let s:saved_ut = &ut
  if &ut > 200 | let &ut = 200 | endif
  augroup ThesaurusAuGroup
    autocmd CursorHold,CursorHoldI <buffer>
      \ let &ut = s:saved_ut |
      \ set iskeyword-=32 |
      \ autocmd! ThesaurusAuGroup
  augroup END
  return ":set iskeyword+=32\<cr>vaWovea\<c-x>\<c-t>"
endfunction " g:Thesaurus

" -------------------------------------------------------------------------
" CtrlP - https://github.com/ctrlpvim/ctrlp.vim
" -------------------------------------------------------------------------
autocmd VimDefaults VimEnter * :Fuzzy

" :h finddir()
" :h findfile()
function! s:find () abort
endfunction " s:find

function! s:fuzzy () abort
  if &rtp !~ 'ctrlp.vim' | return | endif

  echo 'Mapping CtrlP Mixed Mode to f<Enter>'
  let g:ctrlp_map = 'f<Enter>'
  let g:ctrlp_cmd = 'CtrlPMixed'
  let g:ctrlp_extensions = ['mixed']
  nnoremap f<Enter> :CtrlPMixed<CR>

  echo 'Mapping CtrlP Tag Mode to f<Space>'
  nnoremap f<Space> :CtrlPTag<CR>

  let g:ctrlp_regexp = 1 " <C-r>
  let g:ctrlp_by_filename = 1  " <C-d>
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_match_window = 'top,order:ttb,min:3,max:10,results:10'
  let g:ctrlp_root_markers
    \ = ['.git', 'node_modules', 'package.json', 'Gemfile', '.bashrc' ]

  let g:buftag_ctags_bin = split( system( 'type ctags' ) )[-1]
  echo 'Setting CtrlP binary tags path to: ' .. g:buftag_ctags_bin

  let g:ctrlp_extensions += ['tag', 'buffertag']

  let g:ctrlp_buftag_types = {
    \ 'erlang' :
      \ '--language-force=erlang --erlang-types=drmf',
    \ 'javascript' : {
      \ 'bin': 'jsctags',
      \ 'args': '-f - ',
    \ },
  \ }

  echo 'CtrlP tag extensions:'
  echo g:ctrlp_extensions

  echo 'CtrlP tag types:'
  echo string( g:ctrlp_buftag_types )

  if &rtp !~ 'vim-ctrlp-tjump' | return | endif
  echo 'CtrlP Mapping <C-]> (tjump) tag'
  nnoremap <C-]> :CtrlPtjump<CR>
  vnoremap <C-]> :CtrlPtjumpVisual<CR>

endfunction " s:fuzzy
command! Fuzzy call s:fuzzy()

" -------------------------------------------------------------------------
" Supertab - https://github.com/ervandew/supertab
" -------------------------------------------------------------------------
" (normal) [TAB] Next/Previous Tab
autocmd VimDefaults VimEnter * call g:SuperTab()
autocmd UserDefaults CursorHoldI * :Tab

function! g:SuperTab () abort
  if &rtp !~ 'supertab' | return | endif

  echo 'Mapping SuperTab insert mode to <Tab> & <S-Tab>'
  inoremap <Tab> <c-o>:echo 'SuperTAB Complete'<CR>
  inoremap <S-Tab> <c-o>:echo 'SHIFT + SuperTAB Complete'<CR>

  let g:SuperTabDefaultCompletionType = 'context'
  " fallback to SuperTabContextDefaultCompletionType = <C-p>
  call SuperTabSetDefaultCompletionType( g:SuperTabDefaultCompletionType )
  echo 'SuperTab default completion type (completefunc|omnifunc): '
    \ .. g:SuperTabDefaultCompletionType
  echo 'SuperTab secondary completion type:'
  ' \ ..g:SuperTabContextDefaultCompletionType

endfunction " g:SuperTab

function! s:tab () abort
if &rtp !~ 'supertab' | return | endif

  echo 'Tabbing ( Not Yet Implemented. See :Tab command )'
endfunction " s:tab
command! Tab call s:tab()

" -------------------------------------------------------------------------
" Mμ Complete - https://github.com/lifepillar/vim-mucomplete
" -------------------------------------------------------------------------
autocmd VimDefaults VimEnter * call Search()

function! g:Search () abort
  if &rtp !~ 'vim-mucomplete' | return | endif

  " set complete-=t " no tags
  set complete-=i " no includes

  let chain = [ 'omni','path','c-n', 'uspl' ]
  let default = [ 'list', 'omni', 'cmd', 'file', 'path', 'c-n', 'dict', 'keyn', 'keyp', 'uspl' ]

  let g:mucomplete#completion_delay = 1
  let g:mucomplete#enable_auto_at_startup = 1
  let g:mucomplete#wordlist = { '' : [ 'devpunks', 'snuggsi' ] } " list

  let g:mucomplete#chains = {}
  let g:mucomplete#chains['html'] = chain
  let g:mucomplete#chains['css'] = g:mucomplete#chains['html']
  let g:mucomplete#chains['default'] = { 'default' : default }
endfunction " g:Search

" -------------------------------------------------------------------------
" Ultisnips - https://github.com/SirVer/ultisnips
" -------------------------------------------------------------------------
autocmd VimDefaults VimEnter * call g:Snippets ()

function g:Snippets () abort
  if &rtp !~ 'ultisnips' | return | endif

  echo 'Ultisnippets Initialization'

  " let g:UltiSnipsEditSplit = 'vertical'
  let g:UltiSnipsAutoTrigger = 0
  let g:UltiSnipsNoPythonWarning = 1
  let g:UltiSnipsListSnippets = '<S-Tab>'
  let g:UltiSnipsExpandTrigger = '<S-Tab>'
  let g:UltiSnipsJumpForwardTrigger = '<c-n>'
  let g:UltiSnipsJumpBackwardTrigger = '<c-p>'
  let g:UltiSnipsJumpOrExpandTrigger = '<S-Tab>'
endfunction " g:Snippets

" -------------------------------------------------------------------------
" ZoomWin
" -------------------------------------------------------------------------
nnoremap <Enter> :call g:ZoomDrawer()<CR>

function! g:ZoomDrawer () abort
  if ! exists('*ZoomWin') | return | endif

  let l:open = g:NERDTree.IsOpen()
  " TODO: Use tagbar#IsOpen()
  let l:tagbar_open = bufwinnr( t:tagbar_buf_name) != -1
  NERDTreeClose
  TagbarClose
  ZoomWin
  " Open Drawer & focus on `p`revious buffer
  if ( l:open ) | NERDTree | wincmd p | endif
  "  if ( l:tagbar_open ) | TagbarOpen | wincmd p | endif
endfunction " g:ZoomDrawer

" -------------------------------------------------------------------------
" NETRW
" - :help netrw
" - :help netrw-browse-maps
" -------------------------------------------------------------------------
let g:netrw_liststyle=3    " treeview
let g:netrw_banner=0       " disable banner
let g:netrw_browse_split=4 " open prior window
let g:netrw_altv=1         " open splits to the right
"let g:netrw_list_hide=netrw_gitignore#Hide()

" -------------------------------------------------------------------------
" NERDTree - https://github.com/preservim/nerdtree
"   - Shortcuts - https://github.com/preservim/nerdtree/blob/master/doc/NERDTree.txt#L247-L293
" -------------------------------------------------------------------------
autocmd VimDefaults VimEnter * call g:NerdDrawer()

function! g:NerdDrawer () abort
  if ! exists('g:NERDTree') | return | endif

  " [SHIFT]+[TAB] Opens Nerdtree
" nnoremap <S-Tab> :NERDTreeToggle<CR>

  " nerdtree-git-plugin
  let g:NERDTreeGitStatusIndicatorMapCustom = {
        \ 'Untracked' : '🫣',
        \ 'Dirty' : '⚠️',
        \ 'Renamed' : '📑',
        \ 'Deleted' : '❌',
        \ 'Ignored' : '🚫',
        \ 'Unknown' : '❓',
        \ 'Modified' : '📝',
  \ }

  let g:NERDTreeStatusline='TODO: GitDiffs()'
  let g:NERDTreeIgnore=['\.sock$', 'my-pipe'] " ignored files
  let g:NERDTreeFileLines=1 " LOC number in files
  let g:NERDTreeShowHidden=1 " Show hidden files (I)
  let g:NERDTreeShowBookmarks=1 " Show Bookmarks (B)
  let g:NERDTreeBookmarksFile='.NERDmarks' " location
  let g:NERDTreeHighlightCursorLine=1 " highlight current line
  let g:NERDTreeDirArrowExpandable  = '📁' " Expandable directory
  let g:NERDTreeDirArrowCollapsible = '📂' " Collapsible directory
  let g:NERDTreeGitStatusConcealBrackets = 0 " 0 - show | 1 = hide

  NERDTree" Open Drawer
  ReadBookmarks " Load Bookmarks
  wincmd p " Focus on `p`revious buffer

  echo 'Setting NERDTree Mapping to <Tab><Enter>'
  nnoremap <Tab><Enter> :NERDTreeToggle<CR>
endfunction " g:NerdDrawer

" -------------------------------------------------------------------------
" Fern - https://github.com/lambdalisue/vim-fern
" -------------------------------------------------------------------------
autocmd VimDefaults VimEnter * call g:Fern()
autocmd FileDefaults FileType fern call g:FernDrawer()

function! g:Fern () abort
  if &rtp !~ 'vim-fern' | return | endif

  " [SHIFT]+[TAB] Opens Fern
" nnoremap <S-Tab> :Fern -drawer -stay .

  let g:fern#mark_symbol = '📌'
  let g:fern#renderer#default#leading = '|'
  let g:fern#renderer#default#root_symbol = '🎯'
  let g:fern#renderer#default#leaf_symbol = '📄'
  let g:fern#renderer#default#expanded_symbol = '📂'
  let g:fern#renderer#default#collapsed_symbol = '📁'

  Fern -drawer -stay .
endfunction " g:Fern

function! g:FernDrawer () abort
  echo 'Fern Drawer'
  setlocal nonumber
  setlocal splitright

  nnoremap <buffer> <Esc> :bw
  " Custom <Plug>in command
  nnoremap <Plug>(fern-close-drawer) :<C-u>FernDo close -drawer -stay<CR>

  nnoremap <buffer> q :FernDo close -drawer -stay

  " Jump to top directory
  nnoremap <buffer> P gg
  nnoremap <buffer> I <Plug>(fern-action-hidden-toggle)

  noremap <buffer> <C-l> <C-w>l
  noremap <buffer> <C-h> <C-w>h

  " mappings
  nnoremap <buffer> x <Plug>(fern-action-collapse)
  " nnoremap <buffer> o <Plug>(fern-action-open:edit)
  nnoremap <buffer> o <Plug>(fern-action-open:right)
  nnoremap <buffer> go <Plug>(fern-action-open:edit)<C-w>p
  nnoremap <buffer> t <Plug>(fern-action-open:tabedit)
  nnoremap <buffer> T <Plug>(fern-action-open:tabedit)gT
  nnoremap <buffer> i <Plug>(fern-action-open:split)
  nnoremap <buffer> gi <Plug>(fern-action-open:split) | wincmd p
  nnoremap <buffer> s <Plug>(fern-action-open:vsplit)
  nnoremap <buffer> si <Plug>(fern-action-open:vsplit)<C-w>p

  nnoremap <buffer> ma <Plug>(fern-action-new-path)
  nnoremap <buffer> C <Plug>(fern-action-enter)
  nnoremap <buffer> u <Plug>(fern-action-leave)
  nnoremap <buffer> r <Plug>(fern-action-reload)
  nnoremap <buffer> R gg<Plug>(fern-action-reload)
  nnoremap <buffer> cd <Plug>(fern-action-cd)
  nnoremap <buffer> CD gg<Plug>(fern-action-cd)<C-o>
endfunction " g:FernDrawer

" -------------------------------------------------------------------------
" Closetag - https://github.com/alvan/vim-closetag
" -------------------------------------------------------------------------
autocmd VimDefaults VimEnter * call s:CloseTags()

function! s:CloseTags () abort
  if ! exists('g:loaded_closetag') | return | endif

  " These are the file types where this plugin is enabled.
  let g:closetag_filetypes = 'svg,html,eruby,*.vue'

  " These are the file extensions where this plugin is enabled.
  let g:closetag_filenames = '*.svg,*.html,*.html.erb,*.vue'

  " This will make the list of non-closing tags self-closing in the specified files.
  "let g:closetag_xhtml_filetypes = 'xhtml,jsx'

  " This will make the list of non-closing tags self-closing in the specified files.
  let g:closetag_xhtml_filenames = '*.vue,*.jsx'

  " This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
  "let g:closetag_emptyTags_caseSensitive = 1
endfunction " s:CloseTags

" -------------------------------------------------------------------------
" Asyncomplete Emoji - https://github.com/prabirshrestha/asyncomplete-emoji.vim
" -------------------------------------------------------------------------
" autocmd VimDefaults asyncomplete_setup * call g:AsyncompleteEmoji()
autocmd VimDefaults VimEnter * call g:AsyncompleteEmoji()

function g:AsyncompleteEmoji () abort
  if &rtp !~ 'asyncomplete-emoji' | return | endif

  echo 'Loading asyncomplete-emoji'

  call asyncomplete#register_source(asyncomplete#sources#emoji#get_source_options({
    \ 'name': 'emoji',
    \ 'allowlist': ['*'],
    \ 'completor': function('asyncomplete#sources#emoji#completor'),
    \ }))
endfunction " g:AsyncompleteEmoji

" -------------------------------------------------------------------------
" Asyncomplete Buffer - https://github.com/prabirshrestha/asyncomplete-buffer.vim
" -------------------------------------------------------------------------
autocmd VimDefaults VimEnter * call g:AsyncompleteBuffer()

function g:AsyncompleteBuffer () abort
  if &rtp !~ 'asyncomplete-buffer' | return | endif

  echo 'Loading asyncomplete-buffer'

  call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'blocklist': [],
    \ 'allowlist': ['*'],
    \ 'config': { 'max_buffer_size': -1, },
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ }))
endfunction " g:AsyncompleteBuffer

" -------------------------------------------------------------------------
" Asyncomplete File - https://github.com/prabirshrestha/asyncomplete-file.vim
" -------------------------------------------------------------------------
autocmd VimDefaults VimEnter * call g:AsyncompleteFile()
" autocmd User asyncomplete_setup * call g:AsyncompleteFile()

function g:AsyncompleteFile () abort
  if &rtp !~ 'asyncomplete-file' | return | endif

  echo 'Loading asyncomplete-file'

  call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'priority': 10,
    \ 'allowlist': ['*'],
    \ 'completor': function('asyncomplete#sources#file#completor'),
    \ }))
endfunction " g:AsyncompleteFile

" -------------------------------------------------------------------------
" Asyncomplete Tags - https://github.com/prabirshrestha/asyncomplete-tags.vim
" -------------------------------------------------------------------------
autocmd VimDefaults VimEnter * call g:AsyncompleteTags()

function g:AsyncompleteTags () abort
  if &rtp !~ 'asyncomplete-tags' | return | endif

  echo 'Loading asyncomplete-tags'

  call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
    \ 'name': 'tags',
    \ 'allowlist': ['*'],
    \ 'config': { 'max_file_size': -1, },
    \ 'completor': function('asyncomplete#sources#tags#completor'),
    \ }))
endfunction " g:AsyncompleteTags

" -------------------------------------------------------------------------
" Asyncomplete Ultisnips - https://github.com/prabirshrestha/asyncomplete-ultisnips.vim
" -------------------------------------------------------------------------
autocmd VimDefaults VimEnter * call g:AsyncompleteUltisnips()

function g:AsyncompleteUltisnips () abort
  if &rtp !~ 'asyncomplete-ultisnips' | return | endif

  echo 'Loading asyncomplete-ultisnips'

  call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
    \ 'name': 'ultisnips',
    \ 'allowlist': ['*'],
    \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
    \ }))
endfunction " g:AsyncompleteUltisnips

" -------------------------------------------------------------------------
" Vim LSP - https://github.com/prabirshrestha/vim-lsp
" -------------------------------------------------------------------------
autocmd VimDefaults VimEnter * call g:LSP()
augroup UserDefaults
  autocmd User lsp_float_opened nmap <buffer><silent>
    \ <C-c> <Plug>(lsp-preview-closed)
  autocmd User lsp_float_closed nunmap <buffer> <C-c>
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
autocmd FileDefaults BufReadPost * echo 'Loading vim-lsp-server for '..expand('%')

function g:LSP () abort
  if &rtp !~ 'vim-lsp' | return | endif

  echo 'VIM LSP'
  call lsp#enable()

  let g:lsp_preview_float = 1
  let g:lsp_use_native_client = 1
  let g:lsp_preview_autoclose = 1

  let g:lsp_signature_help_delay = 100
  let g:lsp_tree_incoming_prefix = '⬅'
  let g:lsp_diagnostics_signs_delay = 100
  let g:lsp_diagnostics_signs_priority = 11 " 10 other plugins
  let g:lsp_diagnostics_virtual_text_delay = 300
  let g:lsp_diagnostics_virtual_text_align = 'right'
  let g:lsp_diagnostics_signs_hint = {'text': '💡' }
  let g:lsp_diagnostics_signs_error = {'text': '❌' }
  let g:lsp_diagnostics_signs_warning = {'text': '⚠️' }
  let g:lsp_diagnostics_signs_information = {'text': 'ℹ️' }
  let g:lsp_document_code_action_signs_delay = 300
  let g:lsp_document_code_action_signs_hint = {'text': '🚀' }

  " if executable('bash-language-server')
    autocmd User lsp_setup call lsp#register_server({
    \ 'allowlist': ['sh', 'bash'],
    \ 'name': 'bash-language-server',
    \ 'cmd': {server_info->['bash-language-server', 'start']},
    \ })
  " endif

  " https://github.com/rhysd/vim-healthcheck
  CheckHealth

  LspStatus
  LspStopServer
  call lsp#disable() " TODO: REMOVE"

endfunction " g:LSP

function! s:on_lsp_buffer_enabled() abort
  echo 'LSP Buffer Enabled'
  if exists('+tagfunc') | setlocal tagfunc=lsp#tag#tagfunc | endif

  setlocal omnifunc=lsp#complete

  let g:lsp_diagnostics_enabled = 1 " in lieu of ALE
  let g:lsp_format_sync_timeout = 1000

  nmap <buffer> K  <Plug>(lsp-hover)
  nmap <buffer> gd <Plug>(lsp-definition)
  nmap <buffer> gr <Plug>(lsp-references)
  nmap <buffer> gi <Plug>(lsp-implementation)
  nmap <buffer> gt <Plug>(lsp-type-definition)
  nmap <buffer> gs <Plug>(lsp-document-symbol-search)
  nmap <buffer> gS <Plug>(lsp-workspace-symbol-search)
  nmap <buffer> <leader>rn <Plug>(lsp-rename)
  nnoremap <buffer> <expr><C-d> lsp#scroll(-4)
  nnoremap <buffer> <expr><C-f> lsp#scroll(+4)
  nmap <buffer> g] <Plug>(lsp-next-diagnostic)
  nmap <buffer> [g <Plug>(lsp-previous-diagnostic)

endfunction " s:on_lsp_buffer_enabled

" -------------------------------------------------------------------------
" Vim LSP Settings - https://github.com/mattn/vim-lsp-settings
" -------------------------------------------------------------------------
autocmd VimDefaults VimEnter * call g:LSPSettings()

function g:LSPSettings () abort
  if &rtp !~ 'vim-lsp-settings' | return | endif

  echo 'VIM LSP Settings'

  let g:lsp_settings_servers_dir  = expand('$HOME/.vim/servers')
  let g:lsp_settings_root_markers = [
    \ '.git',
    \ 'Gemfile',
    \ 'package.json',
    \ 'node_modules/',
  \]
endfunction " g:LSPSettings

" -------------------------------------------------------------------------
" CoC.vim - https://github.com/neoclide/coc.nvim
" -------------------------------------------------------------------------

" -------------------------------------------------------------------------
" Ale - https://github.com/dense-analysis/ale
" -------------------------------------------------------------------------
autocmd VimDefaults VimEnter * call g:Lint()
augroup UserDefaults
  autocmd User AleFixPre echo 'ALE - Disable Syntax'
  autocmd User AleFixPost echo 'ALE - Enable Syntax'
augroup END

function g:Lint () abort
  if &rtp !~ 'ale' | return | endif

  echo 'Setting up Ale'

  let g:ale_linters = {
  \ 'sh': ['language_server'],
  \ }
  let g:ale_fixers = {
    \ 'json': ['jq'],
    \ 'ruby': ['rubocop'],
    \ 'python': ['flake8'],
    \ '*': [ 'remove_trailing_lines', 'trim_whitespace' ],
  }

endfunction " g:Lint

" -------------------------------------------------------------------------
" Vim-test - https://github.com/vim-test/vim-test
" -------------------------------------------------------------------------

" }}}

" =========================================================================
" {{{ TYPOGRAPHY.VIMRC
" =========================================================================
if $TERM =~ '256color'
  " WARNING: ^[ must be entered as <c-v><c-[>
  echo '$TERM is set to 256color'
  let &t_so = '[7m' " smso (standout)
  let &t_ZH = '[3m' " sitm (enable italics)
  let &t_ZR = '[0m' " ritm (disable italics)
endif

syntax on " turns syntax highlighting on
set spell " Enable spellchecking - https://vimtricks.com/p/vim-spell-check/

" - Line Length -----------------------------------------------------------
set wrap " word
set linebreak " Avoid mid-word line wrapping
set showbreak=⥹ " Character used for wrapped line
set wrapmargin=0 " Newline insert based on terminal width (0 = disabled)
set textwidth=75 " before wrap https://vimtricks.com/p/vim-line-length-marker
set synmaxcol=256 " Prevent slow loading https://github.com/tpope/vim-sensible/issues/142

" - Whitespace ------------------------------------------------------------
let s:TABSIZE=2
set expandtab "turn tabs into (tabstop) spaces
set shiftround " Rounds the indent spacing to the next multiple of shiftwidth
let &tabstop=s:TABSIZE "set tab character to 2 characters
let &shiftwidth=s:TABSIZE " Shift-indent size - http://vimcasts.org/episodes/tabs-and-spaces
let &softtabstop=s:TABSIZE " https://vi.stackexchange.com/q/4244

retab! " (Force!) update tab format

set list " show hidden characters & replacement characters
set listchars=tab:▣□▢,extends:⇨,precedes:⇦,leadmultispace:\|\ \|\ ,multispace:\.,lead:·,space:╵,nbsp:■,trail:■,eol:↴

set sidescroll=10 " scroll amount when a word is outside of view
" https://vim.fandom.com/wiki/Keep_your_cursor_centered_vertically_on_the_screen
set scrolloff=999 " Line jump scrolling offset (999=centered)
set display=lastline " Show Special chars for long last line

" (NORMAL/VISUAL MODE)
set whichwrap=h,l " 'h' & 'l' wrap EOL & BOL
set whichwrap+=b,s " (b)ackspace & (s)pace wrap EOL & BOL
set whichwrap+=<,> " < left and right > arrow wrap to prev. and next line
" (INSERT/REPLACE MODE)
set whichwrap+=[,] " [ left and right ] arrow wrap to prev. and next line
set backspace=indent,eol,nostop " Insert mode <BS> deletion

"}}}

" =========================================================================
" {{{ COLORSCHEME
"  - ./vim/colors/default.vim
"  - ./vim/colors/devpunks.vim
"  * can use hexidecimal values for gui (e.g. guibg=#000000)
"  * term modes (NONE,(s)tandout,(r)everse,(i)talic,(b)old, (u)nderline, under(c)url)
"
"  - https://jonasjacek.github.io/colors
"  - http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
"  - http://bjornenki.com/blog/gvim-colorscheme/bjornenki-colorscheme.vim
"  - Overrides - https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
"  - https://vi.stackexchange.com/q/8751/how-to-completely-turn-off-colorscheme
"hi Example guifg=NONE guibg=#ff0000 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
" =========================================================================
set t_Co=256 " enable 256 colors
set background=dark " [dark|light]
set termguicolors " 24bit gui(fg|bg)

if filereadable(expand('$HOME/.vim/colors/devpunks.vim'))
  try | colorscheme devpunks
    catch | colorscheme default
  endtry
endif

" :help xterm-true-color
" TODO: determine xterm-true-color escapes
" https://groups.google.com/g/vim_dev/c/wsC205JQpDo
"let &t_8f = '[38:2:%lu:%lu:%lum'
"let &t_8b = '[48:2:%lu:%lu:%lum'

" Interactive Status -----------------------------
echo 'Setting StatusLine Color'
augroup Status
  autocmd InsertLeave * highlight! StatusLineNC term=NONE,bold cterm=NONE,bold gui=NONE,bold
  autocmd InsertLeave * highlight! StatusLine term=reverse,bold cterm=reverse,bold gui=reverse,bold
  autocmd InsertEnter * highlight! StatusLineNC term=NONE,bold cterm=NONE,bold gui=NONE,bold
  autocmd InsertEnter * highlight! StatusLine term=bold,italic,reverse cterm=bold,italic,reverse gui=bold,italic,reverse
augroup END

" }}}

" =========================================================================
" {{{ CONCEAL.VIM
" =========================================================================
set conceallevel=2

syntax match Conceal /U\+/ conceal cchar=⊎
syntax match Conceal /=/ conceal cchar=≝
syntax match Conceal /!/ conceal cchar=¬
syntax match Conceal '(' conceal cchar=（
syntax match Conceal ')' conceal cchar=）
syntax match Conceal '\]' conceal cchar=］ "〛
syntax match Conceal '\[' conceal cchar=［ "〚
syntax match Conceal '{' conceal cchar=⦃
syntax match Conceal '}' conceal cchar=⦄
syntax match Conceal /->/ conceal cchar=→
syntax match Conceal /++/ conceal cchar=➕
syntax match Conceal /--/ conceal cchar=➖
syntax match Conceal /==/ conceal cchar=⩵
syntax match Conceal /===/ conceal cchar=⩶
syntax match Conceal /!=/ conceal cchar=≠
syntax match Conceal /\/=/ conceal cchar=≠
syntax match Conceal /<=/ conceal cchar=≤
syntax match Conceal /=>/ conceal cchar=≥
syntax match Conceal />>/ conceal cchar=⨠ 
syntax match Conceal /<</ conceal cchar=≪
syntax match Conceal /&&/ conceal cchar=∧
syntax match Conceal /||/ conceal cchar=∨
syntax match Conceal '((' conceal cchar=⦅
syntax match Conceal '))' conceal cchar=⦆
syntax match Conceal '\[\[' conceal cchar=〚
syntax match Conceal '\]\]' conceal cchar=〛
syntax match Conceal /true/ conceal cchar=⊤
syntax match Conceal /false/ conceal cchar=⊥
syntax match Conceal /for/ conceal cchar=∀
syntax match Conceal /in/ conceal cchar=∈
syntax match Conceal "\<not in\>" conceal cchar=∉
syntax match Conceal /assert/ conceal cchar=‼
syntax match Conceal 'BEGIN' conceal cchar=︷
syntax match Conceal 'END' conceal cchar=︸
syntax match Conceal /fn/ conceal cchar=𝑓
syntax match Conceal /def/ conceal cchar=𝑓
syntax match Conceal /function/ conceal cchar=𝑓
syntax match Conceal /lambda/ conceal cchar=λ
syntax match Conceal /import/ conceal cchar=⬅
syntax match Conceal '@import' conceal cchar=⬅

syntax match Conceal /bool/ conceal cchar=𝔹
syntax match Conceal /char/ conceal cchar=∁
syntax match Conceal /string/ conceal cchar=𝐒
syntax match Conceal /unsigned/ conceal cchar=ℕ
syntax match Conceal /int/ conceal cchar=ℤ
syntax match Conceal /float/ conceal cchar=ℝ
syntax match Conceal /complex/ conceal cchar=ℂ
syntax match Conceal /vector/ conceal cchar=V
syntax match Conceal /tensor/ conceal cchar=𝕋

syntax match Conceal /of/ conceal cchar=⊂
syntax match Conceal /in/ conceal cchar=⊆
syntax match Conceal /from/ conceal cchar=⫁
syntax match Conceal /for/ conceal cchar=∈
syntax match Conceal /foreach/ conceal cchar=∈
syntax match Conceal /do/ conceal cchar=🔁
syntax match Conceal /loop/ conceal cchar=🔄
syntax match Conceal /while/ conceal cchar=🔁
syntax match Conceal /continue/ conceal cchar=↻
syntax match Conceal /if/ conceal cchar=▸
syntax match Conceal /elif/ conceal cchar=▹
syntax match Conceal /else/ conceal cchar=▪
syntax match Conceal /endif/ conceal cchar=◂
syntax match Conceal /break/ conceal cchar=◁
syntax match Conceal /return/ conceal cchar=◀
syntax match Conceal /class/ conceal cchar=§
syntax match Conceal /unsafe/ conceal cchar=☡
syntax match Conceal /struct/ conceal cchar=∏
syntax match Conceal /enum/ conceal cchar=∐

syntax match Conceal /exists/ conceal cchar=∃
syntax match Conceal /pow/ conceal cchar=⌃
syntax match Conceal /sum/ conceal cchar=∑
syntax match Conceal /all/ conceal cchar=∀
syntax match Conceal /any/ conceal cchar=∃
syntax match Conceal /union/ conceal cchar=⨄
syntax match Conceal /sqrt/ conceal cchar=√
syntax match Conceal "\<\%(math\.\)\?sqrt\>" conceal cchar=√
syntax match Conceal /pi/ conceal cchar=π
syntax match Conceal "\<\%(math\.\)\?pi\>" conceal cchar=π
syntax match Conceal "\<\%(math\.\|\)ceil\>" conceal cchar=⌈
syntax match Conceal "\<\%(math\.\|\)floor\>" conceal cchar=⌊

" }}}

" vim: foldmethod=marker
