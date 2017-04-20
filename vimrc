call plug#begin()

" Tools & Settings

Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'

" Color Schemes

Plug 'NewProggie/NewProggie-Color-Scheme'

call plug#end()

set ts=4
set sw=4
set et
set lbr
set ai

let g:airline#extensions#tabline#enabled = 1
