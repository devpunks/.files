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
" Gist: https://gist.github.com/snuggs/612093
" Author: Ahmid-Ra (github.com/snuggs)

" Screencasts: http://vimcasts.org
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

if !exists("g:pluginname_setting")
  unlet! skip_defaults_vim
  let g:skip_defaults_vim=0
  source $VIMRUNTIME/defaults.vim
endif

" xterm-focus-event tracking - https://github.com/vim/vim/issues/9296
let &t_fe = "\<Esc>[?1004h" " enable focus-event tracking
let &t_fd = "\<Esc>[?1004l" " disable focus-event tracking
" https://groups.google.com/g/vim_use/c/VyQSx90uaPE
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"

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

syntax on " turns syntax highlighting on
set synmaxcol=256 " https://github.com/tpope/vim-sensible/issues/142
set selection=exclusive " No EOL CR/LF - https://vi.stackexchange.com/questions/1260

" https://vim.fandom.com/wiki/Folding
set foldenable
set foldcolumn=2
set foldclose=all
set foldmethod=indent "Enable indent folding

" https://stackoverflow.com/questions/5845557
if &compatible | set nocompatible | endif

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
" Problematic for conditionals "A"=="a"
" https://vi.stackexchange.com/questions/11236
" https://learnvimscriptthehardway.stevelosh.com/chapters/22.html
" set ignorecase " Case in-sensitive search
set smartcase " Capitalization case-sensitive search
set incsearch " highlight search matches
set wrapscan " Search respects wrapping
set visualbell " TODO: t_vb= Flash the screen instead of beeping errors
set noerrorbells " Unset display beep on errors
set belloff+=ctrlg  " Turn off insert completion bell
set cursorline " highlight current cursor line
set cursorcolumn " highlight current cursor column
set cursorlineopt=both " [number,line,both,screenline]
set showmatch matchtime=3 " jump to matching brace
set splitbelow splitright " new windows

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
set viewoptions+=localoptions
set viewdir=$HOME/.vim/view

set sessionoptions-=options
set sessionoptions+=resize,winpos

set viminfo="NONE" " disable .viminfo
set viminfofile=$HOME/.vim/.viminfo
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
set titlestring="VIM TITLE %<%F%=%l/%L-%P"  " Title String format
set showtabline=2 " :help setting-tabline

if has("gui_running")
  " remove ugly toolbar :-)
  set guioptions=egmrt
endif

" - Menus ------------------------------------
" - http://vim.wikia.com/wiki/Great_wildmode/wildmenu_and_console_mouse
" - https://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
set wildmenu
set infercase
set wildoptions=pum
set wildignore+=*.DS_STORE " etc.
set wildmode=list:longest,full
set complete-=i,t " w,b,u,-i,-t - https://www.mail-archive.com/vim@vim.org/msg03963.html
set completeopt+=menu,menuone,noinsert,popup,preview
set completepopup+=align:menu,border:on,highlight:Pmenu

" - Clipboard Registers ------------------------------------
"   - https://github.com/termux/termux-packages/issues/2308
"   - https://vimtricks.com/p/vimtrick-the-clipboard-register/
"   - https://stackoverflow.com/questions/11489428/how-to-make-vim-paste-from-and-copy-to-systems-clipboard
"   - https://www.reddit.com/r/termux/comments/c17rwf/how_to_paste_to_vim_from_external_clipboard/
"   - OSC52 Escape to system clipboard - https://chromium.googlesource.com/apps/libapps/+/master/hterm/etc/osc52.vim

" vnoremap <c-c> "*y<cr>
" inoremap <c-v> “*p<cr>
if has('unnamedplus') | set clipboard=unnamed,unnamedplus | endif
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
set copyindent " copy previous line indentation
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
set fillchars+=fold:↯,foldopen:-,foldclose:+,foldsep:↯
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
nnoremap <leader>z :ZoomWin<cr>

" --------------------------------------------------------------------------------
" NERDTree
" --------------------------------------------------------------------------------
autocmd VimEnter * call s:NerdDrawer()

function! s:NerdDrawer() abort
  if ! exists('g:NERDTree') | return | endif

  " [ENTER] Opens Nerdtree
  nnoremap <CR> :NERDTreeToggle<CR>

  let NERDTreeIgnore=[] " ignored files
  let NERDTreeHighlightCursorLine=1 " current line
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

" ****************************************************************************
" {{{ STATUS
" Word Count
"   - g<C-g> - https://vimtricks.com/p/count-words-and-lines/
"   - Status line - https://cromwell-intl.com/open-source/vim-word-count.html
" ****************************************************************************
set showmode " Vi (not Vim)
set laststatus=2 " Always show status line
set shortmess+=ac
" https://stackoverflow.com/questions/17376257/vim-hyphen-in-ruler-column-value

set ruler " set cursor coordinates
set rulerformat=📏%P⏬%l⏩%c " overridden by statusline

" set statusline=[fo=%{&fo}]
set statusline= " clear out status line

" file type
set statusline+=%#Statement#[\ 💻%Y
" mode
set statusline+=%{(mode()=='n')?'\ 📄':''}
set statusline+=%{(mode()=='i')?'\ 📝':''}
set statusline+=%{(mode()=='R')?'\ 📃':''}
set statusline+=%{(mode()=='v')?'\ 🔍':''}
set statusline+=%{(mode()=='V')?'\ 🔎':''}
" read only mode
set statusline+=%r
" full file name
set statusline+=%-10F
set statusline+=\]%#StatusLine# " change to default highlight
" cursor column position
set statusline+=\ 📜⇨%2c✖%-l⇩
" percentage
set statusline+=(%p%%)⇳
" cursor line, total lines
set statusline+=\ of\ %L☰LOC
" right justify everything after this line
set statusline+=%=

let scheme = get(g:, 'colors_name', 'NONE')
set statusline+=\ \ %#Normal#\ 🎨\ %{scheme}\ 

" }}}

" {{{ GUTTER
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
" {{{ typography.vimrc
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
set pastetoggle=<leader>p " Allow toggle of (paste) insert indentation

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
set nostartofline " respect cursor column position

" (INSERT MODE)
set whichwrap+=[,] " [ left and right ] arrow wrap to prev. and next line
set backspace=indent,eol,nostop " Insert mode <BS> deletion

"}}}

" ********************************************************************************
" {{{ COLORSCHEME
"   - ./vim/colors/default.vim
"   - ./vim/colors/devpunks.vim
"
"   - https://jonasjacek.github.io/colors
"   - http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
"   - http://www.bjornenki.com/blog/gvim-colorscheme/bjornenki-colorscheme.vim
"   - Overrides - https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
"   - https://vi.stackexchange.com/questions/8751/how-to-completely-turn-off-colorscheme
" * can use hexidecimal values for gui (e.g. guibg=#000000)
" gui / cterm display modes (none,(i)talic,(b)old,(s)tandout, (u)nderline, under(c)url)
"hi Example guifg=NONE guibg=#ff0000 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
" ********************************************************************************
set t_Co=256 " enable 256 colors
set background=dark " [dark|light]
try
  colorscheme bw " jellybeans
catch | endtry

" Gutter Overrides
highlight StatusFileName ctermbg=234 ctermfg=magenta

augroup status
  autocmd!
" Interactive Status -----------------------------
  highlight! StatusLineInsert cterm=reverse,bold
  autocmd InsertEnter * highlight! link StatusLine StatusLineInsert
  autocmd InsertLeave * highlight! link StatusLine NONE
augroup END

" Custom Color Groups
" gutter --------------------------------------------------------------
" let s:gutter_bg=s:GetColor('LineNr', 'bg#')
let s:gutter_bg=0
echom "Gutter bg: ".s:gutter_bg

" execute "highlight SignColumn ctermbg=".s:gutter_bg
" execute "highlight CursorLineNr ctermbg=".s:gutter_bg

for type in ["Add", "Delete", "Change"]
  if ! hlexists("GitGutter".type) | break | endif

  echom "GitGutter".type." - ".hlexists("GitGutter".type)

  execute "highlight GitGutter".type." guibg=NONE ctermbg=".s:gutter_bg
  execute "verbose hi GitGutter".type
  execute "highlight GitGutter".type." guibg=NONE ctermbg=".s:gutter_bg
  execute "verbose hi GitGutter".type
endfor

" }}}

" ********************************************************************************
" {{{ Functions
" ********************************************************************************
" --------------------------------------------------------------------------------
" :call GetColor (group attribute)
" --------------------------------------------------------------------------------
" https://www.reddit.com/r/neovim/comments/oxddk9/how_do_i_get_the_value_from_a_highlight_group/
function! GetColor(group, attr)
  return synIDattr( synIDtrans( hlID(a:group)), a:attr)
endfunction

" --------------------------------------------------------------------------------
" :call HighlightGroup () under cursor
" --------------------------------------------------------------------------------
" https://vim.fandom.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
" https://gist.github.com/millermedeiros/1262085/d6376a5cd6b13ba4573abe0f45a458bf6ae596b7#file-gistfile1-vim-L306
function! HighlightGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
command! Colors call HighlightGroup()

" }}}

" conceal.vim --------------------------------------------------------------------
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
syntax match Conceal /in/ conceal cchar=∉
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
syntax match Conceal /match/ conceal cchar=▸
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
syntax match Conceal /union/ conceal cchar=⨄
syntax match Conceal /sqrt/ conceal cchar=√
syntax match Conceal /pi/ conceal cchar=π
