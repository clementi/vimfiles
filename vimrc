call plug#begin()

" Tools & Settings

Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-endwise'

" Color Schemes

Plug 'flazz/vim-colorschemes'

" Languages

Plug 'neovimhaskell/haskell-vim'
Plug 'glench/Vim-Jinja2-Syntax'
Plug 'PProvost/vim-ps1'
Plug 'dart-lang/dart-vim-plugin'
Plug 'hashivim/vim-terraform'
Plug 'zah/nim.vim'

call plug#end()

filetype plugin on

set nu!

set ts=4
set sw=4
set et
set lbr
set ai
set bri

" Suppress splash

set shortmess+=I

" Keymaps

map <F12> :set nu!<CR>
map <F11> :set cursorline!<CR>

map <C-Tab> :bn!<CR>
map <C-S-Tab> :bp!<CR>

" Plugin Options

" Airline

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Ack.vim

if executable("ag")
    let g:ackprg = 'ag --vimgrep'
    cnoreabbrev ag Ack
else
    cnoreabbrev ack Ack
endif

" Directories
set backupdir=$TEMP,$TMP,.
set directory=$TEMP,$TMP,.

" Editorconfig-vim

let g:EditorConfig_core_mode = 'python_external'
