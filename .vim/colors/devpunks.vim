" =========================================================================
" devPunks😈deFault

" Maintainer:   devPunks <https://github.com/devpunks>

" fonts.sh
"  EMOJI:
"    - https://gist.github.com/nicolasdao/8f0220d050f585be1b56cc615ef6c12e
"  NERDFONT:
"    - https://wiki.termux.com/wiki/Termux:Styling
"    - https://github.com/termux/termux-styling/issues/20
"    - https://yalneb.blogspot.com/2018/01/fancy-bash-promt.html
"    - https://github.com/ryanoasis/nerd-fonts/wiki/FAQ-and-Troubleshooting#tldr
"    - https://stackoverflow.com/questions/32443522/triangular-background-for-bash-ps1-prompt
" =========================================================================

highlight clear
if exists("syntax_on")
  syntax reset
  syntax clear
  syntax reset
  syntax enable
  syntax on
endif

if 'dark' == &background " Convert to ternary
  " Auto-Dark Mode https://arslan.io/2021/02/15/automatic-dark-mode-for-terminal-applications
  echom 'dark'
elseif 'light' == &background
  echom 'light'
endif

let g:colors_name="devPunks😈Mono"

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

" TODO: Foo
highlight! Todo cterm=standout,italic,underline ctermfg=NONE ctermbg=NONE

" Diff
highlight! DiffAdd    ctermfg=7
highlight! DiffDelete ctermfg=7
highlight! DiffChange ctermfg=8
highlight! DiffText   ctermfg=NONE

" Popups
highlight! PmenuSbar cterm=NONE ctermbg=NONE
highlight! PmenuSel ctermfg=NONE ctermbg=NONE
highlight! Pmenu cterm=standout ctermfg=NONE ctermbg=NONE
highlight! link PmenuThumb Pmenu
highlight! WildMenu cterm=standout ctermfg=NONE ctermbg=NONE

" Search
highlight! Search cterm=reverse ctermfg=NONE ctermbg=NONE
  highlight! link IncSearch Search
highlight! CurSearch cterm=standout,underline ctermfg=NONE ctermbg=NONE
highlight! ModeMsg cterm=reverse,italic ctermfg=NONE ctermbg=NONE
  highlight! link MoreMsg ModeMsg

" Error Warnings
highlight! WarningMsg cterm=standout ctermfg=NONE
highlight! Error  cterm=standout,bold,italic,underline  ctermbg=NONE ctermfg=NONE
  highlight! link ErrorMsg Error
highlight SpellBad cterm=strikethrough ctermbg=NONE
  highlight! link SpellCap SpellBad
  highlight! link SpellRare SpellBad
  highlight! link SpellLocal SpellBad

" Gutter
highlight! Cursor cterm=NONE ctermfg=7
highlight! LineNr cterm=NONE ctermfg=NONE ctermbg=NONE
  highlight! link SignColumn LineNr
highlight! CursorLineNr cterm=standout,bold ctermfg=NONE
highlight! FoldColumn cterm=bold ctermfg=NONE ctermbg=NONE
highlight! Folded cterm=bold,underline,italic ctermfg=NONE ctermbg=NONE
highlight! CursorColumn cterm=underline ctermfg=NONE ctermbg=NONE
highlight! ColorColumn cterm=strikethrough,italic ctermbg=NONE ctermfg=8
highlight! StatusLine cterm=bold,reverse ctermfg=grey
highlight! StatusLineNC cterm=reverse ctermfg=8
highlight! VertSplit cterm=NONE ctermfg=NONE

" Tabs
highlight! TabLineFill cterm=reverse ctermfg=NONE ctermbg=NONE
highlight! TabLineSel cterm=bold,underline ctermfg=NONE ctermbg=NONE
highlight! TabLine cterm=reverse,italic ctermfg=NONE ctermfg=NONE ctermbg=NONE

" Navigation
highlight! Title cterm=bold ctermfg=NONE
highlight! Directory cterm=bold,underline ctermfg=NONE
highlight! Visual cterm=standout,bold,underline,italic ctermbg=NONE
highlight! Conceal cterm=standout,bold,underline,ctermfg=cyan ctermbg=NONE
highlight! Question cterm=standout ctermfg=NONE

" Syntax
" https://stackoverflow.com/questions/24232354/vim-set-color-for-listchars-tabs-and-spaces
highlight! Special cterm=bold ctermfg=NONE
  highlight! link SpecialKey Special " nbsp|tab|trail
  highlight! link NonText Special " eol|extends
highlight! Ignore ctermfg=NONE
highlight! Comment cterm=italic ctermfg=NONE
highlight! Statement cterm=bold ctermfg=NONE
highlight! PreProc cterm=underline ctermfg=NONE
highlight! Type cterm=reverse,bold ctermfg=NONE
highlight! Underlined cterm=underline ctermfg=NONE
highlight! Constant cterm=underline,italic ctermfg=NONE
highlight! Identifier cterm=bold,underline ctermfg=NONE
