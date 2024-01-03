" devPunks😈Mono (Black & White)

" Maintainer:   Ahmid-Ra <https://github.com/snuggs>

highlight clear
syntax reset

" if exists("syntax_on") | syntax reset | endif

let g:colors_name="devPunks😈Mono"

" TODO: Foo


highlight! SignColumn   cterm=standout ctermbg=0
highlight! LineNr       cterm=NONE      ctermfg=8
highlight! CursorLineNr cterm=standout ctermfg=7
highlight! CursorColumn cterm=bold ctermfg=7 ctermbg=8
highlight! ColorColumn  cterm=strikethrough ctermbg=NONE ctermfg=cyan

verbose highlight! default FoldColumn
highlight! Folded         cterm=standout       ctermfg=NONE

highlight! Todo           cterm=standout       ctermfg=NONE
highlight! Error          cterm=standout       ctermfg=blue
highlight! NonText        cterm=bold           ctermfg=NONE
highlight! Question       cterm=standout       ctermfg=NONE
highlight! Directory      cterm=bold           ctermfg=NONE

highlight! VertSplit      cterm=reverse        ctermfg=NONE

highlight! ErrorMsg       cterm=standout       ctermfg=NONE
highlight! SpecialKey     cterm=bold           ctermfg=NONE

highlight! Title          cterm=bold           ctermfg=NONE
highlight! Visual         cterm=reverse        ctermfg=NONE
highlight! StatusLine     cterm=bold,reverse   ctermfg=NONE
highlight! StatusLineNC   cterm=reverse        ctermfg=NONE

highlight! Search         cterm=reverse        ctermfg=NONE
highlight! IncSearch      cterm=reverse        ctermfg=NONE
highlight! MoreMsg        cterm=bold           ctermfg=NONE
highlight! ModeMsg        cterm=bold           ctermfg=NONE
highlight! WildMenu       cterm=standout       ctermfg=NONE
highlight! WarningMsg     cterm=standout       ctermfg=NONE

highlight! VisualNOS      cterm=bold,underline ctermfg=NONE

highlight! DiffAdd        cterm=bold           ctermfg=NONE
highlight! DiffChange     cterm=bold           ctermfg=NONE
highlight! DiffDelete     cterm=bold           ctermfg=NONE
highlight! DiffText       cterm=reverse        ctermfg=NONE

highlight! Type           cterm=reverse,bold,underline ctermfg=grey
highlight! Identifier     cterm=bold           ctermfg=grey

highlight! Ignore         cterm=bold           ctermfg=NONE
highlight! Special        cterm=bold           ctermfg=NONE
  highlight! link Delimiter Special
  highlight! link PreProc Special
highlight! Comment        cterm=italic        ctermfg=8
highlight! Constant       cterm=italic,underline        ctermfg=7
" highlight! String       cterm=underline      ctermfg=red
highlight! Statement      cterm=NONE           ctermfg=NONE
highlight! Underlined     cterm=underline      ctermfg=NONE
