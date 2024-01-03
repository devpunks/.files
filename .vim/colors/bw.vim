" devPunks😈Mono (Black & White)

" Maintainer:   Ahmid-Ra <https://github.com/snuggs>

"highlight clear
"syntax reset

" if exists("syntax_on") | syntax reset | endif

let g:colors_name="devPunks😈Mono"

" TODO: Foo

highlight Normal cterm=NONE ctermfg=NONE ctermbg=NONE

highlight! SignColumn   cterm=NONE ctermbg=NONE ctermfg=NONE
highlight! LineNr       cterm=NONE      ctermfg=8
highlight! CursorLineNr cterm=standout ctermfg=darkgrey
highlight! CursorColumn cterm=bold ctermfg=7 ctermbg=8
highlight! ColorColumn  cterm=strikethrough ctermbg=NONE ctermfg=8

highlight! Folded     cterm=bold,underline ctermfg=NONE ctermbg=NONE
highlight! FoldColumn cterm=bold   ctermfg=NONE ctermbg=NONE
highlight! VertSplit      cterm=reverse        ctermfg=NONE
highlight! StatusLine     cterm=bold,reverse   ctermfg=7
highlight! StatusLineNC   cterm=reverse        ctermfg=8
highlight! EndOfBuffer cterm=NONE ctermbg=NONE ctermfg=NONE

highlight! Todo   cterm=standout,bold,underline ctermbg=NONE ctermfg=8
highlight! Error  cterm=standout,bold,italic,underline  ctermbg=NONE ctermfg=NONE
highlight! Question       cterm=standout       ctermfg=NONE
highlight! Directory      cterm=bold           ctermfg=NONE


highlight! ErrorMsg       cterm=standout       ctermfg=NONE

highlight! Title          cterm=bold           ctermfg=NONE
highlight! Visual         cterm=reverse        ctermfg=NONE

highlight! Search         cterm=reverse        ctermfg=NONE
highlight! IncSearch      cterm=reverse        ctermfg=NONE
highlight! MoreMsg        cterm=bold           ctermfg=NONE
highlight! ModeMsg        cterm=bold           ctermfg=NONE
highlight! WildMenu       cterm=standout       ctermfg=NONE
highlight! WarningMsg     cterm=standout       ctermfg=NONE

highlight! VisualNOS      cterm=bold,underline ctermfg=NONE

highlight DiffAdd    ctermfg=7
highlight DiffDelete ctermfg=7
highlight DiffChange ctermfg=8
highlight DiffText   ctermfg=NONE

highlight! Type           cterm=reverse,bold,underline ctermfg=grey
highlight! Identifier     cterm=bold           ctermfg=grey

highlight! Ignore         cterm=bold           ctermfg=NONE

highlight! SpecialKey     cterm=bold ctermfg=NONE  ctermbg=NONE
highlight! SpecialKey     cterm=bold ctermfg=NONE  ctermbg=NONE
  highlight! link NonText SpecialKey
highlight! Special        cterm=bold           ctermfg=NONE
  highlight! link Delimiter Special
  highlight! link PreProc Special
highlight! Comment        cterm=italic        ctermfg=8
highlight! Constant       cterm=italic,underline        ctermfg=7
highlight! Statement      cterm=NONE           ctermfg=NONE
highlight! Underlined     cterm=underline      ctermfg=NONE
