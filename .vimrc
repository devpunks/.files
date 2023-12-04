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
" Mappings ***********************************************************************
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
"" nmap <C-h> <C-w>h
" <CTRL+h> Focus on pane down
"" nmap <C-j> <C-w>j

" <CTRL+h> Focus on pane up
"" nmap <C-k> <C-w>k

" <CTRL+h> Focus on pane to right
"" nmap <C-l> <C-w>l

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
" Plugins ************************************************************************
" ********************************************************************************

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


