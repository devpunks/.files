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
" NERDTree
" --------------------------------------------------------------------------------


let NERDTreeShowHidden=1                   " Show hidden files
let NERDTreeDirArrowExpandable  = '📁'     " Expandable directory
let NERDTreeDirArrowCollapsible = '📂'     " Collapsible directory
" let g:NERDTreeDirArrowExpandable  = ‘▸’
" let g:NERDTreeDirArrowCollapsible = ‘▾’

" [ENTER] Opens Nerdtree
nmap <cr> :NERDTreeToggle<cr>
" Open NerdTree on VimEnter startup
" | Selects `p`revious buffer to remove tree focus
autocmd VimEnter * NERDTreeToggle | wincmd p

