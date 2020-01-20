call plug#begin()

    " Tools & Settings
    Plug 'tpope/vim-sensible'
    "Plug 'junegunn/fzf'
    Plug 'tpope/vim-surround'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/syntastic'
    Plug 'vim-airline/vim-airline'
    "Plug 'itchyny/lightline.vim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'tpope/vim-endwise'
    Plug 'jiangmiao/auto-pairs'
    Plug 'vim-scripts/AutoComplPop'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'mattn/emmet-vim'
    "Plug 'justinmk/vim-gtfo'
    Plug 'ervandew/supertab'

    " Color Schemes
    "Plug 'rainglow/vim'
    Plug 'flazz/vim-colorschemes'
    Plug 'chriskempson/base16-vim'
    Plug 'nightsense/cosmic_latte'
    Plug 'nightsense/snow'
    Plug 'nightsense/vimspectr'
    Plug 'nightsense/seabird'
    Plug 'sonph/onehalf', {'rtp': 'vim/'}
    Plug 'blueshirts/darcula'
    Plug 'tomasiser/vim-code-dark'
    Plug 'rafi/awesome-vim-colorschemes'

    " Languages
    Plug 'jparise/vim-graphql'
    Plug 'ballerina-attic/plugin-vim'
    Plug 'neovimhaskell/haskell-vim'
    Plug 'udalov/kotlin-vim'
    "Plug 'glench/Vim-Jinja2-Syntax'
    "Plug 'PProvost/vim-ps1'
    "Plug 'dart-lang/dart-vim-plugin'
    "Plug 'hashivim/vim-terraform'
    Plug 'zah/nim.vim'
    Plug 'fsharp/vim-fsharp'
    Plug 'pangloss/vim-javascript'
    "Plug 'clementi/pure-vim'
    "Plug 'JuliaEditorSupport/julia-vim'
    "Plug 'ryym/vim-riot'
    Plug 'idris-hackers/idris-vim'
    "Plug 'the-lambda-church/coquille'
    Plug 'kchmck/vim-coffee-script'
    "Plug 'wlangstroth/vim-racket'
    Plug 'rgrinberg/vim-ocaml'
    Plug 'fatih/vim-go'
    Plug 'tomlion/vim-solidity'
    Plug 'keith/swift.vim'
    "Plug 'posva/vim-vue'
    "Plug 'mxw/vim-jsx'
    "Plug 'mustache/vim-mustache-handlebars'
    "Plug 'tpope/vim-cucumber'
    Plug 'stevearc/vim-arduino'
    Plug 'Procrat/oz.vim'

    "" Elixir
    "Plug 'elixir-editors/vim-elixir'
    "Plug 'slashmili/alchemist.vim'

    "" Erlang
    "Plug 'vim-erlang/vim-erlang-omnicomplete'

    "" Typescript
    Plug 'leafgarland/typescript-vim'
    Plug 'Quramy/tsuquyomi'
    Plug 'Quramy/vim-js-pretty-template'

call plug#end()

syntax on
filetype plugin indent on

set nu!

set ts=4
set sw=4
set et
set lbr
set ai

try
    set bri
catch
endtry

" Suppress splash
set shortmess+=I

" Keymaps
map <F12> :set nu!<CR>
map <leader>n :set nu!<CR>
map <F11> :set cursorline!<CR>
map <leader>l :set cursorline!<CR>
map <leader>p :w!!pf<CR>

map <C-Tab> :bn!<CR>
map <C-S-Tab> :bp!<CR>
map <C-j> :bp!<CR>
map <C-k> :bn!<CR>

" Plugin Options

"" Emmet
let g:user_emmet_leader_key='<C-Z>'

"" Syntastic
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, so open Syntastic error location panel
        Errors
    endif
endfunction
nnoremap <silent> <leader>e :call ToggleErrors()<CR>

"" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
set noshowmode

"" NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-n> :NERDTreeToggle<CR>

" Directories
set backupdir=$TEMP,$TMP,$TMPDIR.
set directory=$TEMP,$TMP,$TMPDIR.

if !has("gui_running")
    set background=dark
endif

" Go
let g:go_version_warning=0
let g:go_highlight_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_function_calls=1
let g:go_highlight_operators=1
let g:go_highlight_extra_types=1
let g:go_highlight_build_constraints=1
let g:go_fmt_command="goimports"
let g:go_code_completion_enabled=1

" Close buffer without destroying any splits

nnoremap <Leader>b :call DeleteCurBufferNotCloseWindow()<CR>

" Run file in buffer

nnoremap <F9> :!"%:p"<CR>
nnoremap <leader>r :!"%:p"<CR>

func! DeleteCurBufferNotCloseWindow() abort
    if &modified
        echohl ErrorMsg
        echom "E89: no write since last change"
        echohl None
    elseif winnr('$') == 1
        bd
    else  " multiple window
        let oldbuf = bufnr('%')
        let oldwin = winnr()
        while 1   " all windows that display oldbuf will remain open
            if buflisted(bufnr('#'))
                b#
            else
                bn
                let curbuf = bufnr('%')
                if curbuf == oldbuf
                    enew    " oldbuf is the only buffer, create one
                endif
            endif
            let win = bufwinnr(oldbuf)
            if win == -1
                break
            else        " there are other window that display oldbuf
                exec win 'wincmd w'
            endif
        endwhile
        " delete oldbuf and restore window to oldwin
        exec oldbuf 'bd'
        exec oldwin 'wincmd w'
    endif
endfunc

" Eliminate usage of the arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Colors
if has("nvim") || has('gui')
    set background=dark
    colors hybrid
    set termguicolors
endif

" Mac-specific stuff
if has('macunix') && has('gui_running')
    autocmd VimLeave * macaction terminate:
endif
