set encoding=utf-8

" https://github.com/airblade/vim-gitgutter/commit/8db2fc5
" https://vi.stackexchange.com/questions/10897/how-do-i-customize-vimdiff-colors
highlight DiffAdd ctermfg=green guifg=green
highlight DiffDelete ctermfg=red guifg=red
highlight DiffChange ctermfg=yellow guifg=yellow
highlight LineNr ctermbg=234 guibg=darkgray

function s:get_color(group, attr)
  " https://www.reddit.com/r/neovim/comments/oxddk9/how_do_i_get_the_value_from_a_highlight_group/
  return synIDattr( synIDtrans( hlID(a:group)), a:attr)
endfunction
let s:gutter_bg=s:get_color('LineNr', 'bg#')

echom "Gutter bg: ".s:gutter_bg

execute "hi SignColumn guibg=NONE ctermbg=".s:gutter_bg
execute "hi CursorLineNr guibg=NONE ctermbg=".s:gutter_bg

verbose hi LineNr
verbose hi CursorLineNr
verbose hi SignColumn
for type in ["Add", "Delete", "Change"]
  echom "GitGutter".type." - ".hlexists("GitGutter".type)

  execute "hi GitGutter".type." guibg=NONE ctermbg=".s:gutter_bg
  execute "verbose hi GitGutter".type
endfor


" ********************************************************************************
" Author: Ahmid-Ra (github.com/snuggs)

" Screencasts: http://vimcasts.org

" Gist - https://gist.github.com/snuggs/612093

" Tutorial - http://learnvimscriptthehardway.stevelosh.com
" Idiomatic .vimrc - https://github.com/romainl/idiomatic-vimrc

" ********************************************************************************

let g:skip_defaults_vim=1

" - Notes ----------------------------
"   - Test executables - https://renenyffenegger.ch/notes/development/vim/script/vimscript/functions/executable
"   - https://til.hashrocket.com/posts/qll3kizlzj-check-that-an-executable-exists-on-the-path

if executable('termux-info')
  echom "SHAZAMMM IN TERMUX"
" call system('termux-info')
endif

" Buffers ---------------------------
set nohidden " possibly overridden by ZoomWinhttps://vimtricks.com/p/what-is-set-hidden/
command Flush :up | %bd | e# " https://vimtricks.com/p/closing-hidden-buffers/

" Views, Sessions, Viminfo ------------------------------------
"   - https://vimtricks.com/p/saving-session-state/
"   - https://learnvim.irian.to/basics/views_sessions_viminfo
set viewoptions+=localoptions
set viewdir=$HOME/.vim/view

set sessionoptions+=resize,winpos

set viminfofile=$HOME/.vim/.viminfo
set viminfo="NONE" " disable .viminfo
" autocmd VimLeave * call delete('~/.viminfo')
autocmd VimLeave * echom "PEAAAACE"


" ********************************************************************************
" Settings ***********************************************************************
" ********************************************************************************

" - https://gist.github.com/romainl/7e2b425a1706cd85f04a0bd8b3898805
" - https://stackoverflow.com/questions/2288756/how-to-set-working-current-directory-in-vim
" set path+=$PWD/** " slowwwwwwwwwwwwwwwwwwwwwwww

syntax on " turns syntax highlighting on

if &compatible
  set nocompatible " = https://stackoverflow.com/questions/5845557/in-a-vimrc-is-set-nocompatible-completely-useless
endif

set complete-=i
set nomodeline "Ignore file mode lines
"set shell " The shell used to execute commands
set showcmd " show current command prompt suffix
set spell " Enable spellchecking - https://vimtricks.com/p/vim-spell-check/

" increment formats
"   - https://vimtricks.com/p/vimtrick-increment-numbers/
"   - https://www.reddit.com/r/vim/comments/p18418/til_that_ctrlactrlx_can_incrementdecrement_a/
set nrformats-=octal
set nrformats+=alpha

" (Hopefully) Stop VIM from crashing
" https://superuser.com/questions/810622/vim-crashes-freezes-on-specific-files-mac-osx-mavericks#answer-810866
" 200
:set synmaxcol=256 " https://github.com/tpope/vim-sensible/issues/142
" https://vimtricks.com/p/vim-line-length-marker/
set colorcolumn=-8,-3 " vertical ruler - https://www.baeldung.com/linux/vim-ruler-on-specific-column
highlight ColorColumn ctermbg=233

set hlsearch " Highlight found search results
set incsearch " show partial search matches
set cursorline " highlight current cursor line
set cursorcolumn " highlight current cursor column
set noerrorbells " Display beep on errors
set autoread " re-read files if unmodified
set smartcase " Automatically search case-sensitive
set visualbell " Flash the screen instead of beeping errors
set showmatch matchtime=3 " jump to matching brace

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

set viewoptions-=options
set sessionoptions-=options

" disable sessions

" - Cursor ------------------------------------
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

" - Chrome -----------------------------------
set title " File currently being edited
set showtabline=2 " :help setting-tabline

if has("gui_running")
  " remove ugly toolbar :-)
  set guioptions=egmrt
endif

" - Gutter ------------------------------------
set number
set numberwidth=4 " gutter columns
set ruler " set cursor coordinates
set rulerformat=📏%P⏬%l⏩%c " overridden by statusline

if has('signs') " https://vimdoc.sourceforge.net/htmldoc/sign.html
  " - https://www.reddit.com/r/neovim/comments/neaeej/only_just_discovered_set_signcolumnnumber_i_like/
  " - https://stackoverflow.com/questions/15277241/changing-vim-gutter-color
  " - https://github.com/vim/vim/commit/394c5d8870b15150fc91a4c058dc571fd5eaa97e
  " set signcolumn=number " show sign instead of line number
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
"   - https://github.com/termux/termux-packages/issues/2308
"   - https://vimtricks.com/p/vimtrick-the-clipboard-register/
"   - https://stackoverflow.com/questions/11489428/how-to-make-vim-paste-from-and-copy-to-systems-clipboard
"   - https://www.reddit.com/r/termux/comments/c17rwf/how_to_paste_to_vim_from_external_clipboard/
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

" termux -----
" https://ibnishak.github.io/blog/post/copy-to-termux-clip/
if executable('*termux-clipboard-set')
  echom "SHAZAAAM FOUND CLIPBOARD"
else
  echom "Termux clipboard not found"
endif
" vnoremap <C-x> :!termux-clipboard-set<CR>
" vnoremap <C-c> :w !termux-clipboard-set<CR><CR>
" inoremap <C-v> <ESC>:read !termux-clipboard-get<CR>i

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
nnoremap <c-s> :w<cr>

" insert mode: escape to normal and save
inoremap <c-s> <esc>:w<cr>

" visual mode: escape to normal and save
vnoremap <c-s> <esc>:w<cr>


" Map semi-colon to colon (no need to press <SHIFT>
nnoremap ; :

" https://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting
" MAJOR MOUSE PROBLEMS
nnoremap <esc> :nohlsearch<cr>


" ********************************************************************************
" Files **************************************************************************
"   - Per type configuration - https://vimtricks.com/p/per-file-type-configs/
"   - autocommands - https://gist.github.com/romainl/6e4c15dfc4885cb4bd64688a71aa7063
" ********************************************************************************
filetype indent on " filetype - https://vimdoc.sourceforge.net/htmldoc/filetype.html

set autoindent

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
"   - http://vimcasts.org/episodes/hard-wrapping-text/
" --------------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.md set formatoptions-=t formatoptions+=n
autocmd BufNewFile,BufRead README set formatoptions-=t formatoptions+=n

" --------------------------------------------------------------------------------
" HTML
"   - https://vimtricks.com/p/vim-autocomplete-html-tags/
" --------------------------------------------------------------------------------
autocmd FileType html,eruby set omnifunc=htmlcomplete#CompleteTags

" --------------------------------------------------------------------------------
" CSS
"   - https://www.simplified.guide/vim/auto-complete-css
" --------------------------------------------------------------------------------
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd BufNewFile,BufRead *.sass,*.scss set filetype=css

" --------------------------------------------------------------------------------
" Javascript
"   - https://www.simplified.guide/vim/auto-complete-javascript
" --------------------------------------------------------------------------------
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.json,*.es,*.mjs,*.test set filetype=javascript

" --------------------------------------------------------------------------------
" Ruby
"   - https://stackoverflow.com/questions/15720313/vim-omnicomplete-with-ruby-only-partially-works/22805517#22805517
" --------------------------------------------------------------------------------
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead *.erb set filetype=eruby

" --------------------------------------------------------------------------------
" Python
"   - https://www.simplified.guide/vim/auto-complete-ruby
" --------------------------------------------------------------------------------
autocmd FileType python set omnifunc=python3complete#Complete

" --------------------------------------------------------------------------------
" Go
"   - https://www.simplified.guide/vim/auto-complete-ruby
" --------------------------------------------------------------------------------
autocmd FileType python set omnifunc=syntaxcomplete#Complete

" ********************************************************************************
" Plugins ************************************************************************
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

let g:NERDTreeBookmarksFile="$HOME/.vim/.NERDTreeBookmarks"
let g:NERDTreeShowHidden=1    " Show hidden files (I)
let g:NERDTreeShowBookmarks=1 " Show hidden files (I)
let g:NERDTreeDirArrowExpandable  = '📁' " Expandable directory
let g:NERDTreeDirArrowCollapsible = '📂' " Collapsible directory

" [ENTER] Opens Nerdtree
nnoremap <cr> :NERDTreeToggle<cr>

" Open NerdTree on VimEnter startup
"   | Selects `p`revious buffer to remove tree focus
autocmd VimEnter * NERDTreeToggle | wincmd p


finish


" ********************************************************************************
" Status Message *****************************************************************
" Word Count
"   - g<C-g> - https://vimtricks.com/p/count-words-and-lines/
"   - Status line - https://cromwell-intl.com/open-source/vim-word-count.html
" ********************************************************************************

set laststatus=2 " Always show status line
" set statusline=[fo=%{&fo}]

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
set statusline+=\ 📜\ ⏩%2c\ ⋈\ ⏬%-l

" cursor line, total lines
set statusline+=\ of\ %L\ LOC

" percentage
set statusline+=\ (%p%%)


" ********************************************************************************
" FONTS, COLORS & HIGHLIGHTS
"   - https://jonasjacek.github.io/colors
"   - Overrides - https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
"   - https://vi.stackexchange.com/questions/8751/how-to-completely-turn-off-colorscheme
" ********************************************************************************

set background=dark
try
  colorscheme jellybeans " Set color scheme
catch | endtry

let s:scheme = get(g:, 'colors_name', 'NONE')
set statusline+=\ \ \ \ 🎨\ %{s:scheme}\ 

" Italic Font ???
" https://stackoverflow.com/a/30937851/173208
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"
set t_Co=256 " enable 256 colors







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

" --Interactive Status -----------------------------
autocmd InsertEnter * highlight! link StatusLine InsertColor
autocmd InsertLeave * highlight! link StatusLine NormalColor


" ********************************************************************************
" Functions **********************************************************************
" ********************************************************************************
