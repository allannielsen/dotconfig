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
  set   statusline+=%=                             " right align
"  set   statusline+=style=%{CodingStyleIndent()}\  " show currently used style
  set   statusline+=0x%-2B\                        " current char
  set   statusline+=%-8.(%4l,%c%V%)\ %3P           " offset

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
" "
" "       visualbell:
set visualbell
" "
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
set   smartindent
"
"       cindent: do c-style indenting
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
set   smarttab
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
" let &cdpath=','.expand("$HOME")
" 
" " set nolist "to remove it!
" " Show tabs and trailing whitespace visually
" if (&termencoding == "utf-8") || has("gui_running")
"     if v:version >= 700
"         set list listchars=tab:»·,trail:·,extends:¿,nbsp:¿
"     else
"         set list listchars=tab:»·,trail:·,extends:¿
"     endif
" else
"     if v:version >= 700
"         set list listchars=tab:>-,trail:.,extends:>,nbsp:_
"     else
"         set list listchars=tab:>-,trail:.,extends:>
"     endif
" endif

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
" 
" "CTAGS
" "let g:autotagCtagsCmd = "ctags --c++-kinds=+pl --fields=+iaS --extra=+q"
" set tags+=~/.vim/tags/cpp
" map <F8> :!/usr/bin/ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
" map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" 
" " OmniCppComplete
" "let OmniCpp_NamespaceSearch     = 1
" "let OmniCpp_GlobalScopeSearch   = 1
" "let OmniCpp_ShowAccess          = 1
" "let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
" "let OmniCpp_MayCompleteDot      = 1 " autocomplete after .
" "let OmniCpp_MayCompleteArrow    = 1 " autocomplete after ->
" "let OmniCpp_MayCompleteScope    = 1 " autocomplete after ::
" "let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD", "subject"]
" "" automatically open and close the popup menu / preview window
" "au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
" "set completeopt=menuone,menu,longest,preview
" 
" timestamps for special files
let g:use_timestamp = 1

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

" set makeprg="make -C /home/awn/git/gamblify/machineclient/libgame/build-c++"


" autocmd User fugitive
"   \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
"   \   nnoremap <buffer> .. :edit %:h<CR> |
"   \ endif

autocmd BufReadPost fugitive://* set bufhidden=delete



"set makeprg=cbuild





" ex command for toggling pb mode - define mapping if desired
command -bar Pbmode call TogglePb()

" helper function to toggle pb mode
function! TogglePb()
  " pb mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editPb") || !b:editPb
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="gmbpb"
    " set status
    let b:editPb=1
    " switch to pb editor
    %!readpb
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editPb=0
    " return to normal editing
    %!compilepb
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction


" autocmds to automatically enter pb mode and handle file writes properly
if has("autocmd")
  " vim -b : edit binary using pb-format!
  augroup Binary
    au!

    " set binary option for all binary files before reading them
    au BufReadPre *.pb,*.gmbPackage setlocal binary

    " if on a fresh read the buffer variable is already set, it's wrong
    au BufReadPost *
          \ if exists('b:editPb') && b:editPb |
          \   let b:editPb = 0 |
          \ endif

    " convert to pb on startup for binary files automatically
    au BufReadPost *
          \ if &binary | Pbmode | endif

    " When the text is freed, the next time the buffer is made active it will
    " re-read the text and thus not match the correct mode, we will need to
    " convert it again if the buffer is again loaded.
    au BufUnload *
          \ if getbufvar(expand("<afile>"), 'editPb') == 1 |
          \   call setbufvar(expand("<afile>"), 'editPb', 0) |
          \ endif

    " before writing a file when editing in pb mode, convert back to non-pb
    au BufWritePre *
          \ if exists("b:editPb") && b:editPb && &binary |
          \  let oldro=&ro | let &ro=0 |
          \  let oldma=&ma | let &ma=1 |
          \  silent exe "%!compilepb" |
          \  let &ma=oldma | let &ro=oldro |
          \  unlet oldma | unlet oldro |
          \ endif

    " after writing a binary file, if we're in pb mode, restore pb mode
    au BufWritePost *
          \ if exists("b:editPb") && b:editPb && &binary |
          \  let oldro=&ro | let &ro=0 |
          \  let oldma=&ma | let &ma=1 |
          \  silent exe "%!readpb" |
          \  exe "set nomod" |
          \  let &ma=oldma | let &ro=oldro |
          \  unlet oldma | unlet oldro |
          \ endif
  augroup END
endif


" Don't indent namespace and template
function! CppNoNamespaceAndTemplateIndent()
    let l:cline_num = line('.')
    let l:cline = getline(l:cline_num)
    let l:pline_num = prevnonblank(l:cline_num - 1)
    let l:pline = getline(l:pline_num)
    while l:pline =~# '\(^\s*{\s*\|^\s*//\|^\s*/\*\|\*/\s*$\)'
        let l:pline_num = prevnonblank(l:pline_num - 1)
        let l:pline = getline(l:pline_num)
    endwhile
    let l:retv = cindent('.')
    let l:pindent = indent(l:pline_num)
    if l:pline =~# '^\s*template\s*\s*$'
        let l:retv = l:pindent
    elseif l:pline =~# '\s*typename\s*.*,\s*$'
        let l:retv = l:pindent
    elseif l:cline =~# '^\s*>\s*$'
        let l:retv = l:pindent - &shiftwidth
    elseif l:pline =~# '\s*typename\s*.*>\s*$'
        let l:retv = l:pindent - &shiftwidth
    elseif l:pline =~# '^\s*namespace.*'
        let l:retv = 0
    endif
    return l:retv
endfunction

"if has("autocmd")
"    autocmd BufEnter *.{cc,cxx,cpp,h,hh,hpp,hxx} setlocal indentexpr=CppNoNamespaceAndTemplateIndent()
"endif

function! QtCppIndent()
  " Patterns used to recognise labels and search for the start
  " of declarations
  let labelpat='signals:\|slots:\|public:\|protected:\|private:\|Q_OBJECT'
  let declpat='\(;\|{\|}\)\_s*.'
  " If the line is a label, it's a no brainer
  if match(getline(v:lnum),labelpat) != -1
    return 0
  endif
  " If the line starts with a closing brace, it's also easy: use cindent
  if match(getline(v:lnum),'^\s*}') != -1
    return cindent(v:lnum)
  endif
  " Save cursor position and move to the line we're indenting
  let pos=getpos('.')
  call setpos('.',[0,v:lnum,1,0])
  " Find the beginning of the previous declaration (this is what
  " cindent will mimic)
  call search(declpat,'beW',v:lnum>10?v:lnum-10:0)
  let prevlnum = line('.')
  " Find the beginning of the next declaration after that (this may
  " just get us back where we started)
  call search(declpat,'eW',v:lnum<=line('$')-10?v:lnum+10:0)
  let nextlnum = line('.')
  " Restore the cursor position
  call setpos('.',pos)
  " If we're not after a label, cindent will do the right thing
  if match(getline(prevlnum),labelpat)==-1
    return cindent(v:lnum)
  " It will also do the right thing if we're in the middle of a
  " declaration; this occurs when we are neither at the beginning of
  " the next declaration after the label, nor on the (non-blank) line
  " directly following the label
  elseif nextlnum != v:lnum && prevlnum != prevnonblank(v:lnum-1)
    return cindent(v:lnum)
  endif
  " Otherwise we adjust so the beginning of the declaration is one
  " shiftwidth in
  return &shiftwidth
endfunc
"set indentexpr=QtCppIndent()

"set colorcolumn=81

function! MarkLongLines()
    highlight OverLength ctermbg=darkred ctermfg=white guibg=darkred
"    "let w:m2=matchadd("OverLength", printf('\%%>%dv.\+', &textwidth), -1)
    let w:m2=matchadd("OverLength", "\\%72v.*", -1)
    let w:created=1
endfunc

"autocmd WinEnter *.{c,cc,cxx,cpp,h,hh,hpp,hxx} if !exists('w:created') | call MarkLongLines() | endif
"autocmd BufWinEnter *.{c,cc,cxx,cpp,h,hh,hpp,hxx} if !exists('w:created') | call MarkLongLines() | endif

"autocmd BufEnter *.{cc,cxx,cpp,h,hh,hpp,hxx} setlocal indentexpr=CppNoNamespaceAndTemplateIndent()

"vim:tw=73 et sw=4 comments=\:\"
