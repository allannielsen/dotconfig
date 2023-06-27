"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************

call plug#begin('~/.vim/plugged')
" Plug 'vim-scripts/tlib'            " Utility library
Plug 'tpope/vim-sensible'          " Basic vim settings
Plug 'godlygeek/csapprox'          " Fixes color schema
"Plug 'flazz/vim-colorschemes'      " Lots of color schems
"Plug 'rakr/vim-one'
"Plug 'nightsense/vimspectr'
"Plug 'felixhummel/setcolors.vim'   " Easy browsing of color schema
"
"Plug 'vim-ruby/vim-ruby'           " Better ruby support
"Plug 'rhysd/vim-clang-format'      " Clang format

Plug 'vim-scripts/csindent.vim'    " Project specific settings
Plug 'vim-scripts/FSwitch'         " Easy switching between header and c files
Plug 'vim-scripts/highlight.vim'   " Highlight lines

" Used by LSP
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'

" Plug 'cloudhead/neovim-fuzzy'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Plug 'asciidoc/vim-asciidoc'
Plug 'vim-scripts/SyntaxRange'
Plug 'dahu/vimple'
Plug 'dahu/Asif'
Plug 'dahu/vim-asciidoc'

Plug 'tpope/vim-tbone'             " Access copy-paster buffer in tmux
Plug 'tpope/vim-repeat'            " Just make '.' work as it used to
Plug 'tpope/vim-fugitive'          " Git plugin
Plug 'tpope/vim-unimpaired'        " short-cuts for cnext/cprev and other
Plug 'tpope/vim-speeddating'       " Make <C-A>/<C-X> work for dates (as well)
Plug 'tpope/vim-characterize'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'     " Fancy status line, must come after fugitive

call plug#end()

" Basic Settings
set nocompatible    " Setting an incompatible mode
set ttyfast         " Optimize for quick connection terminal
set number          " Turn on line numbers
set lazyredraw      " Do not redraw while running macros (much faster)
set scrolloff=5     " Scroll before the curser reaches top or buttom
set sidescrolloff=2 " Scroll before the curser reaches left or right side
set textwidth=80    " Set the line width to 80 characters
autocmd FileType c,cpp setlocal colorcolumn=80  " Setting highlight long lines
set hidden          " Allow edit buffers to be hidden
set guioptions=     " Remove menus
set mouse=          " Let the console work as a console without mouse support


colorscheme evening " This is a nice color scheame
"colorscheme github
"colorscheme solarized

if empty($BG)
    set bg=dark
else
    set bg=$BG
endif

if has("multi_byte")
    set fillchars=stl:\ ,stlnc:\ ,vert:┆,fold:-,diff:-    " Displaying symbols to separate windows
    set lcs=tab:\»\ ,trail:•,extends:>,precedes:<,nbsp:¤" " Show white spaces
    let &sbr = nr2char(8618).' '
    set list        " Turn on the display of whitespace
endif

if has("gui_running")
  if has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
  endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noerrorbells    " Turn off beep on error
set hlsearch        " highlight search - show the current search pattern
set incsearch       " Do the search while typing in a search pattern
set ignorecase      " Ignore cases while searching
set showmatch       " showmatch:   Show the matching bracket for the last ')'?

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent      " Auto indent, nice for coding
set smartindent     " Do smart autoindenting when starting a new line.
autocmd FileType c,cpp setlocal cindent
set copyindent      " Mirroring offset with automatic indentation
set shiftwidth=4    " Number of spaces to use for each insertion of (auto)indent.
set tabstop=8       " Number of spaces that a <Tab> in the file counts for
set expandtab       " Expand Tabs (use spaces)?.
set formatoptions=tcrqnj " See Help (complex)
set linebreak       " Insert automatic line breaks while typing
set nowrap          " No wrap while displaying long lines
set cinoptions=h2,l2,g2,t0,i8,+8,(0,w1,W8,N-s

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Storage
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set directory=~/.vim/tmp,~/tmp,.,/tmp " Set the temporary directory
set confirm " Instead of an error message at the end of the editor asks whether to change Saved
set viminfo='100000,f1,:100000,/100000 " Setting File viminfo
set undodir=~/.vim/undodir " Directory for saving undo
set undofile               " Set the file name to undo - automatically
set undolevels=1024        " The number of changes that can be returned
set undoreload=65538       " The maximum number of lines that can be saved in the undo buffer RELOADE

" Bash like tab completion
set wildmode=longest,list,full
set wildmenu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Powerline status bar
let g:Powerline_symbols="fancy"
let g:Powerline_theme="default"
let g:Powerline_colorscheme="default"
let g:airline_powerline_fonts = 1

nnoremap <C-p> :FuzzyOpen<CR>

function SetLSPShortcuts()
  nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
  nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()

augroup LSP
  autocmd!
  autocmd FileType cpp,c call SetLSPShortcuts()
augroup END


set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'
