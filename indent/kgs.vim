" Vim indent file
" Language:	damos Kenngroessen Beschreibungs Datei
" Maintainer:	Stefan Liebl <S.Liebl@gmx.de>
" URL:		
" Credits:	

if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal indentexpr=GetKgsIndent()
setlocal nolisp
setlocal nosmartindent
setlocal autoindent
setlocal indentkeys+=}

" Only define the function once
if exists("*GetKgsIndent")
    finish
endif

function GetKgsIndent()

    " Do not change indentation of commented lines.
    if exists("b:commentstring")
        if getline(v:lnum) =~ '^' . b:commentstring . '.*'
            return 0
        endif
    endif

    " Don't indent preprocessor directives
    if getline(v:lnum) =~ '^\s*#'
        return 0
    endif

    " Find a non-blank line above the current line, that's not a comment and not a preprocessor directive
    let lnum = prevnonblank(v:lnum - 1)
    while 1
        if getline(lnum) =~ '^#'
            " search
        elseif exists("b:commentstring")
            if getline(lnum) =~ '^' . b:commentstring
                " search
            else
                " found
                break
            endif
        else
            " found
            break
        endif
        " search next
        let lnum = prevnonblank(lnum - 1)
    endwhile

    " At the start of the file use zero indent.
    if lnum == 0 | return 0
    endif

    let ind = indent(lnum)
    let line = getline(lnum)             " last line
    let cline = getline(v:lnum)          " current line

    " Add a 'shiftwidth' after beginning of environments.
    " Don't add it for /begin ... /end
    if line =~ '{'  && line !~ '}'
        let ind = ind + &sw
    endif

    " Subtract a 'shiftwidth' when an environment ends
    if cline =~ '^\s*}'
        let ind = ind - &sw
    endif
    if line !~ '{' && line =~ '}' && line !~ '^\s*}'
        let ind = ind - &sw
    endif

    " Add a space after beginning of a comment-block
    if line =~ '\/\*' && line !~ '\*\/'
        let ind = ind + 1
    endif

    " Subtract a space after end of a comment-block
    if line !~ '\/\*' && line =~ '\*\/'
        let ind = ind - 1
    endif

    return ind
endfunction

