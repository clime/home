" Vim color file -- candycode
" Maintainer:   Justin Constantino <goflyapig-at-gmail-com>
" Last Change:  2006 Aug 12

set background=dark
highlight clear
let g:colors_name="candycode"

let save_cpo = &cpo
set cpo&vim

" basic highlight groups (:help highlight-groups) {{{

" text {{{

"hi Normal       guifg=#ffffff       guibg=#050505       gui=NONE
"            \   ctermfg=white       ctermbg=black       cterm=NONE

hi Folded       guifg=#c2bfa5       guibg=#050505       gui=underline
            \   ctermfg=lightgray   ctermbg=black       cterm=NONE

hi LineNr       guifg=#928c75       guibg=NONE          gui=NONE
            \   ctermfg=darkgray    ctermbg=NONE        cterm=NONE

hi Directory    guifg=#00bbdd       guibg=NONE          gui=NONE
            \   ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi NonText      guifg=#77ff22       guibg=NONE          gui=bold
            \   ctermfg=yellow      ctermbg=NONE        cterm=NONE
hi SpecialKey   guifg=#559933       guibg=NONE          gui=NONE
            \   ctermfg=green       ctermbg=NONE        cterm=NONE

hi SpellBad     guifg=NONE          guibg=NONE          gui=undercurl
            \   ctermfg=white       ctermbg=darkred     guisp=#ff0011
hi SpellCap     guifg=NONE          guibg=NONE          gui=undercurl
            \   ctermfg=white       ctermbg=darkblue    guisp=#0044ff
hi SpellLocal   guifg=NONE          guibg=NONE          gui=undercurl
            \   ctermfg=black       ctermbg=cyan        guisp=#00dd99   
hi SpellRare    guifg=NONE          guibg=NONE          gui=undercurl
            \   ctermfg=white       ctermbg=darkmagenta guisp=#ff22ee   

hi DiffAdd      guifg=#ffffff       guibg=#126493       gui=NONE
            \   ctermfg=white       ctermbg=darkblue    cterm=NONE
hi DiffChange   guifg=#000000       guibg=#976398       gui=NONE
            \   ctermfg=black       ctermbg=darkmagenta cterm=NONE
hi DiffDelete   guifg=#000000       guibg=#be1923       gui=bold
            \   ctermfg=black       ctermbg=red         cterm=bold
hi DiffText     guifg=#ffffff       guibg=#976398       gui=bold
            \   ctermfg=white       ctermbg=green       cterm=bold

" }}}
" borders / separators / menus {{{

hi FoldColumn   guifg=#c8bcb9       guibg=#786d65       gui=bold            
            \   ctermfg=lightgray   ctermbg=darkgray    cterm=NONE
hi SignColumn   guifg=#c8bcb9       guibg=#786d65       gui=bold
            \   ctermfg=0           ctermbg=0           cterm=NONE

hi Pmenu        guifg=#000000       guibg=#a6a190       gui=NONE
            \   ctermfg=white       ctermbg=darkgray    cterm=NONE
hi PmenuSel     guifg=#ffffff       guibg=#133293       gui=NONE
            \   ctermfg=white       ctermbg=lightblue   cterm=NONE
hi PmenuSbar    guifg=NONE          guibg=#555555       gui=NONE
            \   ctermfg=black       ctermbg=black       cterm=NONE
hi PmenuThumb   guifg=NONE          guibg=#cccccc       gui=NONE
            \   ctermfg=gray        ctermbg=gray        cterm=NONE

hi StatusLine   guifg=#000000       guibg=#c2bfa5       gui=bold    
            \   ctermfg=black       ctermbg=white       cterm=bold
hi StatusLineNC guifg=#444444       guibg=#c2bfa5       gui=NONE    
            \   ctermfg=darkgray    ctermbg=white       cterm=NONE
hi WildMenu     guifg=#ffffff       guibg=#133293       gui=bold
            \   ctermfg=white       ctermbg=darkblue    cterm=bold
hi VertSplit    guifg=#000000       guibg=#ffffff       gui=NONE
            \   ctermfg=lightgray   ctermbg=black       cterm=NONE

hi TabLine      guifg=#000000       guibg=#c2bfa5       gui=NONE
            \   ctermfg=black       ctermbg=white       cterm=NONE
hi TabLineFill  guifg=#000000       guibg=#c2bfa5       gui=NONE
            \   ctermfg=black       ctermbg=white       cterm=NONE
hi TabLineSel   guifg=#ffffff       guibg=#133293       gui=NONE
            \   ctermfg=white       ctermbg=black       cterm=NONE

"hi Menu
"hi Scrollbar
"hi Tooltip

" }}}
" cursor / dynamic / other {{{

hi Cursor       guifg=#000000       guibg=#ffff99       gui=NONE
            \   ctermfg=black       ctermbg=white       cterm=NONE
hi CursorIM     guifg=#000000       guibg=#aaccff       gui=NONE
            \   ctermfg=black       ctermbg=white       cterm=reverse
hi CursorLine   guifg=NONE          guibg=#1b1b1b       gui=NONE
            \   ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi CursorColumn guifg=NONE          guibg=#1b1b1b       gui=NONE
            \   ctermfg=NONE        ctermbg=NONE        cterm=NONE

hi Visual       guifg=#ffffff       guibg=#606070       gui=NONE
            \   ctermfg=white       ctermbg=lightblue   cterm=NONE

hi IncSearch    guifg=#000000       guibg=#eedd33       gui=bold 
            \   ctermfg=white       ctermbg=yellow      cterm=NONE
hi Search       guifg=#efefd0       guibg=#937340       gui=NONE
            \   ctermfg=white       ctermbg=darkgreen   cterm=NONE

hi MatchParen   guifg=NONE          guibg=#3377aa       gui=NONE
            \   ctermfg=white       ctermbg=blue        cterm=NONE

"hi VisualNOS

" }}}
" listings / messages {{{

hi ModeMsg      guifg=#eecc18       guibg=NONE          gui=NONE
            \   ctermfg=yellow      ctermbg=NONE        cterm=NONE
hi Title        guifg=#dd4452       guibg=NONE          gui=bold
            \   ctermfg=red         ctermbg=NONE        cterm=bold
hi Question     guifg=#66d077       guibg=NONE          gui=NONE
            \   ctermfg=green       ctermbg=NONE        cterm=NONE
hi MoreMsg      guifg=#39d049       guibg=NONE          gui=NONE
            \   ctermfg=green       ctermbg=NONE        cterm=NONE

hi ErrorMsg     guifg=#ff0000       guibg=#000000       gui=bold
            \   ctermfg=red         ctermbg=black       cterm=bold
hi WarningMsg   guifg=#ccae22       guibg=NONE          gui=bold    
            \   ctermfg=yellow      ctermbg=NONE        cterm=bold

" }}}

" }}}
" syntax highlighting groups (:help group-name) {{{

hi Comment      guifg=#ff9922       guibg=NONE          gui=NONE
            \   ctermfg=cyan        ctermbg=NONE        cterm=bold

hi Constant     guifg=#ff6050       guibg=NONE          gui=NONE
            \   ctermfg=red         ctermbg=NONE        cterm=NONE

hi Operator     guifg=#ff6050       guibg=NONE          gui=NONE
            \   ctermfg=brown       ctermbg=NONE       cterm=bold

hi Boolean      guifg=#ff6050       guibg=NONE          gui=bold  
            \   ctermfg=red         ctermbg=NONE        cterm=bold

hi Identifier   guifg=#eecc44       guibg=NONE          gui=NONE
            \   ctermfg=yellow      ctermbg=NONE        cterm=NONE

hi Statement    guifg=#66d077       guibg=NONE          gui=bold
            \   ctermfg=brown       ctermbg=NONE        cterm=bold

hi PreProc      guifg=#bb88dd       guibg=NONE          gui=NONE
            \   ctermfg=magenta     ctermbg=NONE        cterm=NONE

hi Type         guifg=#4093cc       guibg=NONE          gui=bold
            \   ctermfg=lightblue   ctermbg=NONE        cterm=bold

hi Special      guifg=#9999aa       guibg=NONE          gui=bold  
            \   ctermfg=lightgray   ctermbg=NONE        cterm=bold

hi Underlined   guifg=#80a0ff       guibg=NONE          gui=underline
            \   ctermfg=NONE        ctermbg=NONE        cterm=NONE
            \   term=underline 

hi Ignore       guifg=#888888       guibg=NONE          gui=NONE
            \   ctermfg=darkgray    ctermbg=NONE        cterm=NONE

hi Error        guifg=#ff0000       guibg=#000000       gui=NONE
            \   ctermfg=red         ctermbg=black       cterm=NONE

hi Todo         guifg=#ffffff       guibg=#ee7700       gui=bold
            \   ctermfg=black       ctermbg=yellow      cterm=bold

" }}}

let &cpo = save_cpo

" vim: fdm=marker fdl=0

" clime: autocompletion menu style (only cterm colors are customized)
hi Pmenu        guifg=#00ffff guibg=#000000            ctermfg=15  ctermbg=52
hi PmenuSel     guifg=#ffff00 guibg=#000000 gui=bold   ctermfg=3   ctermbg=2 cterm=bold
hi PmenuSbar    guibg=#204d40                                      ctermbg=7
hi PmenuThumb   guifg=#38ff56                                      ctermbg=3
