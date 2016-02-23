" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50      " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set incsearch       " do incremental searching
set sts=4           " allows backspacing four spaces at once
set ts=4
set sw=4
set noet
set nobk            " no backup files (file~)
set ai
set wildmenu
set nohls
set keywordprg=man\ -a
set visualbell t_vb=
set pastetoggle=<F10>
set tags=.tags;/
set noswf
set formatoptions+=r
set timeout ttimeoutlen=50
set ignorecase
set smartcase
colorscheme my-candycode

set clipboard=unnamedplus " yanking to/pasting from system clipboard!

filetype plugin on
filetype indent on

let mapleader = ","
let maplocalleader = ","

let python_highlight_all = 1

"TODO map this:
":noautocmd vimgrep /TODO/ **/*.py

"------- xmledit -------
let xml_tag_completion_map = ">>"

"------- visual search -------
vnoremap // y/<C-R>"<CR>

"------- folding -------
nnoremap <space> za

"au BufWinLeave * silent! mkview
"au BufWinEnter * silent! loadview

"------- macros -------
let @c='^df,Op==$x^iself.ly$$a = pj' " a, b, --> self.a = a<NL>self.b = b

"------- custom mappings -------
" <C-v> is normally used for literal 
" inserting of the following character
inoremap <C-v> <F10><C-r>+<F10>
vnoremap <C-c> "+y
nmap <F10> <F10>i

"inoremap {<CR> {<CR>}<Esc>O
"imap <C-i> <esc>0i "tab stops working with this 
"map tr F>a<?=$this->translate('<esc>f<i')?><esc>

"------- dir mapping -------
inoremap <C-h> <BACKSPACE>
inoremap <C-l> <DELETE>
inoremap <C-k> <UP>
inoremap <C-j> <DOWN>
cnoremap <C-k> <UP>
cnoremap <C-j> <DOWN>
cnoremap <C-l> <RIGHT>
cnoremap <C-h> <LEFT>

"------- sudo save -------
cnoremap w! %!sudo tee > /dev/null %

"------- windows switching -------
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

"------- wildmenu -------
function! EnterSubdir()
    call feedkeys("\<Down>", 't')
    return ''
endfunction
cnoremap <expr> <C-j> EnterSubdir()

"------- quicktask -------
autocmd BufNewFile,BufRead *.qtask setf quicktask

"------- syntastic -------
"let g:syntastic_python_python_exec = '/usr/bin/python3'
"let g:syntastic_quiet_warnings=1
"let g:syntastic_enable_signs=0
let g:syntastic_python_checkers = []
"let g:syntastic_python_checkers = ['pyflakes']
"let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_python_flake8_post_args='--ignore=E501,E128,E225'
"let g:syntastic_python_checkers = ['pylint']
let g:syntastic_always_populate_loc_list = 1
"
"------- pathogen -------
call pathogen#infect()
call pathogen#helptags()

"------- taglist -------
nmap ,x :TagbarToggle<CR>

"------- NERDTree -------
map ,z :NERDTreeToggle<CR>

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

"------- omnicompletion -------
"not needed with vim-jedi:
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu,longest
set pumheight=15

"------- supertab -------
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestHighlight = 1
let g:SuperTabLongestEnchanced = 1
let g:SuperTabContextDefaultCompletionType = "<c-n>"

"------- vim-jedi -------
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
"let g:jedi#show_function_definition = 0
"let g:jedi#auto_initialization = 0
hi jediFunction term=NONE cterm=NONE ctermfg=6 guifg=gray7 gui=NONE ctermbg=0 guibg=HotPink
hi jediFat term=bold,underline cterm=bold,underline gui=bold,underline ctermbg=0 guibg=HotPink

"------- autopairs -------
" autopairs is troublesome but I kinda like it
let g:AutoPairs = {}
autocmd FileType vim let b:AutoPairs = {'[':']', '{':'}', '(':')', "'":"'"}
autocmd FileType c,cpp,python,css,html,htmldjango,javascript,php let b:AutoPairs = {'[':']', '{':'}', '(':')', "'":"'", '"':'"'}
let g:AutoPairsMapSpace = 1	" breaks iabs 
let g:AutoPairsMapCR = 1    " breaks compatibility with some plugins
let g:AutoPairsShortcutBackInsert = '<C-b>' " alt mappings do not work with kde-console

"------- set filetype django templates -------
autocmd BufRead,BufNewFile *.html set filetype=htmldjango

"------ updating titles on kde-konsole tabs -------
au BufEnter,WinEnter * let $vim_filename=expand("%:t:r")|let $vim_dirname=expand("%:p:h:t")|silent !echo -ne "\033]30;$vim_dirname/$vim_filename\007"
au VimLeave * silent !echo -ne "\033]30;\%d\007"

"------ remove trailing whitespaces upon save -------
autocmd FileType python,html,htmldjango,css,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e

"------ load snippets -------
"autocmd FileType python,html,htmldjango,css,javascript so ~/.vim/snippets/autopair.vim

"------- hack to i-enable alt-key shortcuts in kde-konsole -------
"with this sometimes esc must be pressed twice to exit insert mode
"and it also cause a problem when playing a recorded macro
"let c='a'
"while c <= 'z'
	"exec "set <A-".c.">=\e".c
	"exec "imap \e".c." <A-".c.">"
	"let c = nr2char(1+char2nr(c))
"endw

"------- ini syntax -------
au BufNewFile,BufRead *.ini,*.conf,*/.hgrc,*/.hg/hgrc set ft=ini

"------- nginx file syntax -------
au BufRead,BufNewFile /etc/nginx/*,/etc/nginx/conf.d/*,/usr/local/nginx/conf/* set ft=nginx
"
"------- site-packages python tags -------
au BufRead,BufNewFile *.py set tags+=/usr/lib/python2.7/site-packages/tags

"------- ansible syntax for yml files -------
au BufRead,BufNewFile *.yml set ft=ansible

"------- autoload cscope -------
function! LoadCscope()
  let db = findfile(".cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/.cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()

"------- should not be needed -------
source ~/.vim/autoload/cscope_maps.vim
source ~/.vim/autoload/tab_numbers.vim

"------- open tag in a new tab -------
nmap <silent><leader><C-]> <C-w><C-]><C-w>T<Space>

"------- scrollwheel -------
" TODO: does not work:
map <ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-D>

"------- custom filetypes autocmds -------
autocmd BufNewFile,BufRead *.html set ts=2 sw=2
