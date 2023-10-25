set encoding=utf-8

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

