"
"  ██████╗ ███████╗██╗   ██╗██████╗ ██╗   ██╗███╗   ██╗██╗  ██╗███████╗
"  ██╔══██╗██╔════╝██║   ██║██╔══██╗██║   ██║████╗  ██║██║ ██╔╝██╔════╝
"  ██║  ██║█████╗  ██║   ██║██████╔╝██║   ██║██╔██╗ ██║█████╔╝ ███████╗
"  ██║  ██║██╔══╝  ╚██╗ ██╔╝██╔═══╝ ██║   ██║██║╚██╗██║██╔═██╗ ╚════██║
"  ██████╔╝███████╗ ╚████╔╝ ██║     ╚██████╔╝██║ ╚████║██║  ██╗███████║
"  ╚═════╝ ╚══════╝  ╚═══╝  ╚═╝      ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝
"                "A cyberPunk, dark color scheme for Vim"

" -------------------------------------------------------------------------
" Version: 0.1
" File: devpunks.vim
" Source: https://github.com/devpunks
" Author: Ahmid-Ra (github.com/snuggs)
" Maintainer: devPunks <https://github.com/devpunks>
" Description: Default terminal colorscheme and typography
" -------------------------------------------------------------------------
"
" EMOJI:
"   - https://gist.github.com/nicolasdao/8f0220d050f585be1b56cc615ef6c12e
" NERDFONT:
"   - https://wiki.termux.com/wiki/Termux:Styling
"   - https://github.com/termux/termux-styling/issues/20
"   - https://yalneb.blogspot.com/2018/01/fancy-bash-promt.html
"   - https://github.com/ryanoasis/nerd-fonts/wiki/FAQ-and-Troubleshooting#tldr
"   - https://stackoverflow.com/questions/32443522/triangular-background-for-bash-ps1-prompt
" =========================================================================

highlight clear
if exists('g:colors_name') | unlet g:colors_name | endif
if exists('syntax_on')
  syntax clear
  syntax reset
  syntax enable " on
endif
"let g:colors_name='devPunks😈Mono'
let g:colors_name='devpunks'

if 'dark' == &background " Convert to ternary
  " Auto-Dark Mode https://arslan.io/2021/02/15/automatic-dark-mode-for-terminal-applications
  echom 'dark'
elseif 'light' == &background
  echom 'light'
endif

" Italic Font ???
" https://stackoverflow.com/a/30937851/173208
let &t_ZH="\e[3m" " italics start
let &t_ZR="\e[23m" " italics  end
let &t_Cs = "\e[4:3m" " UnderCurl start
let &t_Ce = "\e[4:0m" " Reset
let &t_Us = "\e[4:2m" " UnderDouble
let &t_ds = "\e[4:4m" " UnderDotted
let &t_Ds = "\e[4:5m" " UnderDashed

" Base Default - https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
highlight! Normal cterm=NONE ctermfg=NONE ctermbg=NONE

" Diff
" highlight! DiffAdd    ctermfg=3
" highlight! DiffDelete ctermfg=1
" highlight! DiffChange ctermfg=2
highlight! DiffAdd    term=reverse cterm=reverse ctermfg=NONE gui=reverse guifg=green
highlight! DiffChange term=reverse cterm=reverse ctermfg=NONE gui=reverse guifg=yellow
highlight! DiffDelete term=reverse cterm=reverse ctermfg=NONE gui=reverse guifg=red
highlight! DiffText   term=reverse cterm=reverse ctermfg=NONE gui=reverse guifg=NONE

" Error Warnings
highlight! WarningMsg cterm=standout ctermfg=NONE
highlight! Error  cterm=standout,bold,italic,underline  ctermbg=NONE ctermfg=NONE
  highlight! link ErrorMsg Error
highlight SpellBad cterm=strikethrough ctermbg=NONE
  highlight! link SpellCap SpellBad
  highlight! link SpellRare SpellBad
  highlight! link SpellLocal SpellBad

" Popups
highlight! PmenuSbar cterm=NONE ctermbg=NONE
highlight! PmenuSel ctermfg=NONE ctermbg=NONE
highlight! Pmenu cterm=standout ctermfg=NONE ctermbg=NONE
  highlight! link PmenuThumb Pmenu
highlight! WildMenu cterm=standout ctermfg=NONE ctermbg=NONE

" Search
highlight! Search term=standout cterm=standout ctermfg=NONE ctermbg=NONE
  highlight! link IncSearch Search
highlight! CurSearch term=standout,underline cterm=standout,underline ctermfg=NONE ctermbg=NONE
highlight! ModeMsg cterm=reverse,italic ctermfg=NONE ctermbg=NONE
  highlight! link MoreMsg ModeMsg

" Gutter
highlight! Cursor cterm=NONE ctermfg=NONE
highlight! LineNr cterm=NONE ctermfg=NONE ctermbg=NONE guifg=NONE
  highlight! link SignColumn LineNr
highlight! CursorLine term=underline cterm=underline gui=underline ctermbg=NONE guibg=NONE
highlight! CursorLineNr cterm=bold,reverse ctermfg=NONE gui=bold guifg=NONE
highlight! FoldColumn term=bold cterm=bold ctermfg=NONE ctermbg=NONE gui=bold guifg=NONE guibg=NONE
highlight! Folded term=bold cterm=bold,underline,italic ctermfg=NONE ctermbg=NONE gui=bold guifg=NONE guibg=NONE
highlight! CursorColumn cterm=underline gui=underline ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
highlight! ColorColumn term=strikethrough,italic cterm=strikethrough,italic ctermbg=NONE ctermfg=NONE gui=strikethrough,italic guifg=NONE guibg=NONE

highlight! VertSplit cterm=NONE ctermfg=NONE
highlight! StatusLineNC term=NONE,bold cterm=NONE,bold gui=NONE,bold
highlight! StatusLine term=reverse,bold cterm=reverse,bold gui=reverse,bold

" Tabs
highlight! TabLineFill cterm=reverse ctermfg=NONE ctermbg=NONE
highlight! TabLineSel cterm=bold,underline ctermfg=NONE ctermbg=NONE
highlight! TabLine term=reverse,italic cterm=reverse,italic ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE

" Navigation
highlight! Question cterm=standout ctermfg=NONE
highlight! Title cterm=bold ctermfg=NONE guifg=NONE
highlight! Directory cterm=bold,underline ctermfg=NONE
highlight! Visual cterm=standout,bold,underline,italic ctermbg=NONE
highlight! Conceal cterm=standout,bold,underline ctermfg=cyan ctermbg=NONE gui=standout,bold,underline guifg=cyan guibg=NONE

" Syntax
" TODO: Foo
highlight! Todo term=bold,italic,underline cterm=bold,italic,underline ctermfg=NONE ctermbg=NONE gui=bold,italic,underline guifg=NONE guibg=NONE
  highlight! link PreProc Todo
" https://stackoverflow.com/questions/24232354
highlight! Special term=bold cterm=bold ctermfg=NONE gui=bold guifg=NONE
  highlight! link SpecialKey Special " nbsp|tab|trail
  highlight! link NonText Special " eol|extends
highlight! Ignore ctermfg=NONE
highlight! Comment cterm=italic ctermfg=NONE
highlight! Statement cterm=bold ctermfg=NONE
highlight! Type cterm=reverse,bold ctermfg=NONE
highlight! Underlined cterm=underline ctermfg=NONE
highlight! Constant cterm=underline,italic ctermfg=NONE
highlight! Identifier cterm=bold,underline ctermfg=NONE

echom 'Loaded devPunks😈Mono colorscheme!'
