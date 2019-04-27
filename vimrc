call plug#begin()

" Tools & Settings
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
"Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-endwise'
Plug 'Shougo/vimshell.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'vim-scripts/AutoComplPop'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
"if has('nvim') && !has('win32')
  "Plug 'neomake/neomake'
"endif
Plug 'justinmk/vim-gtfo'

" Color Schemes
"Plug 'rainglow/vim'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'mhartington/oceanic-next'
Plug 'Nequo/vim-allomancer'
Plug 'kamykn/skyhawk'
Plug 'kamykn/skyknight'
Plug 'nightsense/cosmic_latte'
Plug 'sainnhe/vim-color-forest-night'
Plug 'yous/vim-open-color'
Plug 'ntk148v/vim-horizon'
Plug 'liuchengxu/space-vim-theme'
"Plug 'srushti/my.vim'
Plug 'maksimr/Lucius2'
Plug 'vim-scripts/Ambient-Color-Scheme'
Plug 'tjammer/blayu.vim'
Plug 'Heorhiy/VisualStudioDark.vim'
Plug 'sts10/vim-pink-moon'
Plug 'chase/focuspoint-vim'
Plug 'aonemd/kuroi.vim'

" Languages
Plug 'neovimhaskell/haskell-vim'
"Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
"if has('nvim') && !has('win32')
  "Plug 'parsonsmatt/intero-neovim'
"endif
"Plug 'alx741/vim-hindent'
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
Plug 'idris-hackers/idris-vim'
"Plug 'the-lambda-church/coquille'
Plug 'kchmck/vim-coffee-script'
"Plug 'wlangstroth/vim-racket'
Plug 'rgrinberg/vim-ocaml'
Plug 'fatih/vim-go'
Plug 'tomlion/vim-solidity'
"Plug 'keith/swift.vim'
"Plug 'posva/vim-vue'
"Plug 'mxw/vim-jsx'
"Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-cucumber'

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

"set listchars=tab:>\ ,trail:-,eol:$

" Suppress splash
set shortmess+=I

" Keymaps
map <F12> :set nu!<CR>
map <leader>n :set nu!<CR>
map <F11> :set cursorline!<CR>
map <leader>l :set cursorline!<CR>
map <leader>p :w!!pf<CR>
"map <leader>h :set list!<CR>

map <C-Tab> :bn!<CR>
map <C-S-Tab> :bp!<CR>
map <C-j> :bp!<CR>
map <C-k> :bn!<CR>

" Plugin Options

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

"" Lightline
"set noshowmode

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
map <C-n> :NERDTreeToggle<CR>

" Directories
set backupdir=$TEMP,$TMP,.
set directory=$TEMP,$TMP,.

" Editorconfig-vim
let g:EditorConfig_core_mode = 'python_external'

if !has("gui_running")
    set background=dark
endif

" intero-neovimhaskell
"augroup interMaps
    "au!

    "" Background processes and window management
    "au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
    "au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

    "" Open intero/ghci split horizontally
    "au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
    "" Open intero/ghci split vertically
    "au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
    "au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>

    "" Reloading
    "au BufWritePost *.hs InteroReload

    "" Load individual modules
    "au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
    "au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

    "" Type information
    "au FileType haskell map <silent> <leader>t <Plug>InteroGenericType
    "au FileType haskell map <silent> <leader>T <Plug>InteroType
    "au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>
    
    "" Navigation
    "au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>

    "" Managing targets
    "" Prompts you to enter targets (no silent):
    "au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
"augroup END

"let g:intero_type_on_hover=1
"let g:intero_start_immediately=1
"let g:intero_window_size=15

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
set termguicolors
if has("nvim") || has('gui')
    set background=dark
    colors base16-default-dark
endif

" Mac-specific stuff
if has('macunix') && has('gui_running')
    autocmd VimLeave * macaction terminate:
endif
