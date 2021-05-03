set encoding=utf-8

" Author: Ahmid-Ra (github.com/snuggs)

" Screencasts: http://vimcasts.org

" Gist: https://gist.github.com/snuggs/612093

" Tutorial: http://learnvimscriptthehardway.stevelosh.com

" ********************************************************************************

"let skip_defaults_vim=1
" disable .viminfo
set viminfo=
autocmd VimLeave * call delete('~/.viminfo')

" Plugins ************************************************************************
" ********************************************************************************

" --------------------------------------------------------------------------------
" NERDTree
" --------------------------------------------------------------------------------

" let g:NERDTreeDirArrowExpandable  = ‘▸’
" let g:NERDTreeDirArrowCollapsible = ‘▾’
let NERDTreeDirArrowExpandable = '📁'
let NERDTreeDirArrowCollapsible = '📂'

" [ENTER] Opens Nerdtree
autocmd VimEnter * NERDTreeToggle | wincmd p

" Show hidden files
let NERDTreeShowHidden=1
nmap <cr> :NERDTreeToggle<cr>


" --------------------------------------------------------------------------------
" ZoomWin
" --------------------------------------------------------------------------------
nnoremap , :ZoomWin<cr>


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

"set completefunc=syntaxcomplete#Complete

" ********************************************************************************
" Files **************************************************************************
" ********************************************************************************

filetype off
filetype indent on
filetype plugin indent on

set nrformats-=octal
" set spell " Enable spellchecking
set nomodeline "Ignore file mode lines
" set shell " The shell used to execute commands

" --------------------------------------------------------------------------------
" Markdown
" --------------------------------------------------------------------------------

" http://vimcasts.org/episodes/hard-wrapping-text/
" autocmd BufNewFile,BufRead *.md set formatoptions-=t


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
" Settings ***********************************************************************
" ********************************************************************************

syntax on " turns syntax highlighting on

set title " File currently being edited
set autoread " re-read files if unmodified
set noerrorbells " Display beep on errors
set visualbell " Flash the screen instead of beeping errors
set lazyredraw " Don't update during macro script execution
set smartcase " Automaticall search case-sensitive

" Clipboard
set paste
set pastetoggle=<F2> " Allow toggle of code indentation
set history=1000  " Increase undo limit
set tabpagemax=50 " Maximum number of tab pages
"inoremap <c-c> "*y<cr>
nnoremap <c-c> "*y<cr>
vnoremap <c-c> "*y<cr>
"set clipboard=unnamedplus


if has("gui_running")
  " remove ugly toolbar :-)
  set guioptions=egmrt
endif


set showcmd      " display incomplete command in lower right
set nocompatible " use Vim defaults (much better)

" http://vim.wikia.com/wiki/Using_the_mouse_for_Vim_in_an_xterm
set ttyfast      " Send more characters for redraws
set mouse=a      " Enable mouse use in all modes

if has('mouse_sgr')
  " Must be one of: sgr, xterm, xterm2, netterm, dec, jsbterm, pterm
  " Set this to the name of your terminal that supports mouse codes.
  set ttymouse=sgr
else
  set ttymouse=xterm2
endif

" Backups
"   - https://groups.google.com/g/vim_use/c/K2Utwkh5f30?pli=1
"   - https://alvinalexander.com/linux-unix/vi-vim-swap-backup-tilde-temporary-files-directory-move/
" set nobackup
set backup " keep a backup file (nobackup for inverse)
" Undo location
" set nobackup
" set noswapfile
" set noundofile

set undodir=$TMPDIR
" swap file location
set directory=$TMPDIR
" backup directory location
set backupdir=$TMPDIR

" http://vim.wikia.com/wiki/Great_wildmode/wildmenu_and_console_mouse
set wildmenu
set wildmode=list:longest,full

" Gutter
set ruler
set number
set showtabline=2
set numberwidth=4


" Whitespace

set nopaste " non paste mode
set smarttab
set expandtab "turn tabs into whitespace
retab " update tab format
"indent width for autoindents
set shiftround
set shiftwidth=2
" view hidden characters
set list
" tab will show as ▸ and whitespace will show as -
set listchars=tab:▢\ ,trail:■,eol:↴

" character to indicate that line continues off the page
set listchars+=extends:⇨
set listchars+=precedes:⇦

set autoindent
"Enable indent folding
set foldenable
set foldmethod=indent
nnoremap <space> za
"set tab character to 2 characters
set tabstop=2
set softtabstop=2

" https://stackoverflow.com/questions/15277241/changing-vim-gutter-color
" https://github.com/vim/vim/commit/394c5d8870b15150fc91a4c058dc571fd5eaa97e
if has('signs')
  set signcolumn=number
endif


set path=$PWD/**
" sets <LF> (unix) first, then tries <CR><LF> (dos) next
set fileformats=unix,dos
set formatoptions+=j " Delete comment from joining lines


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

" (Hopefully) Stop VIM from crashing
" https://superuser.com/questions/810622/vim-crashes-freezes-on-specific-files-mac-osx-mavericks#answer-810866
" 200
:set synmaxcol=0


" ********************************************************************************
" FONTS, COLORS & HIGHLIGHTS - https://jonasjacek.github.io/colors **********************
" ********************************************************************************

" Italic Font ???
" https://stackoverflow.com/a/30937851/173208
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

set t_Co=256 " enable 256 colors

set background=dark
colorscheme jellybeans " Set color scheme

" Highlight found search results
set hlsearch
" Incremental search that shows partial matches
set incsearch
" highlight current cursor line
set cursorline
" highlight current cursor column
set cursorcolumn


"let &t_Cs = "\e[4:3m"
"let &t_Ce = "\e[4:0m"

" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
" http://www.bjornenki.com/blog/gvim-colorscheme/bjornenki-colorscheme.vim
" * can use hexidecimal values for gui (e.g. guibg=#000000)
" gui / cterm display modes (none,(i)talic,(b)old,(s)tandout, (u)nderline, under(c)url)
"hi Example guifg=NONE guibg=#ff0000 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE

" Custom Color Groups
highlight WhiteSpace ctermbg=NONE ctermfg=244

highlight Braces ctermfg=249
highlight Error ctermbg=13 ctermfg=black
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
highlight LineNr ctermfg=240 ctermbg=234
highlight VertSplit ctermfg=132 ctermbg=232
highlight PmenuThumb ctermfg=red ctermbg=132
highlight CursorLineNr ctermfg=132 ctermbg=234
highlight Scrollbar ctermfg=red ctermbg=blue
highlight! link SpellBad Error
highlight! link ErrorMsg Error
highlight! link WarningMsg Error
highlight Search term=reverse ctermfg=black ctermbg=13
highlight PmenuSbar ctermfg=green ctermbg=black
highlight PmenuSel ctermfg=magenta ctermbg=black
highlight SignColumn ctermbg=darkgrey guibg=darkgrey
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


" ********************************************************************************
" Cursor ************************************************************************
" ********************************************************************************

set guicursor=n-v-c:block-Cursor
set guicursor+=n-v-c:blinkwait10
set guicursor+=i:ver100-iCursor
set guicursor+=i:blinkwait90


" ********************************************************************************
" Status Message *****************************************************************
" ********************************************************************************

set laststatus=2 " Always show status line

" clear out status line
set statusline=

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
set statusline+=\ 📜\ %2c\ ⋈\ %-l

" cursor line, total lines
set statusline+=\ of\ %L\ lines

" percentage
set statusline+=\ (%p%%)

" colorscheme
set statusline+=\ \ \ \ 🎨\ %{g:colors_name}\ 


" ********************************************************************************
" Mappings ***********************************************************************
" ********************************************************************************

nmap <C-b> :tabprevious<cr>

nmap <C-n> :tabnext<cr>

nmap <C-t> :tabnew<cr>

" <CTRL+h> Focus on pane to left
nmap <C-h> <C-w>h

" <CTRL+h> Focus on pane down
nmap <C-j> <C-w>j

" <CTRL+h> Focus on pane up
nmap <C-k> <C-w>k

" <CTRL+h> Focus on pane to right
nmap <C-l> <C-w>l

" <=> Equal sized panes
nmap = <C-w>=

" normal mode: save
nnoremap <c-s> :w<cr>

" insert mode: escape to normal and save
inoremap <c-s> <esc>:w<cr>

" visual mode: escape to normal and save
vnoremap <c-s> <esc>:w<cr>


" Map semi-colon to colon (no need to press <SHIFT>
nmap ; :

" https://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting

" MAJOR MOUSE PROBLEMS
" nnoremap <esc> :nohlsearch<cr>


" ********************************************************************************
" Functions **********************************************************************
" ********************************************************************************

" --------------------------------------------------------------------------------
" Interactive Status.
" --------------------------------------------------------------------------------

function! DevPunks()

  " (n) Normal mode
  " (v) Visual mode
  " (i) Insert mode
  " (c) Command-line mode
  " (h) all previous modes when in a help file
  " (a) all previous modes
  " (r) for |hit-enter| prompt
  echom mode()
  if mode() == 'i'
    highlight statusline guibg=green ctermbg=green
  elseif mode() == 'n'
    highlight StatusLine ctermbg=blue
  elseif mode() == 'r'
    highlight StatusLine ctermbg=yellow
  elseif mode() == 'c'
    highlight StatusLine ctermbg=132
  elseif mode() == 'v'
    highlight StatusLine ctermbg=red
  elseif mode() == 'V'
    highlight StatusLine ctermbg=red
  else

  endif
endfunction

" autocmd InsertEnter * call DevPunks()
" autocmd InsertLeave * call DevPunks()

autocmd InsertEnter * highlight! link StatusLine InsertColor
autocmd InsertLeave * highlight! link StatusLine NormalColor

" --------------------------------------------------------------------------------
" Zoom / Restore window.
" --------------------------------------------------------------------------------

function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> + :ZoomToggle<cr>

" https://vim.fandom.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
function! HighlightGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

command! Colors call HighlightGroup()
