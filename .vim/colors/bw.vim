" devPunks😈Mono (Black & White)

" Maintainer:   Ahmid-Ra <https://github.com/snuggs>

highlight clear
if exists("syntax_on")
  syntax reset
  syntax clear
  syntax reset
  syntax enable
  syntax on
endif

if 'dark' == &background " Convert to ternary
  echo 'dark'
elseif 'light' == &background
  echo 'light'
endif

let g:colors_name="devPunks😈Mono"

" Base Default
highlight! Normal cterm=NONE ctermfg=NONE ctermbg=NONE

" TODO: Foo
highlight! Todo cterm=standout,italic,underline ctermfg=8 ctermbg=NONE

" Diff
highlight! DiffAdd    ctermfg=7
highlight! DiffDelete ctermfg=7
highlight! DiffChange ctermfg=8
highlight! DiffText   ctermfg=NONE

" Popups
highlight! Pmenu NONE
highlight! PmenuSel NONE
highlight! PmenuKind NONE
highlight! PmenuKindSel NONE
highlight! PmenuExtra NONE
highlight! PmenuExtraSel NONE
highlight! PmenuThumb NONE
highlight! PmenuSbar NONE
highlight! WildMenu cterm=standout ctermfg=NONE ctermbg=NONE

" Search
highlight! Search cterm=reverse ctermfg=NONE ctermbg=NONE
  highlight! link IncSearch Search
highlight! CurSearch cterm=standout,underline ctermfg=red ctermbg=NONE
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
highlight! LineNr cterm=NONE ctermfg=8
highlight! CursorLineNr cterm=standout ctermfg=darkgrey ctermbg=NONE
highlight! ColorColumn  cterm=strikethrough ctermbg=NONE ctermfg=8
highlight! CursorColumn cterm=underline ctermfg=NONE ctermbg=NONE
highlight! Folded cterm=bold,underline ctermfg=NONE ctermbg=NONE
highlight! SignColumn cterm=NONE ctermbg=NONE ctermfg=NONE
highlight! FoldColumn cterm=bold ctermfg=NONE ctermbg=NONE
highlight! StatusLine cterm=bold,reverse ctermfg=grey
highlight! StatusLineNC cterm=reverse ctermfg=8
highlight! VertSplit cterm=NONE ctermfg=8

" Tabs
highlight! TabLine cterm=reverse,italic ctermfg=NONE ctermfg=NONE ctermbg=NONE
highlight! TabLineFill cterm=reverse ctermfg=NONE ctermbg=NONE
highlight! TabLineSel cterm=bold,underline ctermfg=NONE ctermbg=NONE

" Navigation
highlight! Title cterm=bold ctermfg=NONE
highlight! Directory cterm=bold ctermfg=NONE
highlight! Visual cterm=reverse ctermbg=NONE
highlight! Question cterm=standout ctermfg=NONE

" Syntax
highlight! Special cterm=bold ctermfg=NONE
  highlight! link SpecialKey Special
  highlight! link NonText Special
highlight! Ignore ctermfg=NONE
highlight! Conceal ctermfg=NONE ctermbg=NONE
highlight! Comment cterm=italic ctermfg=NONE
highlight! Statement cterm=bold ctermfg=NONE
highlight! PreProc cterm=underline,italic ctermfg=NONE
highlight! Type cterm=reverse,bold ctermfg=NONE
highlight! Underlined cterm=underline ctermfg=NONE
highlight! Constant cterm=underline,italic ctermfg=NONE
highlight! Identifier cterm=bold,underline ctermfg=NONE
