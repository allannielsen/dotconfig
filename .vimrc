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
" set nobackup " no backups
" set backup " make backup file
" set backupdir=$VIM\vimfiles\backup " where to put backup file
" set directory=$VIM\vimfiles\temp " directory is the directory for temp file
"
" Enable a nice big viminfo file
  set   viminfo='100000,f1,:100000,/100000
  set   history=100000 " How many lines of history to remember
"
"       autowrite: Automatically save modifications to files
"       when you use critical (rxternal) commands.
" set   autowrite


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
  set   statusline+=%{fugitive#statusline()}
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

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

colorscheme evening
set guioptions=


" Enable syntax highlighting
syntax on

" Enable filetype settings
filetype on
filetype plugin on
filetype indent on

" Highlight C space errors.
let c_space_errors = 1
set makeef=error.err " When using make, where should it dump the file

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

" Vim specific options
let g:vimsyntax_noerror=1

" Settings minibufexpl.vim
let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
let g:miniBufExplModSelTarget = 1
let g:miniBufExplWinFixHeight = 1

" bash case indet level
let g:sh_indent_case_labels=1


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

"       vim:tw=73 et sw=4 comments=\:\"
