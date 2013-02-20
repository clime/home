inoremap <buffer> ( ()<Esc>i
inoremap <buffer> [ []<Esc>i
inoremap <buffer> { {}<Esc>i
inoremap <buffer> {<CR> {<CR>}<Esc>O
inoremap <buffer> ) <c-r>=ClosePair(')')<CR>
inoremap <buffer> ] <c-r>=ClosePair(']')<CR>
inoremap <buffer> } <c-r>=CloseBracket()<CR>
inoremap <buffer> " <c-r>=QuoteDelim('"')<CR>
inoremap <buffer> ' <c-r>=QuoteDelim("'")<CR>

if !exists("*ClosePair")
function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf
endif

if !exists("*CloseBracket")
function CloseBracket()
 if getline('.')[col('.') - 1] == '}'
 return "\<Right>"
 else
 return '}'
 endif

 if match(getline(line('.') + 1), '^\s*}') < 0
 return "\}"
 else
 return "\<Esc>j0f}a"
 endif
endf
endif

if !exists("*QuoteDelim")
function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf
endif
