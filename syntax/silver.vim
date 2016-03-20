" Vim syntax file
" Language:     Silver
" Maintainer:   Patrick Walton <pcwalton@mozilla.com>
" Maintainer:   Ben Blum <bblum@cs.cmu.edu>
" Maintainer:   Chris Morgan <me@chrismorgan.info>
" Last Change:  October 20, 2015

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Syntax definitions
"
syn match     silverFuncCall    "\w\(\w\)*("he=e-1,me=e-1

" Basic keywords
syn keyword   silverConditional match if else elseif


syn keyword   silverKeyword      acc assert assume axiom constraining define domain
syn keyword   silverKeyword      ensures epsilon exhale exists false field fold
syn keyword   silverKeyword      forall fresh function goto in inhale intersection
syn keyword   silverKeyword      invariant method new none null old perm predicate program 
syn keyword   silverKeyword      requires result returns setminus subset true unfold 
syn keyword   silverKeyword      unfolding union unique var while wildcard write
syn match     silverIdentifier   contains=silverIdentifierPrime "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
syn match     silverFuncName     "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained

" Built-in types
syn keyword   silverType         Bool Int Multiset Perm Ref Seq Set

syn match     silverOperator     display "\%(\:\|+\|-\|/\|*\|=\|\^\|&\||\|!\|>\|<\|%\)=\?"
syn match     silverOperator     display "&&\|||\|==>"

" Comments
syn region silverCommentLine                                      start="//"                      end="$" contains=@Spell
syn region SilverCommentBlock    matchgroup=silverCommentBlock    start="/\*\%(!\|\*[*/]\@!\)\@!" end="\*/" contains=@Spell
syn region silverCommentBlockNest matchgroup=silverCommentBlock   start="/\*"                     end="\*/" contains=silverCommentBlockNest,@Spell contained transparent


" Folding rules
" Trivial folding rules to begin with.
syn region silverFoldBraces start="{" end="}" transparent fold

" Default highlighting

hi def link silverOperator      Operator
hi def link silverKeyword       Keyword
hi def link silverConditional   Conditional
hi def link silverIdentifier    Identifier
hi def link silverFuncName      Function
hi def link silverType          Type
hi def link silverFuncCall      Function
hi def link silverCommentLine   Comment
hi def link silverCommentBlock  silverCommentLine

syn sync minlines=200
syn sync maxlines=500

let b:current_syntax = "silver"
