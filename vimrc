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
Plug 'Shougo/vimshell.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'vim-scripts/AutoComplPop'

" Color Schemes
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" Languages
Plug 'neovimhaskell/haskell-vim'
"Plug 'glench/Vim-Jinja2-Syntax'
Plug 'PProvost/vim-ps1'
"Plug 'dart-lang/dart-vim-plugin'
"Plug 'hashivim/vim-terraform'
"Plug 'zah/nim.vim'
Plug 'fsharp/vim-fsharp'
Plug 'pangloss/vim-javascript'
"Plug 'clementi/pure-vim'
"Plug 'JuliaEditorSupport/julia-vim'
"Plug 'ryym/vim-riot'
"Plug 'idris-hackers/idris-vim'
"Plug 'the-lambda-church/coquille'
"Plug 'kchmck/vim-coffee-script'
"Plug 'wlangstroth/vim-racket'
"Plug 'rgrinberg/vim-ocaml'
Plug 'fatih/vim-go'
Plug 'tomlion/vim-solidity'
"Plug 'keith/swift.vim'
"Plug 'posva/vim-vue'
"Plug 'mxw/vim-jsx'
"Plug 'mustache/vim-mustache-handlebars'

"" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

"" Erlang
"Plug 'vim-erlang/vim-erlang-omnicomplete'

"" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'Quramy/vim-js-pretty-template'

call plug#end()

syntax on
filetype plugin indent on
"set omnifunc=syntaxComplete#Complete
"set completeopt=longest,menuone

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
map <F11> :set cursorline!<CR>

map <C-Tab> :bn!<CR>
map <C-S-Tab> :bp!<CR>

" Plugin Options

"" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0

"" Ack.vim
if executable("ag")
    let g:ackprg = 'ag --vimgrep'
    cnoreabbrev ag Ack
else
    cnoreabbrev ack Ack
endif

"" NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Directories
set backupdir=$TEMP,$TMP,.
set directory=$TEMP,$TMP,.

" Editorconfig-vim
let g:EditorConfig_core_mode = 'python_external'

if !has("gui_running")
    set background=dark
endif

" Close buffer without destroying any splits

nnoremap <Leader>b :call DeleteCurBufferNotCloseWindow()<CR>

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

" Mac-specific stuff
autocmd VimLeave * macaction terminate:
