" =========================
"   General
" =========================
"
" Extra terminal things
if (($TERM == "rxvt-unicode") || ($TERM =~ "xterm") || ($TERM =~ "screen")) && (&termencoding == "")
    set termencoding=utf-8
endif
"
"     compatible:  Let Vim behave like Vi?  Hell, no!
set nocompatible
set cf " enable error files and error jumping
set isk+=_,- " none of these should be word dividers, so make them not be


" =========================
"   Files/Backups
" =========================
"
  set nobackup " no backups
" set backup " make backup file
" set backupdir=$VIM\vimfiles\backup " where to put backup file
" set directory=$VIM\vimfiles\temp " directory is the directory for temp file
"
" Enable a nice big viminfo file
  set   viminfo='1000,f1,:1000,/1000
  set   history=1000 " How many lines of history to remember
"
"       autowrite: Automatically save modifications to files
"       when you use critical (rxternal) commands.
" set   autowrite


colorscheme evening
set guioptions=

" =========================
"   Vim UI
" =========================
"
"       backspace:  '2' allows backspacing" over
"       indentation, end-of-line, and start-of-line.
"       see also "help bs".
  set   backspace=2

"       ruler:       show cursor position?  Yep!
  set   ruler
"
"       shortmess:   Kind of messages to show.   Abbreviate them
"       all!  New since vim-5.0v: flag 'I' to suppress "intro
"       message".
  set   shortmess=atI
"
"       showcmd:     Show current uncompleted command?
"       Absolutely!
  set   showcmd

"       showfulltag: (sft) auto completion (great for programming)
  set   showfulltag
"
"       showmode:    Show the current mode?
"       YEEEEEEEEESSSSSSSSSSS!
  set   showmode
"
"       splitbelow:  Create new window below current one.
  set   splitbelow

"       space it out a little more (easier to read)
  set   lsp=0 

"       the command bar high
  set   cmdheight=1 

"       turn on line numbers
  set   number 

"       do not redraw while running macros (much faster) (LazyRedraw)
  set   lz
"
"
" Try to show at least three lines and two columns of context when
" scrolling
  set   scrolloff=3
  set   sidescrolloff=2
"
"       mouse: enable mouse scrolling, mouse selection etc.
" set mouse=a
"
"       modeline:  Allow the last line to be a modeline - useful
"       when the last line in sig gives the preferred textwidth
"       for replies.
if (v:version == 603 && has("patch045")) || (v:version > 603)
  set   modeline
  set   modelines=1
else
  set   nomodeline
endif
"
"
" Nice statusbar
  set   laststatus=2
  set   statusline=
  set   statusline+=%-3.3n\                      " buffer number
  set   statusline+=%F\                          " file name
  set   statusline+=%h%m%r%w                     " flags
  set   statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
  set   statusline+=%{&fileencoding}/%{&encoding}/%{&termencoding}, " encoding
  set   statusline+=%{&fileformat}]              " file format
  set   statusline+=[LEN=%L]                     " total length of file


if filereadable(expand("$VIM/vimfiles/plugin/vimbuddy.vim"))
  set   statusline+=\ %{VimBuddy()}          " vim buddy
endif
  set   statusline+=%=                           " right align
  set   statusline+=0x%-8B\                      " current char
  set   statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" If possible, try to use a narrow number column.
if v:version >= 700
    try
        setlocal numberwidth=3
    catch
    endtry
endif

" =========================
"   Visual Cues
" =========================
"
"       errorbells: damn this beep!  ;-)
"       "vi has two modes - one in which it beeps
"       and another in which it doesn't."
  set   noerrorbells
"
"       hlsearch :  highlight search - show the current search pattern
"       This is a nice feature sometimes - but it sure can get in the
"       way sometimes when you edit.
  set   hlsearch
"
"       incsearch: While typing a search command, show immediately where
"       the so far typed pattern matches.  The matched string is
"       highlighted.
  set   incsearch

  set ignorecase
"
" set   infercase
"
"       icon:       i do not need no steekeen icon title string.
  set   noicon
"
"       visualbell:
  set   visualbell
"
"       showmatch:   Show the matching bracket for the last ')'?
  set   showmatch
"
"       mat: how many tenths of a second to blink matching
"       brackets
  set   mat=5
"
"       Speed up macros
  set   lazyredraw
"
"       Use the cool tab complete menu
  set   wildmenu
  set   wildmode=list:longest,full
  set   wildignore=*.o,*~

" =========================
"   Text Formatting/Layout
" =========================
"
"       autoindent: auto indent, nice for coding
  set   autoindent
"
"       smartindent: Do smart autoindenting when starting a new line.
"       Works for C-like programs, but can also be used for other
"       languages. cindent or smartindent
" set   smartindent
"
"       cindent: do c-style indenting
  set   cindent
"
"       shiftwidth: Number of spaces to use for each insertion of
"       (auto)indent.
  set   shiftwidth=2
"
"       tabstop: (ts)
  set   tabstop=2
"
"       smarttab: Use tabs at the start of a line, spaces elsewhere
" set   smarttab
"
"       textwidth: (tw)
  set   textwidth=70
"
"       expandtab:  Expand Tabs (use spaces)?.
"                   See 'listchars' to make Tabs visible!
  set   expandtab
"
"       comments default: sr:/*,mb:*,el:*/,://,b:#,:%,:XCOMM,n:>,fb:-
" set   comments=b:#,:%,fb:-,n:>,n:)
" This command is for nice comments in C :)
" set   comments=sr:/*,mb:\ *,el:*/,://,b:#,:%,:XCOMM,n:>,n:),fb:-
"
"       formatoptions:  Options for the "text format" command ("gq")
"                       I need all those options (but 'o')!
" set   formatoptions=cqrt,  See Help (complex)
  set   formatoptions=tcrqn
"
"       joinspaces:
"       insert two spaces after a period with every joining of lines.
"       I like this as it makes reading texts easier (for me, at least).
" set   joinspaces
"
"       whichwrap: Allow jump commands for left/right motion to
"       wrap to previous/next line when cursor is on first/last
"       character in the line:
  set   whichwrap+=<,>,[,]
"
  set   linebreak
  set   nowrap
"
" Allow edit buffers to be hidden
  set   hidden
"
" 1 height windows
  set winminheight=1
"
"
" No icky toolbar, menu or scrollbars in the GUI
if has('gui')
    set guioptions-=m
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
else

end

inoremap # X<BS>#

" Enable folds
let g:xml_syntax_folding = 1
set foldenable
""set foldmethod=indent " Make folding indent sensitive
set foldmethod=syntax
set foldlevel=1
"set foldcolumn=12
""set foldopen-=search " don't open folds when you search into them
""set foldopen-=undo " don't open folds when you undo stuff

" Syntax when printing
set popt+=syntax:y


"
" Include $HOME in cdpath
let &cdpath=','.expand("$HOME")

" set nolist "to remove it!
" Show tabs and trailing whitespace visually
if (&termencoding == "utf-8") || has("gui_running")
    if v:version >= 700
        set list listchars=tab:»·,trail:·,extends:¿,nbsp:¿
    else
        set list listchars=tab:»·,trail:·,extends:¿
    endif
else
    if v:version >= 700
        set list listchars=tab:>-,trail:.,extends:>,nbsp:_
    else
        set list listchars=tab:>-,trail:.,extends:>
    endif
endif

set fillchars=fold:-

" ==================================
"   Plugin / Script / App Settings
" ==================================

" Enable syntax highlighting
syntax on

" Enable filetype settings
filetype on
filetype plugin on
filetype indent on

" Highlight C space errors.
let c_space_errors = 1
set makeef=error.err " When using make, where should it dump the file
"let c_no_tab_space_error = 1

" supertab
"let g:SuperTabDefaultCompletionType = "<C-X><C-N>"
"let g:SuperTabContextDefaultCompletionType = "<C-X><C-N>"
"let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<C-X><C-O>","&completefunc:<C-X><C-U>",]
"let g:SuperTabMidWordCompletion = 0

"CTAGS
"let g:autotagCtagsCmd = "ctags --c++-kinds=+pl --fields=+iaS --extra=+q"
set tags+=~/.vim/tags/cpp
map <F8> :!/usr/bin/ctags -R --vhdl-kinds=+Cd --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch     = 1
let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_ShowAccess          = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot      = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow    = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope    = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD", "subject"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" timestamps for special files
let g:use_timestamp = 1

" git
let g:git_diff_spawn_mode = 1

" manpage view
let g:manpageview_winopen = "hsplit="
let g:manpageview_multimanpage = 0

" doxygen
let g:DoxygenToolkit_authorName="Andreas Schneider"
let g:DoxygenToolkit_licenseTag="GPL"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_commentType = "C"

let g:DoxygenToolkit_briefTag_pre = " @brief "
let g:DoxygenToolkit_briefTag_post = ""
let g:DoxygenToolkit_paramTag_pre = " @param "
let g:DoxygenToolkit_paramTag_post = " "
let g:DoxygenToolkit_returnTag = " @return "
let g:DoxygenToolkit_fileTag = " @file "
let g:DoxygenToolkit_authorTag = " @author "
let g:DoxygenToolkit_dateTag = " @date "
let g:DoxygenToolkit_blockTag = " @name "
let g:DoxygenToolkit_classTag = " @class "
let g:DoxygenToolkit_startCommentTag = "/**"
let g:DoxygenToolkit_startCommentBlock = "/*"
let g:DoxygenToolkit_interCommentTag = "*"
let g:DoxygenToolkit_endCommentTag = "*/"
let g:DoxygenToolkit_endCommentBlock = " */"

"  LaTeX commands
"ia #l \documentclass{article}<CR>\usepackage[latin1]{inputenc}<CR>\usepackage[danish]{babel}<CR>\begin{document}<CR>\begin{center}<CR>{\bf}\\<CR>Jack Jørgensen 140682<CR>\end{center}<CR>\end{document}<Up><Up><Up><Left><Left><Left>
"ia #e \begin{eqnarray*}<CR>\end{eqnarray*}<Up><End>
"ia #f \frac{}{}<Left><Left><Left>
"ia #v \verb
"ia #( \left(
"ia #) \right)
"ia #[ \right[
"ia #] \left]
"ia #{ \left\{
"ia #} \right\}
"ia #a \left[\begin{array}{}<CR>\end{array}\right]<Up><End><Left>
" Perl specific options
let perl_include_pod=1
let perl_fold=1
let perl_fold_blocks=1
let perl_extended_vars=1 

" Vim specific options
let g:vimsyntax_noerror=1

" Settings minibufexpl.vim
let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
let g:miniBufExplModSelTarget = 1
let g:miniBufExplWinFixHeight = 1

" bash case indet level
let g:sh_indent_case_labels=1

" Settings for showmarks.vim
if has("gui_running")
    let g:showmarks_enable=1
else
    let g:showmarks_enable=0
    let loaded_showmarks=1
endif

autocmd VimEnter *
            \ if has('gui') |
            \        highlight ShowMarksHLl gui=bold guifg=#a0a0e0 guibg=#2e2e2e |
            \        highlight ShowMarksHLu gui=none guifg=#a0a0e0 guibg=#2e2e2e |
            \        highlight ShowMarksHLo gui=none guifg=#a0a0e0 guibg=#2e2e2e |
            \        highlight ShowMarksHLm gui=none guifg=#a0a0e0 guibg=#2e2e2e |
            \        highlight SignColumn   gui=none guifg=#f0f0f8 guibg=#2e2e2e |
            \    endif

" Settings for explorer.vim
" let g:explHideFiles='^\.'

" Settings for netrw
" let g:netrw_list_hide='^\.,\~$'

" Settings for :TOhtml
let html_number_lines=1
let html_use_css=1
let use_xhtml=1

" markdown filetype file
augroup markdown
    au! BufRead,BufNewFile *.mkd   setfiletype mkd
augroup END
" Finally, to get some nice Markdown formatting behavior, add these lines to your .vimrc: 
augroup mkd
    autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END


set makeprg=cbuild


function FT_vhdl()
  if exists("+omnifunc")
    setlocal omnifunc=syntaxcomplete#Complete
  endif

  setlocal makeprg=make
  setlocal errorformat=**\ Error:\ %f(%l):\ %m

  let g:vhdl_indent_genportmap=0
  map <buffer> <F4> :execute ':!vsim -c -do "run -all;exit" '.expand("%:t:r")<CR>

  " for taglist
  let g:tlist_vhdl_settings   = 'vhdl;d:package declarations;b:package bodies;e:entities;a:architecture specifications;t:type declarations;p:processes;f:functions;r:procedures'

  " command mappings for perl scripts
  :command! -nargs=1 -complete=file VHDLcomp r! ~/.vhdl/vhdl_comp.pl <args>
  :command! -nargs=1 -complete=file VHDLinst r! ~/.vhdl/vhdl_inst.pl <args>

  " environments
  imap <buffer> <C-e>e <Esc>bdwientity <Esc>pa is<CR>end entity ;<Esc>POport (<CR>);<Esc>O
  imap <buffer> <C-e>a <Esc>b"zdwiarchitecture <Esc>pa of <Esc>mz?entity<CR>wyw`zpa is<CR>begin<CR>end architecture ;<Esc>"zPO
  imap <buffer> <C-e>p <Esc>bywA : process ()<CR>begin<CR>end process ;<Esc>PO<+process body+><Esc>?)<CR>i
  imap <buffer> <C-e>g <Esc>bdwipackage <Esc>pa is<CR><BS>end package ;<Esc>PO    
  imap <buffer> <C-e>c case  is<CR>when <+state1+> =><CR><+action1+><CR>when <+state2+> =><CR><+action2+><CR>when others => null;<CR>end case;<Esc>6k$2hi
  imap <buffer> <C-e>i if  then<CR><+do_something+>;<CR>elsif <+condition2+> then<CR><+do_something_else+>;<CR>else<CR><+do_something_else+>;<CR>end if;<Esc>6k$4hi

  " shortcuts
  imap <buffer> ,, <= 
  imap <buffer> .. => 
  "imap <buffer> <C-s>i <Esc>:VHDLinst 
  "imap <buffer> <C-s>c <Esc>:VHDLcomp

  " visual mappings
  "vmap <C-a> :!~/.vhdl/vhdl_align.py<CR>
  "vmap <C-d> :!~/.vhdl/vhdl_align_comments.py<CR>

  " alt key mappings
  imap <buffer> <M-i> <Esc>owhen 

  " abbreviations
  iabbr dt downto
  iabbr sig signal
  iabbr gen generate
  iabbr ot (others => '');<++><Esc>6hi
  iabbr sl std_logic
  iabbr slv std_logic_vector
  iabbr uns unsigned
  iabbr toi to_integer
  iabbr tos to_unsigned
  iabbr tou to_unsigned
  imap <buffer> I: I : in 
  imap <buffer> O: O : out 

  " emacs vhdl mode
  " warning: the following is dangerous, becase the file is written and then opened again, which means, the undo history is lost; if someting goes wrong, you may loose your file
  "command! EVMUpdateSensitivityList :w|:execute "!emacs --no-init-file --no-site-file -l ~/.vhdl/vhdl-mode.el -batch % --eval '(vhdl-update-sensitivity-list-buffer)' -f save-buffer" | :e
  "map <F12> :EVMUpdateSensitivityList<CR>
endfunction


"
" ===================================================================
" ASCII tables - you may need them some day.  Save them to a file!
" ===================================================================
"
" 001005: In need of an ASII table?  Perl is your friend:
"         perl -e 'while($i++<256) { print chr($i); }'
"
" ASCII Table - | octal value - name/char |
"
" |000 nul|001 soh|002 stx|003 etx|004 eot|005 enq|006 ack|007 bel|
" |010 bs |011 ht |012 nl |013 vt |014 np |015 cr |016 so |017 si |
" |020 dle|021 dc1|022 dc2|023 dc3|024 dc4|025 nak|026 syn|027 etb|
" |030 can|031 em |032 sub|033 esc|034 fs |035 gs |036 rs |037 us |
" |040 sp |041  ! |042  " |043  # |044  $ |045  % |046  & |047  ' |
" |050  ( |051  ) |052  * |053  + |054  , |055  - |056  . |057  / |
" |060  0 |061  1 |062  2 |063  3 |064  4 |065  5 |066  6 |067  7 |
" |070  8 |071  9 |072  : |073  ; |074  < |075  = |076  > |077  ? |
" |100  @ |101  A |102  B |103  C |104  D |105  E |106  F |107  G |
" |110  H |111  I |112  J |113  K |114  L |115  M |116  N |117  O |
" |120  P |121  Q |122  R |123  S |124  T |125  U |126  V |127  W |
" |130  X |131  Y |132  Z |133  [ |134  \ |135  ] |136  ^ |137  _ |
" |140  ` |141  a |142  b |143  c |144  d |145  e |146  f |147  g |
" |150  h |151  i |152  j |153  k |154  l |155  m |156  n |157  o |
" |160  p |161  q |162  r |163  s |164  t |165  u |166  v |167  w |
" |170  x |171  y |172  z |173  { |174  | |175  } |176  ~ |177 del|
"
" ===================================================================
" ASCII Table - | decimal value - name/char |
"
" |000 nul|001 soh|002 stx|003 etx|004 eot|005 enq|006 ack|007 bel|
" |008 bs |009 ht |010 nl |011 vt |012 np |013 cr |014 so |015 si |
" |016 dle|017 dc1|018 dc2|019 dc3|020 dc4|021 nak|022 syn|023 etb|
" |024 can|025 em |026 sub|027 esc|028 fs |029 gs |030 rs |031 us |
" |032 sp |033  ! |034  " |035  # |036  $ |037  % |038  & |039  ' |
" |040  ( |041  ) |042  * |043  + |044  , |045  - |046  . |047  / |
" |048  0 |049  1 |050  2 |051  3 |052  4 |053  5 |054  6 |055  7 |
" |056  8 |057  9 |058  : |059  ; |060  < |061  = |062  > |063  ? |
" |064  @ |065  A |066  B |067  C |068  D |069  E |070  F |071  G |
" |072  H |073  I |074  J |075  K |076  L |077  M |078  N |079  O |
" |080  P |081  Q |082  R |083  S |084  T |085  U |086  V |087  W |
" |088  X |089  Y |090  Z |091  [ |092  \ |093  ] |094  ^ |095  _ |
" |096  ` |097  a |098  b |099  c |100  d |101  e |102  f |103  g |
" |104  h |105  i |106  j |107  k |108  l |109  m |110  n |111  o |
" |112  p |113  q |114  r |115  s |116  t |117  u |118  v |119  w |
" |120  x |121  y |122  z |123  { |124  | |125  } |126  ~ |127 del|
"
" ===================================================================
" ASCII Table - | hex value - name/char |
"
" | 00 nul| 01 soh| 02 stx| 03 etx| 04 eot| 05 enq| 06 ack| 07 bel|
" | 08 bs | 09 ht | 0a nl | 0b vt | 0c np | 0d cr | 0e so | 0f si |
" | 10 dle| 11 dc1| 12 dc2| 13 dc3| 14 dc4| 15 nak| 16 syn| 17 etb|
" | 18 can| 19 em | 1a sub| 1b esc| 1c fs | 1d gs | 1e rs | 1f us |
" | 20 sp | 21  ! | 22  " | 23  # | 24  $ | 25  % | 26  & | 27  ' |
" | 28  ( | 29  ) | 2a  * | 2b  + | 2c  , | 2d  - | 2e  . | 2f  / |
" | 30  0 | 31  1 | 32  2 | 33  3 | 34  4 | 35  5 | 36  6 | 37  7 |
" | 38  8 | 39  9 | 3a  : | 3b  ; | 3c  < | 3d  = | 3e  > | 3f  ? |
" | 40  @ | 41  A | 42  B | 43  C | 44  D | 45  E | 46  F | 47  G |
" | 48  H | 49  I | 4a  J | 4b  K | 4c  L | 4d  M | 4e  N | 4f  O |
" | 50  P | 51  Q | 52  R | 53  S | 54  T | 55  U | 56  V | 57  W |
" | 58  X | 59  Y | 5a  Z | 5b  [ | 5c  \ | 5d  ] | 5e  ^ | 5f  _ |
" | 60  ` | 61  a | 62  b | 63  c | 64  d | 65  e | 66  f | 67  g |
" | 68  h | 69  i | 6a  j | 6b  k | 6c  l | 6d  m | 6e  n | 6f  o |
" | 70  p | 71  q | 72  r | 73  s | 74  t | 75  u | 76  v | 77  w |
" | 78  x | 79  y | 7a  z | 7b  { | 7c  | | 7d  } | 7e  ~ | 7f del|
" ===================================================================
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Custom Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Select range, then hit :SuperRetab($width) - by p0g and FallingCow
"function! SuperRetab(width) range
"        silent! exe a:firstline . ',' . a:lastline . 's/\v%(^ *)@<= {'. a:width .'}/\t/g'
"endfunction
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <right> <ESC>:MBEbn<RETURN> " right arrow (normal mode) switches buffers  (excluding minibuf)
"map <left> <ESC>:MBEbp<RETURN> " left arrow (normal mode) switches buffers (excluding minibuf) 
"map <up> <ESC>:Sex<RETURN><ESC><C-W><C-W> " up arrow (normal mode) brings up a file list
"map <down> <ESC>:Tlist<RETURN> " down arrow  (normal mode) brings up the tag list
"map <A-i> i <ESC>r " alt-i (normal mode) inserts a single char, and then switches back to normal
"map <F2> <ESC>ggVG:call SuperRetab()<left>
"map <F12> ggVGg? " encypt the file (toggle)
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)
"au BufNewFile,BufRead *.asp :set ft=aspjscript " all my .asp files ARE jscript
"au BufNewFile,BufRead *.tpl :set ft=html " all my .tpl files ARE html
"au BufNewFile,BufRead *.hta :set ft=html " all my .tpl files ARE html
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Useful abbrevs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"iab xasp <%@language=jscript%><CR><%<CR><TAB><CR><BS>%><ESC><<O<TAB>
"iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

"       vim:tw=73 et sw=4 comments=\:\"
