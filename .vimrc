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
" Screencasts: http://vimcasts.org
" Cheatsheets:
"   - https://vim.rtorr.com/
"   - https://devhints.io/vimscript
" TERM - https://vimhelp.org/term.txt.html
" Popups - https://vimhelp.org/popup.txt.html
" Tutorial - http://learnvimscriptthehardway.stevelosh.com
" Idiomatic .vimrc - https://github.com/romainl/idiomatic-vimrc
" VIM9 Script - https://vimhelp.org/vim9.txt.html#Vim9-script
" CLICKING LINE NUMBERS
"  - https://www.reddit.com/r/vim/comments/86pjx4/does_vim_currently_have_a_way_to_handle_clicks_on/

" =========================================================================
set encoding=utf-8
set emoji

if ! exists('g:pluginname_setting')
  unlet! skip_defaults_vim
  let g:skip_defaults_vim=0
  source $VIMRUNTIME/defaults.vim
endif

set mouse=a " Enable mouse use in all modes
if has('mouse_sgr')
  " Must be one of: sgr, xterm, xterm2, netterm, dec, jsbterm, pterm
  " Set this to the name of your terminal that supports mouse codes.
  set ttymouse=sgr
else
  set ttymouse=xterm2
endif

execute 'set <FocusLost>=\<Esc>[O'
execute 'set <FocusGained>=\<Esc>[I'
" xterm-focus-event tracking - https://github.com/vim/vim/issues/9296
let &t_fe = '\<Esc>[?1004h' " enable focus-event tracking
let &t_fd = '\<Esc>[?1004l' " disable focus-event tracking
" https://groups.google.com/g/vim_use/c/VyQSx90uaPE

" NOTES -------------------------------------------------------------------
"  - https://superuser.com/questions/935574/get-rid-of-null-character-in-vim-variable
"  - https://til.hashrocket.com/posts/qll3kizlzj-check-that-an-executable-exists-on-the-path
"  - Test executables - https://renenyffenegger.ch/notes/development/vim/script/vimscript/functions/executable
let version_termux = $TERMUX_VERSION
let version_tmux   = system('echo -n $(tmux -V)')
let version_bash   = system('echo -n $BASH_VERSION')

echom "VIM: ".v:version
echom "BASH: ".version_bash
if exists( '$TMUX' )
  echom "TMUX: ".version_tmux
endif
if executable( 'termux-info' )
  echom "TERMUX: ".version_termux
endif

" =========================================================================
" {{{ Settings
" =========================================================================
" - https://gist.github.com/romainl/7e2b425a1706cd85f04a0bd8b3898805
" - https://stackoverflow.com/questions/2288756/how-to-set-working-current-directory-in-vim
" set path+=$PWD/** " slowwwwwwwwwwwwwwwwwwwwwwww
syntax on " turns syntax highlighting on
set synmaxcol=256 " https://github.com/tpope/vim-sensible/issues/142
set selection=exclusive " No EOL CR/LF - https://vi.stackexchange.com/questions/1260

" https://vim.fandom.com/wiki/Folding
set foldenable
set foldcolumn=2
set foldclose=all
set foldmethod=indent " [manual|indent|expr|marker|syntax|diff]

" https://stackoverflow.com/questions/5845557
if &compatible | set nocompatible | endif

set spell " Enable spellchecking - https://vimtricks.com/p/vim-spell-check/
set showcmd " show current command prompt suffix
set modeline " https://vim.fandom.com/wiki/Modeline_magic
set modelines=1 " Head & tail mode lines (:help modeline)
set cmdheight=2 " sets the :ex command prompt line height
set showcmdloc=statusline " Add current command to status

" increment formats - https://vimtricks.com/p/vimtrick-increment-numbers/
set nrformats+=alpha
set nrformats-=octal

set wrapscan " Search respects wrapping
set hlsearch " result highlight grouping
set incsearch " highlight search matches
set smartcase " Capitalization case-sensitive search
" Problematic for conditionals "A"=="a"
" https://vi.stackexchange.com/questions/11236
" https://learnvimscriptthehardway.stevelosh.com/chapters/22.html
" set ignorecase " Case in-sensitive search
set tagcase=followscs " Follow smartcase & ignorecase

set visualbell " Set the window bell to flash
set errorbells " Unset display beep on errors
set belloff+=wildmode " Turn off insert completion bell
let &t_vb = '\<C-G>\e|50f' " Set termcap(ability) for visual bell

set showmatch " jump to matching brace
set matchtime=6 "in 1/10ths of second"

" Buffers -----------------------------------------------------------------
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

" Views, Sessions, Viminfo ------------------------------------------------
"   - https://vimtricks.com/p/saving-session-state/
"   - https://learnvim.irian.to/basics/views_sessions_viminfo
" disable sessions
set viewoptions-=options
set viewoptions+=localoptions
set viewdir=$HOME/.vim/view

set sessionoptions-=options
set sessionoptions+=resize,winpos

set viminfo="NONE" " disable .viminfo
set viminfofile=$HOME/.vim/.viminfo
" autocmd VimLeave * call delete('~/.viminfo')

" Backups -----------------------------------------------------------------
"   - https://groups.google.com/g/vim_use/c/K2Utwkh5f30?pli=1
"   - https://alvinalexander.com/linux-unix/vi-vim-swap-backup-tilde-temporary-files-directory-move/
set backup " keep a backup file (nobackup for inverse)
" Undo location
" set nobackup
" set nowritebackup
" set noswapfile
" set noundofile

set tags+=./tag,tag
" https://github.com/vim/vim/issues/1611
set thesaurus= " https://stackoverflow.com/questions/33453468
set undodir=$TMPDIR " undo location
set directory=$TMPDIR " swap location
set backupdir=$TMPDIR " backup location

" Cursor ------------------------------------------------------------------
set ttyfast " Send more characters for redraws
set timeout " on mappings
set ttimeout " on keycodes
set ttimeoutlen=1 " mappings
set timeoutlen=3000 " keykodes
set ttyscroll=3 " number of characters for redraws
set lazyredraw " Prevent macro script execution update

set cursorline " highlight current cursor line
set cursorcolumn " highlight current cursor column
set nostartofline " respect cursor column position
set cursorlineopt=both " [number,line,both,screenline]

" https://stackoverflow.com/questions/6488683
" reset cursor escapes
let &t_EI = ''
let &t_SI = ''
let &t_SR = ''
" let &t_EI = '\e[2;0;0 q' " Normal mode block cursor
" let &t_SI = '\e[5;0;0 q' " Insert mode bar cursor
" let &t_SR = '\e[3;0;0 q' " Replace mode underline cursor

" let &t_SI ='\e[5 q' "SI = INSERT mode
" let &t_SR ='\e[3 q' "SR = REPLACE mode
" let &t_EI ='\e[2 q' "EI = NORMAL mode (ELSE)

" printf '\033]12;red\033\\'

" let &t_SI = "\]12;yellow\x7"
" let &t_SR = "\]12;red\x7"
" let &t_EI = "\]12;blue\x7"
" 
" use an orange cursor in insert mode
" INSERT = red cursor
let &t_SI = "\e]12;red\x7"
" NORMAL = green cursor
let &t_EI = "\e]12;green\x7"
" REPLACE = blue cursor
let &t_SR = "\e]12;blue\x7"
" !echo -ne "\033]12;red\007"
" reset cursor when vim exits
" autocmd VimLeave * silent !echo -ne "\033]112\007"
" use \003]12;gray\007 for gnome-terminal

if has('gui_running')
  set guioptions=egmrt " remove ugly toolbar :-)
  " https://vim.fandom.com/wiki/Configuring_the_cursor
  set guicursor=i:blinkwait90
  set guicursor+=i:ver100-iCursor
  set guicursor+=n-v-c:blinkwait10
  set guicursor+=n-v-c:block-Cursor
endif

" Chrome ------------------------------------------------------------------
" tabs
set tabline=%!TabLine()
set showtabline=2 " :help setting-tabline
" shell window
set title " Turn on title
set titlestring="VIM TITLE %<%F%=%l/%L-%P"  " Title String format

" Menus -------------------------------------------------------------------
" - http://vim.wikia.com/wiki/Great_wildmode/wildmenu_and_console_mouse
" - https://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
set wildmenu
set infercase
set wildchar=<Tab>
set wildoptions=pum
set wildcharm=<C-Z> " macros
set wildmode=list:longest,full
set wildignore+=*.DS_STORE,.git/**,.npm/**,.ssh/**,.cache/** " etc.

" Completion / LSPs -------------------------------------------------------
" https://github.com/neoclide/coc.nvim
" https://github.com/jayli/vim-easycomplete
" https://github.com/prabirshrestha/vim-lsp
" https://linuxhandbook.com/vim-auto-complete
" https://vim.fandom.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions
set complete=.,w,b,u,i " -t - https://www.mail-archive.com/vim@vim.org/msg03963.html
set completepopup+=align:item,border:on
set completeopt+=menu,menuone,noinsert,popup

" Clipboard Registers -----------------------------------------------------
"   - https://stackoverflow.com/questions/11489428
"   - https://github.com/termux/termux-packages/issues/2308
"   - https://vimtricks.com/p/vimtrick-the-clipboard-register/
"   - https://www.reddit.com/r/termux/comments/c17rwf/how_to_paste_to_vim_from_external_clipboard/
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
  echom 'SHAZAAAM FOUND CLIPBOARD'
  " vnoremap <C-x> :!termux-clipboard-set<CR>
  " vnoremap <C-c> :w !termux-clipboard-set<CR><CR>
  " inoremap <C-v> <ESC>:read !termux-clipboard-get<CR>i
else
  echom 'Termux clipboard not found'
endif

" }}}

" =========================================================================
" {{{ STATUS
" Word Count
"   - g<C-g> - https://vimtricks.com/p/count-words-and-lines/
"   - Status line - https://cromwell-intl.com/open-source/vim-word-count.html
" =========================================================================
set showmode " in status Vi (not Vim)
set shortmess= " Verbose command messaging
set laststatus=2 " Always show status line
if has('win32') | set shortname=on | end

" https://vi.stackexchange.com/a/27508
set ruler " set cursor coordinates
set rulerformat=📏%P⏬%l⏩%c%V " overridden by statusline

set statusline=%#Statement#\  " initialize

" buffer number
set statusline+=﹟%n\ 

" mode
set statusline+=%{(mode()=~'^c')?'💲':''} " Command
set statusline+=%{(mode()=~'^i')?'📝':''} " Insert
set statusline+=%{(mode()=~'^n')?'📄':''} " Normal
set statusline+=%{(mode()=~'^R')?'📃':''} " Replace
set statusline+=%{(mode()=~'^v')?'🔍':''} " Visual
set statusline+=%{(mode()=~'^V')?'🔎':''} " Visual Line
" https://stackoverflow.com/a/75030219
" https://stackoverflow.com/questions/1176904
" https://stackoverflow.com/questions/29426372
set statusline+=%{(mode()=~'^[[:cntrl:]]')?'🔎':''} " Visual Block ()
" full file name
set statusline+=%-4.15F
" flags
set statusline+=\ %r%h%m\ 
" file type
set statusline+=\ 💻%Y
" change to default highlight
set statusline+=\ %#StatusLine#\ 
" percentage
set statusline+=%-7((%p%%)⇳%)
" breakpoint
set statusline+=%<
" cursor line, total lines
set statusline+=%L☰LOC
" cursor column position
set statusline+=\ %5(%4l⇩%)✖%-8.(⇨%-c%-V%)
" align right
set statusline+=%=
" Show Command
set statusline+=\|%-2(%k%)
" Show Control Character Value
set statusline+=\|%-2(%S%)
" Show Cursor Character Values
set statusline+=%-35{CursorCharacter()}
" formatoptions
set statusline+=\ 📜\ %{&fo}
" show colorscheme on statusline
set statusline+=\ 🎨\ %{get(g:,'colors_name','NONE')}\ 

" }}}

" =========================================================================
" {{{ GUTTER
" https://github.com/airblade/vim-gitgutter/commit/8db2fc5
" =========================================================================
set number
set numberwidth=4 " gutter columns

if has('signs') " https://vimdoc.sourceforge.net/htmldoc/sign.html
  " https://github.com/vim/vim/commit/394c5d8870b15150fc91a4c058dc571fd5eaa97e
  set signcolumn=yes " [auto|no|yes|number]
endif

" }}}

" =========================================================================
" {{{ Files
"   - Per type configuration - https://vimtricks.com/p/per-file-type-configs/
"   - autocommands - https://gist.github.com/romainl/6e4c15dfc4885cb4bd64688a71aa7063
" =========================================================================
filetype indent on " filetype - https://vimdoc.sourceforge.net/htmldoc/filetype.html

set autoread " re-read files
set noautowrite " do not autowrite
set noautowriteall " do not autowrite (all)

set smarttab " 'tab' insertion
set autoindent   " auto(matically smart)indent
set copyindent   " copy previous line indentation
set smartindent  " indent based off current line on load
set textwidth=75 " https://vimtricks.com/p/vim-line-length-marker
set wrapmargin=0 " Newline insertion based on terminal width (0 = disabled)

" https://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
set formatoptions=   " reset
set formatoptions+=c " autowrap `c`omments (with leader)
set formatoptions+=j " Delete comment from joining lines
set formatoptions+=l " preserve existing lines
set formatoptions+=n " Format numbered lists
set formatoptions+=o " Preserve comments pressing o/O in Normal mode
set formatoptions+=q " autowrap comments with gq program
set formatoptions+=r " Preserve comment on <Enter>
set formatoptions+=t " autowrap using `t`extwidth
set formatoptions+=/ " do not insert // leader unless after statement unless BOL
set fileformats=unix,dos " sets <LF> (unix) first, then tries <CR><LF> (dos) next
" - Meta-chars ------------------------------------
set fillchars+=fold:↯,foldopen:-,foldclose:+,foldsep:↯
set fillchars+=stl:▲,stlnc:⚊,vert:‖,diff:-,eob:𝕏,lastline:▶

augroup FileDefaults
  autocmd!
  autocmd VimResized * wincmd = " resize
  autocmd FocusLost * :w " save on focus lost
  " (https://vi.stackexchange.com/a/15995)
  " autocmd winEnter,BufEnter Double triggers event.
  autocmd BufEnter * call OverflowMargin ()
augroup END

" http://blog.ezyang.com/2010/03/vim-textwidth
function OverflowMargin () abort
  set colorcolumn=0
  call clearmatches()

  if ! &tw | return | endif

  " call matchadd('ColorColumn', '\%75v.*')
  call matchadd('ColorColumn', '\%>' . &tw . 'v')
  " https://www.baeldung.com/linux/vim-ruler-on-specific-column
  let &colorcolumn= ( &tw +1 )
endfunction

" -------------------------------------------------------------------------
" Markdown
"   - http://vimcasts.org/episodes/hard-wrapping-text/
" -------------------------------------------------------------------------
augroup FileDefaults
  autocmd BufNewFile,BufRead *.md setlocal formatoptions-=t formatoptions+=n
  autocmd BufNewFile,BufRead README setlocal formatoptions-=t formatoptions+=n
augroup END

" -------------------------------------------------------------------------
" HTML
"   - https://vimtricks.com/p/vim-autocomplete-html-tags/
" -------------------------------------------------------------------------
augroup FileDefaults
  autocmd FileType html,eruby setlocal omnifunc=htmlcomplete#CompleteTags
augroup END

" -------------------------------------------------------------------------
" CSS
"   - https://www.simplified.guide/vim/auto-complete-css
" -------------------------------------------------------------------------
augroup FileDefaults
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd BufNewFile,BufRead *.sass,*.scss setlocal filetype=css
augroup END

" -------------------------------------------------------------------------
" Javascript
"   - https://www.simplified.guide/vim/auto-complete-javascript
" -------------------------------------------------------------------------
augroup FileDefaults
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd BufNewFile,BufRead *.json,*.es,*.mjs,*.test setlocal filetype=javascript
augroup END

" -------------------------------------------------------------------------
" Ruby
"   - https://stackoverflow.com/questions/15720313/vim-omnicomplete-with-ruby-only-partially-works/22805517#22805517
" -------------------------------------------------------------------------
augroup FileDefaults
  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  autocmd BufNewFile,BufRead Gemfile setlocal filetype=ruby
  autocmd BufNewFile,BufRead *.erb setlocal filetype=eruby
augroup END

" -------------------------------------------------------------------------
" Python
"   - https://www.simplified.guide/vim/auto-complete-ruby
" -------------------------------------------------------------------------
augroup FileDefaults
  autocmd FileType python setlocal omnifunc=python3complete#Complete
augroup END

" -------------------------------------------------------------------------
" Go
"   - https://www.simplified.guide/vim/auto-complete-ruby
" -------------------------------------------------------------------------
augroup FileDefaults
  autocmd FileType python setlocal omnifunc=syntaxcomplete#Complete
augroup END

" }}}

" =========================================================================
" {{{ typography.vimrc
" =========================================================================
" - Whitespace ------------------------------------
let s:TABSIZE=2

set expandtab "turn tabs into (tabstop) spaces
set shiftround " Rounds the indent spacing to the next multiple of shiftwidth
let &tabstop=s:TABSIZE "set tab character to 2 characters
let &shiftwidth=s:TABSIZE " Shift-indent size - http://vimcasts.org/episodes/tabs-and-spaces
let &softtabstop=s:TABSIZE " https://vi.stackexchange.com/questions/4244

retab! " (Force!) update tab format

set wrap " word
set nopaste " non paste mode - https://vimtricks.com/p/vimtricks-avoid-paste-formatting
set linebreak " Avoid wrapping line in middle of word
set showbreak=⥹ " Character used for wrapped line
set pastetoggle=<leader>p " Allow toggle of (paste) insert indentation

set list " view hidden characters
set listchars=tab:▢\ ,extends:⇨,precedes:⇦,nbsp:·,trail:■,eol:↴ " whitepsace replacement characters

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
"   * can use hexidecimal values for gui (e.g. guibg=#000000)
"   * term modes (NONE,(s)tandout,(r)everse,(i)talic,(b)old, (u)nderline, under(c)url)
"   - ./vim/colors/default.vim
"   - ./vim/colors/devpunks.vim
"
"   - https://jonasjacek.github.io/colors
"   - http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
"   - http://bjornenki.com/blog/gvim-colorscheme/bjornenki-colorscheme.vim
"   - Overrides - https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
"   - https://vi.stackexchange.com/questions/8751/how-to-completely-turn-off-colorscheme
"hi Example guifg=NONE guibg=#ff0000 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
" =========================================================================
set t_Co=256 " enable 256 colors
set background=dark " [dark|light]

try | colorscheme devpunks
catch | set termguicolors " 24bit gui(fg|bg)
endtry

" https://groups.google.com/g/vim_dev/c/wsC205JQpDo
" let &t_8f = '\<Esc>[38:2:%lu:%lu:%lum'
" let &t_8b = '\<Esc>[48:2:%lu:%lu:%lum'

" Interactive Status -----------------------------
augroup Status
  autocmd!
  autocmd InsertLeave * highlight! StatusLine term=reverse cterm=reverse gui=reverse
  autocmd InsertEnter * highlight! StatusLine term=reverse,bold cterm=reverse,bold gui=reverse,bold
augroup END

" }}}

" =========================================================================
" {{{ Functions
" =========================================================================
" -------------------------------------------------------------------------
" :call CursorCharacter ( value = 0 )
"   - :help ga
"   - https://www.geeksforgeeks.org/program-decimal-octal-conversion/
" -------------------------------------------------------------------------
function! CursorCharacter() abort " DecimalToOctal(27)"
" let character = strpart(getline('.'), col('.') -1, 1, 1 )
  let char = strpart(getline('.'), col('.')-1, 1, 1 )
  let index = char2nr( char )
  let character = printf( '|⌨ %-2s|', char )
  let decimal = printf( '\0d%-6d', index )
  let hexadecimal = printf( '\0x%-5X', index )
  let octal = printf( '\0o%-6o', index )

  return join( [ character, decimal, hexadecimal, octal ], ' ' )
endfunction

" -------------------------------------------------------------------------
" :call GetColor (group, attribute)
"   - https://www.reddit.com/r/neovim/comments/oxddk9
" -------------------------------------------------------------------------
function! GetColor(group, attr) abort " GetColor('LineNr', 'bg#')"
  let color = synIDattr( synIDtrans( hlID(a:group)), a:attr)

  echom "THE COLOR".color

  return color ? color : 'NONE'
endfunction

" -------------------------------------------------------------------------
" :call HighlightGroup () under cursor
" -------------------------------------------------------------------------
" https://vim.fandom.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
" https://gist.github.com/millermedeiros/1262085/d6376a5cd6b13ba4573abe0f45a458bf6ae596b7#file-gistfile1-vim-L306
function! HighlightGroup() abort
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
command! Colors call HighlightGroup()

" -------------------------------------------------------------------------
" TODO: TabLine () :h(elp) setting-tablines
" -------------------------------------------------------------------------
function! TabLine() abort
  if ! exists('+showtabline') | return '' | endif

  let line = '' " Initialize
  let line .= '%#TabLine#  devPunks😈👉 ' " logo

  let l:tabs = range( tabpagenr('$') )
  for index in l:tabs
    let l:tab = index + 1
    let l:count = tabpagewinnr(tab,'$')
    let l:window = tabpagewinnr( l:tab )
    let l:buffers = tabpagebuflist( l:tab )
    let l:index = l:buffers[ l:window - 1 ]
    let l:name = bufname( l:index )
    let l:modified = getbufvar( l:index, '&mod' )

    " set tab page number (for mouse clicks)
    let line ..='%' .. (l:tab) .. 'T'
    let line .= (l:tab == tabpagenr() ? '%#TabLineSel#| ▼ ' : '%#TabLine#| ')
    let line .= (l:tab == tabpagenr() ? '✎' : '')
    let line .= ( l:name == '' ?  '[No Name]' : fnamemodify (l:name, ':t' ) )
    let line .= ( l:modified ? '➕' : '' )
    let line .= ( l:count > 1 ? ' ⊞'.l:count : '' )

    let l:others = ( len( l:tabs ) > 1 )
    let l:current = ( l:tab == tabpagenr() )
    " Close button
    " let line .= '%=%999X%#TabLineSel#[X]'
    let line .= ( l:others && l:current ? '%' .. (l:tab) .. 'X ❌%X' : '' )
    " Closing gliph
    let line .= ( l:current ? ' ▼ |' : ' ' )

    let line .= '%T' " Tab delineation
  endfor

  let line .= '%<' " Overflow breakpoint
  let line .= '%#TabLineFill#' " Tablist breakpoint

  return line
endfunction

" }}}

" =========================================================================
" {{{ Mappings
" - https://vi.stackexchange.com/questions/2089
" - https://vi.stackexchange.com/questions/7722/how-to-debug-a-mapping
" - https://stackoverflow.com/questions/1764263/what-is-the-leader-in-a-vimrc-file
" - https://subscription.packtpub.com/book/data/9781789341096/3/ch03lvl1sec26/the-leader-key
" let mapleader = ',' " https://stevelosh.com/blog/2010/09/coming-home-to-vim/#using-the-leader
" =========================================================================
" Map semi-colon to colon (no need to press <SHIFT>)
nnoremap ; :
nnoremap <Space> za
nnoremap <C-z> <C-w>_ <C-w>|
" (insert) Tab completion
inoremap <Tab> <C-n>
" (normal) [TAB] Next Tab
nnoremap <Tab> :tabnext<CR>
nnoremap <Esc> :nohlsearch<CR>

" tags (:h tagstack)
" <C-]> jump to & push tag (:tag)
" <C-t> pop tag (:pop)
"   - https://stackoverflow.com/questions/17783539/tag-navigation-in-vim

" tabs - https://gist.github.com/Starefossen/5957088
" TODO: <C-t> conflicts with :tab pop
"nnoremap <C-t> :tabnew<cr>
nnoremap <C-n> :tabnext<CR>
nnoremap <C-p> :tabprevious<CR>
" simulate break pane in TMUX
nnoremap <C-w>t :tab split<CR>
" All buffers into tabs
nnoremap <C-w>T :tabo<CR> :bufdo tab split<CR>
" current buffer in new (t)ab
nnoremap <leader>t <C-w>t

" <=> Equal sized panes
nnoremap = <C-w>=
" <CTRL+h> Focus on pane to left
nnoremap <C-h> <C-w>h
" <CTRL+j> Focus on pane down
nnoremap <C-j> <C-w>j
" <CTRL+k> Focus on pane up
nnoremap <C-k> <C-w>k
" <CTRL+l> Focus on pane to right
nnoremap <C-l> <C-w>l
" normal mode: save
nnoremap <C-s> :w<CR>
" insert mode: escape to normal and save
inoremap <C-s> <esc>:w<CR>
" visual mode: escape to normal and save
vnoremap <C-s> <esc>:w<CR>

" Reload .vimrc configuration
" nnoremap <Leader>R :source ~/.vimrc
cnoremap <C-r> :source ~/.vimrc<CR>

" }}}

" =========================================================================
" {{{ Plugins
" =========================================================================
augroup FileDefaults
  filetype plugin indent on " filetype - https://vimdoc.sourceforge.net/htmldoc/filetype.html
augroup END

" -------------------------------------------------------------------------
" Omni-Complete
"   - Defaults - https://github.com/vim/vim/tree/master/runtime/autoload
"   - https://vim.fandom.com/wiki/Omni_completion
" -------------------------------------------------------------------------
set omnifunc=syntaxcomplete#Complete " Default Completion

" -------------------------------------------------------------------------
" Vim (Git) Gutter
" -------------------------------------------------------------------------
augroup FileDefaults
  autocmd VimEnter,BufEnter * call g:GitGutter()
augroup END

function! g:GitGutter() abort
  if exists('g:loaded_gitgutter') && has('signs')
    sign define GitGutterLineAdded text=➕
    sign define GitGutterLineRemoved text=➖
    sign define GitGutterLineModified text=～

    " Link Diff highlight groups
    highlight! link GitGutterAdd DiffAdd
    highlight! link GitGutterDelete DiffDelete
    highlight! link GitGutterChange DiffChange
  endif
endfunction

" -------------------------------------------------------------------------
" Scrollbar
" -------------------------------------------------------------------------
augroup FileDefaults
  " autocmd VimEnter * call sclow#update()
augroup END

" -------------------------------------------------------------------------
" ZoomWin
" -------------------------------------------------------------------------
nnoremap <Enter> :ZoomWin<CR>
nnoremap <leader>z :ZoomWin<CR> " TMUX dexterity clone

" -------------------------------------------------------------------------
" NERDTree
" -------------------------------------------------------------------------
augroup FileDefaults
  autocmd VimEnter * call s:NerdDrawer()
augroup END

function! s:NerdDrawer() abort
  if ! exists('g:NERDTree') | return | endif

  " [SHIFT]+[TAB] Opens Nerdtree
  nnoremap <S-Tab> :NERDTreeToggle<CR>

  let g:NERDTreeIgnore=[] " ignored files
  let g:NERDTreeFileLines=1 " LOC number in files
  let g:NERDTreeShowHidden=1 " Show hidden files (I)
  let g:NERDTreeShowBookmarks=1 " Show Bookmarks (B)
  let g:NERDTreeBookmarksFile='.bookmarks' " location
  let g:NERDTreeHighlightCursorLine=1 " highlight current line
  let g:NERDTreeDirArrowExpandable  = '📁' " Expandable directory
  let g:NERDTreeDirArrowCollapsible = '📂' " Collapsible directory

  NERDTree | wincmd p " Open Drawer & focus on `p`revious buffer
endfunction

" -------------------------------------------------------------------------
" Closetag - https://github.com/alvan/vim-closetag
" -------------------------------------------------------------------------
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'svg,html,xhtml,phtml,eruby,*.vue'

" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.svg,*.html,*.xhtml,*.phtml,*.html.erb,*.vue'

" This will make the list of non-closing tags self-closing in the specified files.
"let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.vue,*.jsx'

" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"let g:closetag_emptyTags_caseSensitive = 1

" -------------------------------------------------------------------------
" Vim-Ruby-Miinitest - https://github.com/sunaku/vim-ruby-minitest
" -------------------------------------------------------------------------

" }}}

" =========================================================================
" {{{ conceal.vim
" =========================================================================
set conceallevel=2

syntax match Conceal /import/ conceal cchar=⬅
syntax match Conceal '@import' conceal cchar=⬅
syntax match Conceal /fn/ conceal cchar=𝑓
syntax match Conceal /def/ conceal cchar=𝑓
syntax match Conceal /function/ conceal cchar=𝑓
syntax match Conceal /lambda/ conceal cchar=λ
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
syntax match Conceal /!/ conceal cchar=¬
syntax match Conceal /true/ conceal cchar=⊤
syntax match Conceal /false/ conceal cchar=⊥
syntax match Conceal /for/ conceal cchar=∀
syntax match Conceal /in/ conceal cchar=∈
syntax match Conceal "\<not in\>" conceal cchar=∉
syntax match Conceal /=/ conceal cchar=≝
syntax match Conceal /->/ conceal cchar=→
syntax match Conceal /assert/ conceal cchar=‼

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
syntax match Conceal /break/ conceal cchar=◁
syntax match Conceal /return/ conceal cchar=◀
syntax match Conceal /class/ conceal cchar=§
syntax match Conceal /unsafe/ conceal cchar=☡
syntax match Conceal /struct/ conceal cchar=∏
syntax match Conceal /enum/ conceal cchar=∐

syntax match Conceal '(' conceal cchar=）
syntax match Conceal ')' conceal cchar=（
syntax match Conceal '(' conceal cchar=（
syntax match Conceal ')' conceal cchar=）
syntax match Conceal '\]' conceal cchar=］ "〛
syntax match Conceal '\[' conceal cchar=［ "〚
syntax match Conceal '((' conceal cchar=⦅
syntax match Conceal '))' conceal cchar=⦆
syntax match Conceal '\[\[' conceal cchar=〚
syntax match Conceal '\]\]' conceal cchar=〛
syntax match Conceal '{' conceal cchar=⦃
syntax match Conceal '}' conceal cchar=⦄
syntax match Conceal 'BEGIN' conceal cchar=︷
syntax match Conceal 'END' conceal cchar=︸

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
