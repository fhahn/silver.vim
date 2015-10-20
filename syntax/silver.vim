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

" Syntax definitions {{{1
"
syn match     silverFuncCall    "\w\(\w\)*("he=e-1,me=e-1

" Basic keywords {{{2
syn keyword   silverConditional match if else


syn keyword   silverKeyword     assume assert inhale exhale
syn keyword   silverKeyword     fold folding unfold unfolding
syn keyword   silverKeyword     domain
syn keyword   silverKeyword     method
syn keyword   silverKeyword     field
syn keyword   silverKeyword     function
syn keyword   silverKeyword     unique
syn keyword   silverKeyword     predicate
syn keyword   silverKeyword     axiom
syn keyword   silverKeyword     forall
syn keyword   silverKeyword     ensures requires
syn keyword   silverKeyword     var
syn match     silverIdentifier  contains=silverIdentifierPrime "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
syn match     silverFuncName    "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained

" Built-in types {{{2
syn keyword   silverType        Int Ref Bool

syn match     silverOperator     display "\%(\:\|+\|-\|/\|*\|=\|\^\|&\||\|!\|>\|<\|%\)=\?"
syn match     silverOperator     display "&&\|||\|==>"

" Folding rules {{{2
" Trivial folding rules to begin with.
syn region silverFoldBraces start="{" end="}" transparent fold

" Default highlighting {{{1

hi def link silverOperator      Operator
hi def link silverKeyword       Keyword
hi def link silverConditional   Conditional
hi def link silverIdentifier    Identifier
hi def link silverFuncName      Function
hi def link silverType          Type
hi def link silverFuncCall      Function

syn sync minlines=200
syn sync maxlines=500

let b:current_syntax = "silver"
