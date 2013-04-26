"     cindent: do c-style indenting
  set   cindent
"
"       shiftwidth: Number of spaces to use for each insertion of
"       (auto)indent.
  set   shiftwidth=4
"
"       tabstop: (ts)
  set   tabstop=8
"
"       smarttab: Use tabs at the start of a line, spaces elsewhere
"set    smarttab

"       textwidth: (tw)
  set   textwidth=80
"
"       expandtab:  Expand Tabs (use spaces)?.
"                   See 'listchars' to make Tabs visible!
  set   expandtab

"       comments default: sr:/*,mb:*,el:*/,://,b:#,:%,:XCOMM,n:>,fb:-
" set   comments=b:#,:%,fb:-,n:>,n:)
" This command is for nice comments in C :)
" set   comments=sr:/*,mb:\ *,el:*/,://,b:#,:%,:XCOMM,n:>,n:),fb:-
"
"       formatoptions:  Options for the "text format" command ("gq")
"                       I need all those options (but 'o')!
" set   formatoptions=cqrt,  See Help (complex)
  set   formatoptions=tcrqn

set cinoptions=
set cinoptions+=:0 " Do not indent switch labels
set cinoptions+=10 " switch statements
set cinoptions+=l1 " switch braktes
set cinoptions+=(0 " 
set cinoptions+=W4 " 
set cinoptions+=t0 " 
set cinoptions+=m1 " 

set cc=80

