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
set bri

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Keymaps

map <F12> :set nu!<CR>
map <F11> :set cursorline!<CR>
