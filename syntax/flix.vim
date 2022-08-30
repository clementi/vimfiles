if exists("b:current_syntax")
  finish
endif

syn keyword keywords assert case def else enum if in index lat
syn keyword keywords let match namespace print rel val with

syn region LineComment start="//" end="$"
syn region BlockComment start="/\*" end="\*/"

let b:current_syntax = "flix"

hi def link keywords Statement

hi def link LineComment Comment
hi def link BlockComment Comment
