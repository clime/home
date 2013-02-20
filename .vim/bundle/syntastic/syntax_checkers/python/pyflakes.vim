"============================================================================
"File:        pyflakes.vim
"Description: Syntax checking plugin for syntastic.vim
"Authors:     Martin Grenfell <martin.grenfell@gmail.com>
"             kstep <me@kstep.me>
"             Parantapa Bhattacharya <parantapa@gmail.com>
"
"============================================================================
function! SyntaxCheckers_python_pyflakes_IsAvailable()
    return executable('pyflakes')
endfunction

function! SyntaxCheckers_python_pyflakes_GetHighlightRegex(i)
    if match(a:i['text'], 'is assigned to but never used') > -1
                \ || match(a:i['text'], 'imported but unused') > -1
                \ || match(a:i['text'], 'undefined name') > -1
                \ || match(a:i['text'], 'redefinition of') > -1
                \ || match(a:i['text'], 'referenced before assignment') > -1
                \ || match(a:i['text'], 'duplicate argument') > -1
                \ || match(a:i['text'], 'after other statements') > -1
                \ || match(a:i['text'], 'shadowed by loop variable') > -1

        let term = split(a:i['text'], "'", 1)[1]
        return '\V\<'.term.'\>'
    endif
    return ''
endfunction

function! SyntaxCheckers_python_pyflakes_GetLocList()
    let makeprg = syntastic#makeprg#build({
                \ 'exe': 'pyflakes',
                \ 'subchecker': 'pyflakes' })
    let errorformat = '%E%f:%l: could not compile,%-Z%p^,%E%f:%l:%c: %m,%E%f:%l: %m,%-G%.%#'

    let errors = SyntasticMake({ 'makeprg': makeprg,
                         \ 'errorformat': errorformat,
                         \ 'defaults': {'text': "Syntax error"} })
	

	"clime: filtering some stuff out
    let errors = filter(errors, 'v:val["text"] !~ "unable to detect undefined names"')

	" clime: ouput number of errors (warnings)
	set cmdheight=2
	echo 'file saved; warning count: '.len(errors)
	set cmdheight=1

	return errors
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'python',
    \ 'name': 'pyflakes'})
