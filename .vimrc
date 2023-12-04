set encoding=utf-8

" ********************************************************************************
" Author: Ahmid-Ra (github.com/snuggs)

" Screencasts: http://vimcasts.org

" Gist: https://gist.github.com/snuggs/612093

" Tutorial: http://learnvimscriptthehardway.stevelosh.com

" ********************************************************************************

"let skip_defaults_vim=1
" disable .viminfo
set viminfo=
set viminfofile=$HOME/.vim/.viminfo
autocmd VimLeave * call delete('~/.viminfo')


" ********************************************************************************
" Settings ***********************************************************************
" ********************************************************************************

set path+=$PWD/**

syntax on " turns syntax highlighting on

if &compatible
  set nocompatible " = https://stackoverflow.com/questions/5845557/in-a-vimrc-is-set-nocompatible-completely-useless
endif

set complete-=i
set nomodeline "Ignore file mode lines
"set shell " The shell used to execute commands
set showcmd      " display incomplete command in lower right
set spell " Enable spellchecking - https://vimtricks.com/p/vim-spell-check/

" increment formats - https://www.reddit.com/r/vim/comments/p18418/til_that_ctrlactrlx_can_incrementdecrement_a/
set nrformats-=octal
set nrformats+=alpha


" (Hopefully) Stop VIM from crashing
" https://superuser.com/questions/810622/vim-crashes-freezes-on-specific-files-mac-osx-mavericks#answer-810866
" 200
:set synmaxcol=256 " https://github.com/tpope/vim-sensible/issues/142
set colorcolumn=72,75,100 " vertical ruler - https://www.baeldung.com/linux/vim-ruler-on-specific-column
highlight ColorColumn ctermbg=233

set hlsearch " Highlight found search results
set incsearch " show partial search matches
set cursorline " highlight current cursor line
set cursorcolumn " highlight current cursor column
set noerrorbells " Display beep on errors
set autoread " re-read files if unmodified
set smartcase " Automatically search case-sensitive
set visualbell " Flash the screen instead of beeping errors

" - Backups ------------------------------------
"   - https://groups.google.com/g/vim_use/c/K2Utwkh5f30?pli=1
"   - https://alvinalexander.com/linux-unix/vi-vim-swap-backup-tilde-temporary-files-directory-move/
set backup " keep a backup file (nobackup for inverse)
" Undo location
" set nobackup
" set noswapfile
" set noundofile

set undodir=$TMPDIR " undo location
set directory=$TMPDIR " swap location
set backupdir=$TMPDIR " backup location

" disable sessions
set viewoptions-=options
set sessionoptions-=options

" ********************************************************************************
" Cursor ************************************************************************
" ********************************************************************************
" http://vim.wikia.com/wiki/Using_the_mouse_for_Vim_in_an_xterm
set mouse=a " Enable mouse use in all modes
set ttyfast " Send more characters for redraws
set lazyredraw " Don't update during macro script execution

if has('mouse_sgr')
  " Must be one of: sgr, xterm, xterm2, netterm, dec, jsbterm, pterm
  " Set this to the name of your terminal that supports mouse codes.
  set ttymouse=sgr
else
  set ttymouse=xterm2
endif

set guicursor=n-v-c:block-Cursor
set guicursor+=n-v-c:blinkwait10
set guicursor+=i:ver100-iCursor
set guicursor+=i:blinkwait90


" - Gutter ------------------------------------
set number
set numberwidth=4 " gutter columns
set ruler " set cursor coordinates
set rulerformat=📍%P⏬%l⏩%c " overridden by statusline
set showtabline=2 " :help setting-tabline

if has('signs')
  " - https://www.reddit.com/r/neovim/comments/neaeej/only_just_discovered_set_signcolumnnumber_i_like/
  " - https://stackoverflow.com/questions/15277241/changing-vim-gutter-color
  " - https://github.com/vim/vim/commit/394c5d8870b15150fc91a4c058dc571fd5eaa97e
  " set signcolumn=number " show sign instead of line number
endif

if has("gui_running")
  " remove ugly toolbar :-)
  set guioptions=egmrt
endif

" - Menus ------------------------------------
" - http://vim.wikia.com/wiki/Great_wildmode/wildmenu_and_console_mouse
" - https://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
set wildmenu
set wildmode=list:longest,full

" - Whitespace ------------------------------------
retab " update tab format
set nopaste " non paste mode - https://vimtricks.com/p/vimtricks-avoid-paste-formatting/
set pastetoggle=<F2> " Allow toggle of code indentation
set smarttab
set expandtab "turn tabs into whitespace
"ensure aligned  autoindents - https://vimtricks.com/p/ensuring-aligned-indentation/
set shiftround
set shiftwidth=2
set tabstop=2 "set tab character to 2 characters
set softtabstop=2
set list " view hidden characters
set listchars=tab:▢\ ,extends:⇨,precedes:⇦,nbsp:·,trail:■,eol:↴ " whitepsace replacement characters

" - Clipboard ------------------------------------
"   - https://vimtricks.com/p/vimtrick-the-clipboard-register/
"   - https://stackoverflow.com/questions/11489428/how-to-make-vim-paste-from-and-copy-to-systems-clipboard
set history=1000  " Increase undo limit
set tabpagemax=50 " Maximum number of tab pages
vnoremap <c-c> "*y<cr>
inoremap <c-v> “*p<cr>
set clipboard=unnamedplus

" copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

set wrap
" backspace will delete CRLF at beginning of line
" space key will wrap to next line at end of line
" left and right arrow will wrap to previous and next lines at end of line
" (in normal mode & insertion mode)
set whichwrap=b,s,<,>,[,]
set linebreak   " Avoid wrapping line in middle of word
set backspace=2 " character deletion prior to insertion mode
set scrolloff=2 " Lines of offset when jump scrolling
set sidescroll=10 " scroll amount when a word is outside of view
set display+=lastline " Always show paragraph last line

set foldenable
set foldmethod=indent "Enable indent folding
nnoremap <space> za


" ********************************************************************************
" Mappings ***********************************************************************
" - https://stackoverflow.com/questions/1764263/what-is-the-leader-in-a-vimrc-file
" - https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
" - https://vi.stackexchange.com/questions/2089/what-are-the-differences-between-the-map-noremap-abbrev-and-noreabbrev-command
" ********************************************************************************

" Reload .vimrc configuration
" nnoremap <Leader>R :source ~/.vimrc
cmap <c-r> :source ~/.vimrc<CR>

" tabs
nnoremap <C-t> :tabnew<cr>
nnoremap <C-n> :tabnext<cr>
nnoremap <C-p> :tabprevious<cr>

" <CTRL+h> Focus on pane to left
nmap <C-h> <C-w>h
" <CTRL+h> Focus on pane down
nmap <C-j> <C-w>j

" <CTRL+h> Focus on pane up
nmap <C-k> <C-w>k

" <CTRL+h> Focus on pane to right
nmap <C-l> <C-w>l

" <=> Equal sized panes
nnoremap = <C-w>=

" normal mode: save
" nnoremap <c-s> :w<cr>

" insert mode: escape to normal and save
"" inoremap <c-s> <esc>:w<cr>

" visual mode: escape to normal and save
"" vnoremap <c-s> <esc>:w<cr>


" Map semi-colon to colon (no need to press <SHIFT>
nnoremap ; :

" https://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting
" MAJOR MOUSE PROBLEMS
"" nnoremap <esc> :nohlsearch<cr>


" ********************************************************************************
" Files **************************************************************************
" ********************************************************************************

set title " File currently being edited

set autoindent
filetype indent on " filetype - https://vimdoc.sourceforge.net/htmldoc/filetype.html

set lines=27
set textwidth=75 " http://blog.ezyang.com/2010/03/vim-textwidth
set wrapmargin=0 " controls when to wrap based on terminal size (0 = disabled)

" formatoptions table - https://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
set formatoptions+=n " Format numbers
set formatoptions+=c " autowrap `c`omments
set formatoptions+=q " autowrap comments with gq
set formatoptions+=t " autowrap using `t`extwidth
set formatoptions+=j " Delete comment from joining lines
set formatoptions+=o " Preserve comments when pressing o/O

set fileformats=unix,dos " sets <LF> (unix) first, then tries <CR><LF> (dos) next

" --------------------------------------------------------------------------------
" Markdown
" http://vimcasts.org/episodes/hard-wrapping-text/
" --------------------------------------------------------------------------------
"" autocmd BufNewFile,BufRead *.md set formatoptions-=t formatoptions+=n
"" autocmd BufNewFile,BufRead README set formatoptions-=t formatoptions+=n

" --------------------------------------------------------------------------------
" Javascript
" --------------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.es   set filetype=javascript
autocmd BufNewFile,BufRead *.mjs  set filetype=javascript
autocmd BufNewFile,BufRead *.test set filetype=javascript
autocmd BufNewFile,BufRead *.json set filetype=javascript

" --------------------------------------------------------------------------------
" Ruby
" --------------------------------------------------------------------------------
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead *.html.erb set filetype=eruby


" ********************************************************************************
" Plugins ************************************************************************
" ********************************************************************************

filetype plugin indent on " filetype - https://vimdoc.sourceforge.net/htmldoc/filetype.html

" --------------------------------------------------------------------------------
" ZoomWin
" --------------------------------------------------------------------------------
nnoremap , :ZoomWin<cr>

" --------------------------------------------------------------------------------
" NERDTree
" --------------------------------------------------------------------------------

let NERDTreeShowHidden=1                  " Show hidden files
let g:NERDTreeDirArrowExpandable  = '📁'  " Expandable directory
let g:NERDTreeDirArrowCollapsible = '📂'  " Collapsible directory

" [ENTER] Opens Nerdtree
nnoremap <cr> :NERDTreeToggle<cr>

" Open NerdTree on VimEnter startup
"   | Selects `p`revious buffer to remove tree focus
autocmd VimEnter * NERDTreeToggle | wincmd p


