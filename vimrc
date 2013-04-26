"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Loading u-pathogen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath+=$HOME/.vim/bundle/vim-pathogen/
runtime autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible    " Setting an incompatible mode
"set exrc           " Search settings in local files
syntax on           " Turn on syntax highlighting
filetype on         " Support for automatic file type detection
filetype plugin on  " Support for automatic loading of plugins for the file type
filetype indent on  " Support for automatic download script odsadzovacieho
set history=1000    " Set Command History
set ttyfast         " Optimize for quick connection terminal

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=2     " Allows backspacing over indentation, end-of-line, and start-of-line.
set ruler           " Show cursor position
set shortmess=atI   " Kind of messages to show. Abbreviate them all!
set showcmd         " Show current uncompleted command? Absolutely!
set showfulltag     " Auto completion (great for programming)
set splitbelow      " Create new window below current one.
set cmdheight=1     " The command bar high
set number          " Turn on line numbers
set lazyredraw      " Do not redraw while running macros (much faster)
set conceallevel=2  " Enable Wrapping characters
set scrolloff=3     " Scroll before the curser reaches top or buttom
set sidescrolloff=2 " Scroll before the curser reaches left or right side
set textwidth=80    " Set the line width to 80 characters
autocmd FileType c,cpp setlocal colorcolumn=80  " Setting highlight long lines
set hidden          " Allow edit buffers to be hidden
set guioptions=     " Remove menus
"set mouse=a        " Enable mouse scrolling, mouse selection etc.
colorscheme evening " This is a nice color scheame
set laststatus=2    " Always view the status bar

if has("multi_byte")
    set fillchars=stl:\ ,stlnc:\ ,vert:┆,fold:-,diff:-    " Displaying symbols to separate windows
    set lcs=tab:\»\ ,trail:•,extends:>,precedes:<,nbsp:¤" " Show white spaces
    let &sbr = nr2char(8618).' '
    set list        " Turn on the display of whitespace
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noerrorbells    " Turn off beep on error
set hlsearch        " highlight search - show the current search pattern
set incsearch       " Do the search while typing in a search pattern
set ignorecase      " Ignore cases while searching
set showmatch       " showmatch:   Show the matching bracket for the last ')'?
set lazyredraw      " Speed up macros

" Use the cool tab complete menu
set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*~

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent      " Auto indent, nice for coding
set smartindent     " Do smart autoindenting when starting a new line.
"set cindent         " cindent: do c-style indenting
autocmd FileType c,cpp setlocal cindent
set copyindent      " Mirroring offset with automatic indentation
set shiftwidth=4    " Number of spaces to use for each insertion of (auto)indent.
set tabstop=8       " Number of spaces that a <Tab> in the file counts for
"set smarttab       " Use tabs at the start of a line, spaces elsewhere
set expandtab       " Expand Tabs (use spaces)?.
set formatoptions=tcrqn " See Help (complex)
set linebreak       " Insert automatic line breaks while typing
set nowrap          " No wrap while displaying long lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Storage
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set backup " Auto backup files
"set backupdir=~/.vim/backup,.,~/ " Automatically back up the following directories
set directory=~/.vim/tmp,~/tmp,.,/tmp " Set the temporary directory
set confirm " Instead of an error message at the end of the editor asks whether to change Saved
set viminfo='100000,f1,:100000,/100000 " Setting File viminfo
set undodir=~/.vim/undodir " Directory for saving undo
set undofile               " Set the file name to undo - automatically
set undolevels=1024        " The number of changes that can be returned
set undoreload=65538       " The maximum number of lines that can be saved in the undo buffer RELOADE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clang_use_library=1
let g:clang_library_path="/usr/lib"
let g:clang_snippets=1
let g:clang_snippets_engine='ultisnips'
let g:clang_conceal_snippets=1
let g:clang_hl_errors=1
let g:clang_complete_copen=1

let g:clang_periodic_quickfix=0
map <F5> :call g:ClangUpdateQuickFix()<CR>

set completeopt=menuone,menu,preview
"set completeopt=menuone,menu,preview
"               |       |    |
"               |       |    + Uses the preview window
"               |       + Show popup menu for complementarity
"               + View menu even if only one match

" Auto close the preview pane by moving the cursor
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Topping up by pressing Ctrl + Space
imap <C-Space> <C-X><C-I>
imap <Nul> <C-X><C-I>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Powerline status bar
let g:Powerline_symbols="fancy"
let g:Powerline_theme="default"
let g:Powerline_colorscheme="default"


" View mini buffer explorer
map <silent> <F3> :call BufferList()<CR>

" The transition to alternative buffer (eg, from the header file to cpp and vice versa)
map <F12> :A<CR>
imap <F12> <ESC>:A<CR>




