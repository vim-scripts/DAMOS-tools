" Vim syntax file
" Language:	damos command file
" Maintainer:	Stefan Liebl <S.Liebl@gmx.de>
" URL:		
" Credits:	Based on the java.vim syntax file by Claudio Fleiner
" Last change:	2004 Okt 04

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" we define it here so that included files can test for it
if !exists("main_syntax")
  let main_syntax='damos'
endif

" ignore case
"syn case ignore

" commands
syn keyword damosFunction  begrenzeFehlerausgabe unterdrueckeBeaFort
syn keyword damosFunction  einstelleSprache oeffneOSp liesBezeichner oeffnePV
syn keyword damosFunction  liesAdressDatei anlegeDatenstand
syn keyword damosFunction  liesKonservierung speichere schreibeHexDatei
syn keyword damosFunction  schreibeASAP_AgIAsw
syn keyword damosFunction  kdoOTypCheck ausfuehreTrans pruefeAutoRam
syn keyword damosFunction  pruefeFktKonsistenz schreibeFhlListAusFktKonsPruef
syn keyword damosFunction  oeffneQuellDatenstand fuelleAusTestwerte
syn keyword damosFunction  definiereSGGrAuswahl anlegeAsw entferneAsw schneideAsw
syn keyword damosFunction  schliesseAsw setzeUmfang schreibeDatenquelle
syn keyword damosFunction  schreibeFktIncludeAbh anlegeOSp importiereObjekte
syn keyword damosFunction  schliesseOSp
syn keyword damosCommand   exit Dam DAMOS quellDst

syn match   damosSeperator        "[<>,:]"

syn match   damosParameter "'p\d\+'"
syn keyword damosParameter Motorola Intel Lesen S I W E y j n V1_3
syn keyword damosParameter deutsch OSp Dst DAT EXIT PrV maxSstAnz dfpm_fkt alle_fkt
syn keyword damosParameter switch_dfpm_fkt fktGelesen dfpm_index switch_dfpm_index

" Comments
syn keyword damosTodo             contained TODO FIXME XXX
" string inside comments
syn region  damosCommentString    contained start=+"+ end=+"+ end=+\*/+me=s-1,he=s-1 contains=damosSpecial,damosCommentStar,damosSpecialChar
syn match   damosCommentCharacter contained "'\\[^']\{1,6\}'" contains=damosSpecialChar
syn match   damosCommentCharacter contained "'\\''" contains=damosSpecialChar
syn match   damosCommentCharacter contained "'[^\\]'"
syn match   damosLineComment      "//.*" contains=damosCommentCharacter,damosTodo
hi link damosLineComment damosComment
hi link damosCommentString damosString

" Strings and constants
syn region  damosString           start=+"+ end=+"+  contains=ucSpecialChar,ucSpecialError

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_damos_syntax_inits")
  if version < 508
    let did_damos_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink damosComment                       Comment
  HiLink damosString                        String
  HiLink damosBranch                        Statement
  HiLink damosSeperator                     String
  HiLink damosFunction                      Function
  HiLink damosCommand                       Statement
  HiLink damosParameter                     Label

  delcommand HiLink
endif

let b:current_syntax = "damos"

if main_syntax == 'damos'
  unlet main_syntax
endif

" vim: ts=8
