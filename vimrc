"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

let g:vim_bootstrap_langs = "c,perl,ruby"
let g:vim_bootstrap_editor = "vim" " nvim or vim

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/tlib'            " Utility library
Plug 'tpope/vim-sensible'          " Basic vim settings
Plug 'godlygeek/csapprox'          " Fixes color schema
"Plug 'flazz/vim-colorschemes'      " Lots of color schems
"Plug 'rakr/vim-one'
"Plug 'nightsense/vimspectr'
"Plug 'felixhummel/setcolors.vim'   " Easy browsing of color schema
"
"Plug 'SirVer/ultisnips'            " Snippet engine
"Plug 'honza/vim-snippets'
"
"Plug 'vim-ruby/vim-ruby'           " Better ruby support
"Plug 'rhysd/vim-clang-format'      " Clang format

Plug 'vim-scripts/csindent.vim'    " Project specific settings
Plug 'vim-scripts/FSwitch'         " Easy switching between header and c files
Plug 'vim-scripts/highlight.vim'   " Highlight lines

" Plug 'cloudhead/neovim-fuzzy'

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

" Plug 'neomutt/neomutt.vim'


"Plug 'altercation/vim-colors-solarized'
"Plug 'endel/vim-github-colorscheme'
"Plug 'morhetz/gruvbox'
"Plug 'NLKNguyen/papercolor-theme'



"let g:make = 'gmake'
"if exists('make')
"        let g:make = 'make'
"endif
"Plug 'Shougo/vimproc.vim', {'do': g:make}
"
"if v:version >= 703
"  Plug 'Shougo/vimshell.vim'
"endif

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

colorscheme evening " This is a nice color scheame
"colorscheme github
"colorscheme solarized

if empty($BG)
    set bg=dark
else
    set bg=$BG
endif

"let g:gruvbox_contrast_dark='hard'
"let g:gruvbox_contrast_light='hard'
"colorscheme gruvbox
"colorscheme PaperColor

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

" use gid for grepping
set grepprg=gid
set grepformat=%f:%l:%m

autocmd BufEnter * :syntax sync minlines=1000

" The transition to alternative buffer (eg, from the header file to cpp and vice versa)
map <F12> :FSHere<CR>
imap <F12> <ESC>:FSHere<CR>

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

set diffexpr=MyDiff()
function MyDiff()
   let opt = ""
   if &diffopt =~ "icase"
     let opt = opt . "-i "
   endif
   if &diffopt =~ "iwhite"
     let opt = opt . "-b "
   endif
   silent execute "!diff -d -a --binary " . opt . v:fname_in . " " . v:fname_new .
        \  " > " . v:fname_out
endfunction

let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" To map <Esc> to exit terminal-mode:
tnoremap <Esc> <C-\><C-n>

" To use `ALT+{h,j,k,l}` to navigate windows from any mode:
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nnoremap <C-p> :FuzzyOpen<CR>
