" Vim filetype plugin
" Language:	damos Konserve
" Maintainer:	Stefan Liebl <S.Liebl@gmx.de>
" URL:		
" Credits:	

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
    finish
endif

" ----
" TABS
" ----
" use spaces for tabs
setlocal expandtab

" autoindent
" indent mode - one of autoindent, smartindent or cindent
setlocal autoindent

" commenting
" ----------
let b:commentstring = "* "

" Grep options
let b:GrepFiles = '*.kon'
