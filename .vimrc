"                   .
"   ##############..... ##############
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
" Gist: https://gist.github.com/snuggs/612093
" Author: Ahmid-Ra (github.com/snuggs)

" Screencasts: http://vimcasts.org
"
"
" Cheatsheet - https://vim.rtorr.com/
" TERM - https://vimhelp.org/term.txt.html
" Popups - https://vimhelp.org/popup.txt.html
" Tutorial - http://learnvimscriptthehardway.stevelosh.com
" Idiomatic .vimrc - https://github.com/romainl/idiomatic-vimrc
" VIM9 Script - https://vimhelp.org/vim9.txt.html#Vim9-script
" CLICKING LINE NUMBERS
"  - https://www.reddit.com/r/vim/comments/86pjx4/does_vim_currently_have_a_way_to_handle_clicks_on/

" ********************************************************************************

set encoding=utf-8

unlet! skip_defaults_vim
let g:skip_defaults_vim=0
source $VIMRUNTIME/defaults.vim

" xterm-focus-event tracking - https://github.com/vim/vim/issues/9296
let &t_fe = "\<Esc>[?1004h" " enable focus-event tracking
let &t_fd = "\<Esc>[?1004l" " disable focus-event tracking
" https://groups.google.com/g/vim_use/c/VyQSx90uaPE
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"
" Enable modified arrow keys, see :help arrow_modifiers
execute "set <xUp>=\<Esc>[@;*A"
execute "set <xDown>=\<Esc>[@;*B"
execute "set <xRight>=\<Esc>[@;*C"
execute "set <xLeft>=\<Esc>[@;*D"

" typography.vim FONTS ------------------------------------------------
" Italic Font ???
" https://stackoverflow.com/a/30937851/173208
let &t_ZH="\e[3m" " italics start
let &t_ZR="\e[23m" " italics  end
let &t_Cs = "\e[4:3m" " Undercurl start
let &t_Ce = "\e[4:0m" " Undercurl end

" NOTES -------------------------------------------------------------------
"  - Test executables - https://renenyffenegger.ch/notes/development/vim/script/vimscript/functions/executable
"  - https://til.hashrocket.com/posts/qll3kizlzj-check-that-an-executable-exists-on-the-path
"  - https://superuser.com/questions/935574/get-rid-of-null-character-in-vim-variable
let version_termux = $TERMUX_VERSION
let version_tmux   = system('echo -n $(tmux -V)')
let version_bash   = system('echo -n $BASH_VERSION')

echom "VIM: ".v:version
echom "BASH: ".version_bash
if exists( '$TMUX' )
  echom "TMUX: ".version_tmux
endif
if executable('termux-info')
  echom "TERMUX: ".version_termux
endif

" ********************************************************************************
" {{{ Settings
" ********************************************************************************
" - https://gist.github.com/romainl/7e2b425a1706cd85f04a0bd8b3898805
" - https://stackoverflow.com/questions/2288756/how-to-set-working-current-directory-in-vim
" set path+=$PWD/** " slowwwwwwwwwwwwwwwwwwwwwwww

" (Hopefully) Stop VIM from crashing
" https://superuser.com/questions/810622
syntax on " turns syntax highlighting on
set synmaxcol=256 " https://github.com/tpope/vim-sensible/issues/142
set selection=exclusive " No EOL CR/LF - https://vi.stackexchange.com/questions/1260

" https://vim.fandom.com/wiki/Folding
set foldenable
set foldcolumn=2
set foldmethod=indent "Enable indent folding

if &compatible
  set nocompatible " https://stackoverflow.com/questions/5845557
endif

"set shell " The shell used to execute commands
set spell " Enable spellchecking - https://vimtricks.com/p/vim-spell-check/
set showcmd " show current command prompt suffix
set nomodeline "Ignore file mode lines

" increment formats
"   - https://vimtricks.com/p/vimtrick-increment-numbers/
"   - https://www.reddit.com/r/vim/comments/p18418/til_that_ctrlactrlx_can_incrementdecrement_a/
set nrformats-=octal
set nrformats+=alpha

" https://vimtricks.com/p/vim-line-length-marker/
set colorcolumn=-8,-3 " vertical ruler - https://www.baeldung.com/linux/vim-ruler-on-specific-column

set hlsearch " results
set autoread " re-read files
set noautowrite " do not autowrite
set noautowriteall " do not autowrite (all)
set ignorecase " Case in-sensitive search
set smartcase " Capitalization case-sensitive search
set incsearch " highlight search matches
set visualbell " TODO: t_vb= Flash the screen instead of beeping errors
set noerrorbells " Display beep on errors
set belloff+=ctrlg  " Turn off insert completion bell
set cursorline " highlight current cursor line
set cursorcolumn " highlight current cursor column
set cursorlineopt=number,line " [number,line,both,screenline]
set showmatch matchtime=3 " jump to matching brace

" Buffers ---------------------------
set hidden " set nohidden " possibly overridden by ZoomWin https://vimtricks.com/p/what-is-set-hidden/
set history=1000  " Increase undo limit
set tabpagemax=50 " Maximum number of tab pages
command! Flush :update | %bd | e# " https://vimtricks.com/p/closing-hidden-buffers/

" Views, Sessions, Viminfo ------------------------------------
"   - https://vimtricks.com/p/saving-session-state/
"   - https://learnvim.irian.to/basics/views_sessions_viminfo

" disable sessions
set viewoptions-=options
set sessionoptions-=options

set viewoptions+=localoptions

set viewdir=$HOME/.vim/view

set sessionoptions+=resize,winpos

set viminfofile=$HOME/.vim/.viminfo
set viminfo="NONE" " disable .viminfo
" autocmd VimLeave * call delete('~/.viminfo')

" - Backups ------------------------------------
"   - https://groups.google.com/g/vim_use/c/K2Utwkh5f30?pli=1
"   - https://alvinalexander.com/linux-unix/vi-vim-swap-backup-tilde-temporary-files-directory-move/
set backup " keep a backup file (nobackup for inverse)
" Undo location
" set nobackup
" set nowritebackup
" set noswapfile
" set noundofile

set undodir=$TMPDIR " undo location
set directory=$TMPDIR " swap location
set backupdir=$TMPDIR " backup location

" - Cursor ------------------------------------
set ttyfast " Send more characters for redraws
set ttimeout
set ttimeoutlen=1
set ttyscroll=3 " number of characters for redraws
set lazyredraw " Don't update during macro script execution

" http://vim.wikia.com/wiki/Using_the_mouse_for_Vim_in_an_xterm
set mouse=a " Enable mouse use in all modes

if has('mouse_sgr')
  " Must be one of: sgr, xterm, xterm2, netterm, dec, jsbterm, pterm
  " Set this to the name of your terminal that supports mouse codes.
  set ttymouse=sgr
else
  set ttymouse=xterm
endif

" https://stackoverflow.com/questions/6488683
let &t_EI = "\e[2;0;0 q" " Steady block
let &t_SI = "\e[5;0;0 q" " Insert mode Bar cursor
let &t_SR = "\e[3;0;0 q" " Replace mode  underline

if has('gui_running')
  " https://vim.fandom.com/wiki/Configuring_the_cursor
  set guicursor=n-v-c:block-Cursor
  set guicursor+=n-v-c:blinkwait10
  set guicursor+=i:ver100-iCursor
  set guicursor+=i:blinkwait90
endif

" - Chrome -----------------------------------
set title " Turn on title
set titlestring="%<%F%=%l/%L-%P"  " Title String format
set showtabline=2 " :help setting-tabline

if has("gui_running")
  " remove ugly toolbar :-)
  set guioptions=egmrt
endif

" - Menus ------------------------------------
" - http://vim.wikia.com/wiki/Great_wildmode/wildmenu_and_console_mouse
" - https://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
set wildmenu
set wildoptions=pum
set wildmode=list:longest,full
set complete-=i,t " w,b,u,-i,-t - https://www.mail-archive.com/vim@vim.org/msg03963.html
set completeopt+=menu,menuone,noinsert,popup,preview
set completepopup+=align:menu,border:on,highlight:Pmenu

" - Clipboard ------------------------------------
"   - https://github.com/termux/termux-packages/issues/2308
"   - https://vimtricks.com/p/vimtrick-the-clipboard-register/
"   - https://stackoverflow.com/questions/11489428/how-to-make-vim-paste-from-and-copy-to-systems-clipboard
"   - https://www.reddit.com/r/termux/comments/c17rwf/how_to_paste_to_vim_from_external_clipboard/
" vnoremap <c-c> "*y<cr>
" inoremap <c-v> “*p<cr>
" set clipboard=unnamedplus
"
"  copy and paste
" vmap <C-c> "+yi
" vmap <C-x> "+c
" vmap <C-v> c<ESC>"+p
" imap <C-v> <ESC>"+pa

" termux -----
" https://ibnishak.github.io/blog/post/copy-to-termux-clip/
if executable('termux-clipboard-set')
  echom "SHAZAAAM FOUND CLIPBOARD"
  " vnoremap <C-x> :!termux-clipboard-set<CR>
  " vnoremap <C-c> :w !termux-clipboard-set<CR><CR>
  " inoremap <C-v> <ESC>:read !termux-clipboard-get<CR>i
else
  echom "Termux clipboard not found"
endif
" }}}

" ********************************************************************************
" {{{ Mappings
" - https://stackoverflow.com/questions/3776117
" - https://vi.stackexchange.com/questions/2089
" - https://vi.stackexchange.com/questions/7722/how-to-debug-a-mapping
" - https://stackoverflow.com/questions/1764263/what-is-the-leader-in-a-vimrc-file
" - https://subscription.packtpub.com/book/data/9781789341096/3/ch03lvl1sec26/the-leader-key
" let mapleader = ',' " https://stevelosh.com/blog/2010/09/coming-home-to-vim/#using-the-leader
" ********************************************************************************
" Map semi-colon to colon (no need to press <SHIFT>)
nnoremap ; :
nnoremap <space> za
nnoremap <esc> :nohlsearch<cr>

" tags (:h tagstack)
" <C-]> jump to & push tag (:tag)
" <C-t> pop tag (:pop)
"   - https://stackoverflow.com/questions/17783539/tag-navigation-in-vim

" tabs
" TODO: <C-t> conflicts with :tab pop
"nnoremap <C-t> :tabnew<cr>
nnoremap <C-n> :tabnext<cr>
nnoremap <C-p> :tabprevious<cr>
" simulate break pane in TMUX
nnoremap <C-w>T :tab split<cr>

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
nnoremap <c-s> :w<cr>
" insert mode: escape to normal and save
inoremap <c-s> <esc>:w<cr>
" visual mode: escape to normal and save
vnoremap <c-s> <esc>:w<cr>

" Reload .vimrc configuration
" nnoremap <Leader>R :source ~/.vimrc
cmap <c-r> :source ~/.vimrc<CR>

" }}}

" ********************************************************************************
" {{{ Files
"   - Per type configuration - https://vimtricks.com/p/per-file-type-configs/
"   - autocommands - https://gist.github.com/romainl/6e4c15dfc4885cb4bd64688a71aa7063
" ********************************************************************************

set smarttab " 'tab' insertion
set autoindent " auto(matically smart)indent
set smartindent " indent based off current line
set textwidth=75 " http://blog.ezyang.com/2010/03/vim-textwidth
set wrapmargin=0 " controls when to wrap based on terminal size (0 = disabled)

filetype indent on " filetype - https://vimdoc.sourceforge.net/htmldoc/filetype.html
autocmd FocusLost * :w " save on focus lost

" formatoptions table - https://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
set formatoptions+=n " Format numbers
set formatoptions+=c " autowrap `c`omments
set formatoptions+=q " autowrap comments with gq
set formatoptions+=t " autowrap using `t`extwidth
set formatoptions+=j " Delete comment from joining lines
set formatoptions+=o " Preserve comments when pressing o/O
set fileformats=unix,dos " sets <LF> (unix) first, then tries <CR><LF> (dos) next
" - Meta-chars ------------------------------------
set fillchars+=fold:↯,foldopen:-,foldclose:+,foldsep:‖
set fillchars+=stl:△,stlnc:⚊,vert:‖,diff:-,eob:𝕏,lastline:▶

" --------------------------------------------------------------------------------
" Markdown
"   - http://vimcasts.org/episodes/hard-wrapping-text/
" --------------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.md setlocal formatoptions-=t formatoptions+=n
autocmd BufNewFile,BufRead README setlocal formatoptions-=t formatoptions+=n

" --------------------------------------------------------------------------------
" HTML
"   - https://vimtricks.com/p/vim-autocomplete-html-tags/
" --------------------------------------------------------------------------------
autocmd FileType html,eruby setlocal omnifunc=htmlcomplete#CompleteTags

" --------------------------------------------------------------------------------
" CSS
"   - https://www.simplified.guide/vim/auto-complete-css
" --------------------------------------------------------------------------------
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd BufNewFile,BufRead *.sass,*.scss setlocal filetype=css

" --------------------------------------------------------------------------------
" Javascript
"   - https://www.simplified.guide/vim/auto-complete-javascript
" --------------------------------------------------------------------------------
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.json,*.es,*.mjs,*.test setlocal filetype=javascript

" --------------------------------------------------------------------------------
" Ruby
"   - https://stackoverflow.com/questions/15720313/vim-omnicomplete-with-ruby-only-partially-works/22805517#22805517
" --------------------------------------------------------------------------------
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd BufNewFile,BufRead Gemfile setlocal filetype=ruby
autocmd BufNewFile,BufRead *.erb setlocal filetype=eruby

" --------------------------------------------------------------------------------
" Python
"   - https://www.simplified.guide/vim/auto-complete-ruby
" --------------------------------------------------------------------------------
autocmd FileType python setlocal omnifunc=python3complete#Complete

" --------------------------------------------------------------------------------
" Go
"   - https://www.simplified.guide/vim/auto-complete-ruby
" --------------------------------------------------------------------------------
autocmd FileType python setlocal omnifunc=syntaxcomplete#Complete

" }}}

" ********************************************************************************
" {{{ Plugins
" ********************************************************************************

filetype plugin indent on " filetype - https://vimdoc.sourceforge.net/htmldoc/filetype.html

" --------------------------------------------------------------------------------
" Omni-Complete
"   - Defaults - https://github.com/vim/vim/tree/master/runtime/autoload
"   - https://vim.fandom.com/wiki/Omni_completion
" --------------------------------------------------------------------------------
set omnifunc=syntaxcomplete#Complete " Default Completion

" --------------------------------------------------------------------------------
" ZoomWin
" --------------------------------------------------------------------------------
nnoremap , :ZoomWin<cr>

" --------------------------------------------------------------------------------
" NERDTree
" --------------------------------------------------------------------------------
autocmd VimEnter * call s:NerdDrawer()

function! s:NerdDrawer() abort
  if ! exists('g:NERDTree') | return | endif

  " [ENTER] Opens Nerdtree
  nnoremap <CR> :NERDTreeToggle<CR>

  let g:NERDTreeShowHidden=1 " Show hidden files (I)
  let g:NERDTreeShowBookmarks=1 " Show Bookmarks (B)
  let g:NERDTreeBookmarksFile=".bookmarks"
  let g:NERDTreeDirArrowExpandable  = '📁' " Expandable directory
  let g:NERDTreeDirArrowCollapsible = '📂' " Collapsible directory

  NERDTree | wincmd p " Open Drawer & focus on `p`revious buffer
endfunction

" --------------------------------------------------------------------------------
" Closetag - https://github.com/alvan/vim-closetag
" --------------------------------------------------------------------------------

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

" --------------------------------------------------------------------------------
" Vim-Ruby-Miinitest - https://github.com/sunaku/vim-ruby-minitest
" --------------------------------------------------------------------------------

" }}}

" ********************************************************************************
" {{{ STATUS ------------------------------------------------
" Word Count
"   - g<C-g> - https://vimtricks.com/p/count-words-and-lines/
"   - Status line - https://cromwell-intl.com/open-source/vim-word-count.html
" ********************************************************************************

set showmode " Vi (not Vim)
set laststatus=2 " Always show status line
set shortmess+=ac
" https://stackoverflow.com/questions/17376257/vim-hyphen-in-ruler-column-value

set ruler " set cursor coordinates
set rulerformat=📏%P⏬%l⏩%c " overridden by statusline

" set statusline=[fo=%{&fo}]
set statusline= " clear out status line

" file type
set statusline+=💻[%Y]

set statusline+=%{(mode()=='n')?'\ 📃\ ':''}
set statusline+=%{(mode()=='i')?'\ 📝\ ':''}
set statusline+=%{(mode()=='R')?'\ REPLACE\ ':''}
set statusline+=%{(mode()=='v')?'\ 🔎\ ':''}
set statusline+=%{(mode()=='V')?'\ 🔎\ ':''}

" read only mode
set statusline+=%r

" full file name
set statusline+=%-10F

" right justify everything after this line
set statusline+=%=

" cursor column position
set statusline+=\ 📜\ %2c✖%-l
" cursor line, total lines
set statusline+=\ of\ %L\ LOC

" percentage
set statusline+=\ (%p%%)\ 

let scheme = get(g:, 'colors_name', 'NONE')
set statusline+=\ \ \ \ 🎨\ %{scheme}\ 

" Interactive Status -----------------------------
autocmd InsertEnter * highlight! link StatusLine InsertColor
autocmd InsertLeave * highlight! link StatusLine NormalColor

" }}}

" {{{ GUTTER ------------------------------------------------
" https://github.com/airblade/vim-gitgutter/commit/8db2fc5
set number
set numberwidth=4 " gutter columns

if has('signs') " https://vimdoc.sourceforge.net/htmldoc/sign.html
  " - https://www.reddit.com/r/neovim/comments/neaeej/only_just_discovered_set_signcolumnnumber_i_like/
  " https://github.com/vim/vim/commit/394c5d8870b15150fc91a4c058dc571fd5eaa97e
  set signcolumn=yes " [auto|no|yes|number]
endif

" }}}

" ********************************************************************************
" {{{ TYPOGRAPHY.vimrc
" ********************************************************************************
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
let &showbreak = '⥹' " Character used for wrapped line
set pastetoggle=<F2> " Allow toggle of code indentation

set list " view hidden characters
set listchars=tab:▢\ ,extends:⇨,precedes:⇦,nbsp:·,trail:■,eol:↴ " whitepsace replacement characters

set scrolloff=2 " Lines of offset when jump scrolling
set sidescroll=10 " scroll amount when a word is outside of view
" https://stackoverflow.com/questions/4621798
" https://stackoverflow.com/questions/15124386
set display=lastline " Always show paragraph last line

" (NORMAL MODE)
" (b)ackspace wrap EOL & BOL
" (s)pace key wrap to next line at end of line
set whichwrap=b,s,<,>,[,] " < left and right > arrow wrap to prev. and next line
" (INSERT MODE)
set backspace=indent,eol,nostop " Insert mode <BS> deletion
set whichwrap+=[,] " [ left and right ] arrow wrap to prev. and next line

"}}}


" {{{ COLORSCHEME ------------------------------------------------
"   - https://jonasjacek.github.io/colors
"   - https://www.vim.org/scripts/script.php?script_id=335
"   - Overrides - https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
"   - https://vi.stackexchange.com/questions/8751/how-to-completely-turn-off-colorscheme
"

" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
" http://www.bjornenki.com/blog/gvim-colorscheme/bjornenki-colorscheme.vim
" * can use hexidecimal values for gui (e.g. guibg=#000000)
" gui / cterm display modes (none,(i)talic,(b)old,(s)tandout, (u)nderline, under(c)url)
"hi Example guifg=NONE guibg=#ff0000 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE

set t_Co=256 " enablf 256 colors
set background=dark
try
"  colorscheme jellybeans " Set color scheme
catch | endtry

" Custom Color Groups

" gutter --------------------------------------------------------------
" https://stackoverflow.com/questions/15277241/changing-vim-gutter-color
verbose hi LineNr
verbose hi CursorLineNr
verbose hi SignColumn
let s:gutter_bg=s:GetColor('LineNr', 'bg#')
echom "Gutter bg: ".s:gutter_bg
execute "hi SignColumn guibg=NONE ctermbg=".s:gutter_bg
execute "hi CursorLineNr guibg=NONE ctermbg=".s:gutter_bg
for type in ["Add", "Delete", "Change"]
  echom "GitGutter".type." - ".hlexists("GitGutter".type)

  execute "hi GitGutter".type." guibg=NONE ctermbg=".s:gutter_bg
  execute "verbose hi GitGutter".type
endfor
" https://vi.stackexchange.com/questions/10897/how-do-i-customize-vimdiff-colors
highlight DiffAdd ctermfg=green guifg=green
highlight DiffDelete ctermfg=red guifg=red
highlight DiffChange ctermfg=yellow guifg=yellow

" ---------------------------------------------------------------------


highlight Braces ctermfg=249
highlight ColorColumn ctermbg=red
highlight Error ctermbg=13 ctermfg=black
highlight WhiteSpace ctermbg=NONE ctermfg=244
highlight VisualColor ctermbg=132 ctermfg=234
highlight NormalColor ctermbg=234 ctermfg=magenta
highlight InsertColor ctermbg=magenta ctermfg=234
highlight ReplaceColor guifg=Black guibg=maroon ctermbg=165 ctermfg=0

highlight TabColorNC ctermbg=black ctermfg=132 cterm=bold


" Native Color Groups
" https://stackoverflow.com/questions/24232354/vim-set-color-for-listchars-tabs-and-spaces
highlight Directory ctermfg=13
highlight String cterm=italic ctermfg=117
highlight! link TabColor NormalColor
highlight! link TabLine TabColorNC
highlight! link TabLineSel TabColor
highlight! link TabLineFill TabLine
highlight! link NonText WhiteSpace
highlight! link SpecialKey WhiteSpace
highlight! link  PreProc String
highlight StringDelimiter cterm=bold ctermfg=132
highlight Title cterm=bold ctermfg=159
highlight Special cterm=bold ctermfg=183
highlight! link Constant Special
highlight Statement ctermfg=132
highlight! link Function Statement
highlight! link StorageClass Statement
highlight! link Type Identifier
highlight! link StatusLine NormalColor
highlight! link StatusLineTerm StatusLine
highlight StatusLineNC ctermfg=249
highlight! link StatusLineTermNC StatusLineNC
highlight Pmenu ctermfg=132 ctermbg=235
highlight VertSplit ctermfg=132 ctermbg=232
highlight PmenuThumb ctermfg=red ctermbg=132
highlight Scrollbar ctermfg=red ctermbg=blue
highlight! link SpellBad Error
highlight! link ErrorMsg Error
highlight! link WarningMsg Error
highlight Search term=reverse ctermfg=black ctermbg=13
highlight PmenuSbar ctermfg=green ctermbg=black
highlight PmenuSel ctermfg=magenta ctermbg=black
highlight LineNr ctermfg=darkgrey ctermbg=234
highlight SignColumn ctermbg=234 guibg=darkgrey
highlight CursorColumn ctermbg=3
highlight CursorLineNr ctermfg=magenta ctermbg=234
highlight Cursor guifg=black ctermfg=black guibg=white ctermbg=white
highlight iCursor guifg=white ctermfg=black guibg=steelblue ctermbg=white
highlight StatusFileName ctermbg=234 guibg=black ctermfg=magenta guifg=magenta

" Overrides
highlight vimOper ctermfg=13
highlight! link vimEcho vimOper
highlight! link vimMapLhs vimOper
highlight! link vimCmdSep vimOper
highlight! link vimHiBang vimOper
highlight! link vimUserCmd vimOper
highlight! link vimHiKeyList vimOper
highlight! link vimFunction String
highlight! link vimUserFunc vimFunction
highlight! link vimIsCommand Statement
highlight! link vimVar vimIsCommand
highlight! link vimAutoCmdSfxList vimOper
highlight! link vimAutoEventList Delimiter
highlight! link shQuote String
highlight! link shQuote String
highlight! link vimMapRhs Identifier
highlight! link vimSetEqual vimOper
highlight! link vimSet vimSetEqual
highlight! link vimHiCtermColor String
highlight! link vimHiGroup Special
highlight! link vimGroup vimHiGroup
highlight! link vimNumber String
highlight! link vimHiNmbr vimNumber
highlight! link NERDTreeDir Directory
highlight NERDTreeCWD ctermfg=13  cterm=reverse
highlight! link NERDTreeFile Statement
highlight! link NERDTreeExecFile Statement
highlight! link cssBraces Braces
highlight! link rubyParentheses Braces
highlight! link rubyCurlyBlockDelimiter Braces
highlight rubyMethodBlock ctermfg=132
highlight! link javaScriptBraces Braces
highlight! link javaScriptParens Braces
highlight htmlTagName cterm=bold ctermfg=134
highlight! link htmlTagN htmlTagName
highlight! link htmlSpecialTagName htmlTagName
highlight! link cssTagName htmlTagName
highlight! link cssSelectorOp Statement
highlight! default link cssIdentifier Identifier
" }}}

" ********************************************************************************
" {{{ Functions
" ********************************************************************************
" --------------------------------------------------------------------------------
" :call GetColor (group attribute)
" --------------------------------------------------------------------------------
" https://www.reddit.com/r/neovim/comments/oxddk9/how_do_i_get_the_value_from_a_highlight_group/
function s:GetColor(group, attr)
  return synIDattr( synIDtrans( hlID(a:group)), a:attr)
endfunction
" --------------------------------------------------------------------------------
" (:hi)ghlight group under cursor
" --------------------------------------------------------------------------------
" https://vim.fandom.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
function! s:HighlightGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
command! Colors call HighlightGroup()

# }}}
