" devPunks😈Mono (Black & White)

" Maintainer:   Ahmid-Ra <https://github.com/snuggs>

syntax clear
syntax reset
syntax enable
syntax on
" if exists("syntax_on") | syntax reset | endif
highlight clear

let g:colors_name="devPunks😈Mono"

highlight! Normal cterm=NONE ctermfg=NONE ctermbg=NONE

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

" Tabs
highlight! TabLine cterm=reverse,italic,underline ctermfg=NONE ctermfg=NONE ctermbg=NONE
highlight! TabLineFill cterm=reverse ctermfg=NONE ctermbg=NONE
highlight! TabLineSel cterm=bold ctermfg=NONE ctermbg=NONE

highlight! Special cterm=bold ctermfg=NONE
  highlight! link SpecialKey Special
  highlight! link NonText Special

" TODO: Foo
highlight! Todo cterm=standout,bold,underline ctermfg=8 ctermbg=NONE

" Error Warnings
highlight! WarningMsg cterm=standout ctermfg=NONE
highlight! Error  cterm=standout,bold,italic,underline  ctermbg=NONE ctermfg=NONE
  highlight! link ErrorMsg Error
highlight SpellBad cterm=reverse,underline ctermfg=magenta ctermbg=NONE
  highlight! link SpellCap SpellBad
  highlight! link SpellRare SpellBad
  highlight! link SpellLocal SpellBad

highlight! LineNr cterm=NONE ctermfg=8
highlight! SignColumn cterm=NONE ctermbg=NONE ctermfg=NONE
highlight! CursorLineNr cterm=standout ctermfg=darkgrey ctermbg=NONE
highlight! CursorColumn cterm=underline ctermfg=NONE ctermbg=NONE
highlight! ColorColumn  cterm=strikethrough ctermbg=NONE ctermfg=8

highlight! Folded cterm=bold,underline ctermfg=NONE ctermbg=NONE
highlight! FoldColumn cterm=bold ctermfg=NONE ctermbg=NONE
highlight! StatusLine cterm=bold,reverse ctermfg=grey
highlight! StatusLineNC cterm=reverse ctermfg=8
highlight! VertSplit cterm=NONE ctermfg=8

highlight! Title cterm=bold ctermfg=NONE
highlight! Directory cterm=bold ctermfg=NONE
highlight! Visual cterm=reverse ctermbg=NONE
highlight! Question cterm=standout ctermfg=NONE

highlight! Search         cterm=reverse        ctermfg=NONE
highlight! IncSearch      cterm=reverse        ctermfg=NONE
highlight! ModeMsg cterm=reverse,italic ctermfg=NONE ctermbg=NONE
  highlight! link MoreMsg ModeMsg
highlight! Identifier     cterm=bold           ctermfg=grey

highlight! VisualNOS      cterm=bold,underline ctermfg=NONE

highlight! Conceal cterm=NONE ctermfg=NONE
highlight! Comment cterm=italic ctermfg=NONE
highlight! Statement cterm=NONE ctermfg=NONE
highlight! Underlined cterm=underline ctermfg=cyan
highlight! Ignore cterm=bold ctermfg=NONE ctermbg=NONE
highlight! Constant cterm=italic,underline ctermfg=NONE
highlight! Type cterm=reverse,bold,underline ctermfg=NONE
