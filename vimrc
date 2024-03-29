call plug#begin()

    " Tools & Settings
    Plug 'tpope/vim-sensible'
    Plug 'junegunn/fzf'
    Plug 'tpope/vim-surround'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'preservim/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'tpope/vim-endwise'
    Plug 'jiangmiao/auto-pairs'
    Plug 'mattn/emmet-vim'
    " Plug 'phaazon/mind.nvim', {'branch': 'v2'}
    " Plug 'machakann/vim-sandwich'
    " Plug 'dense-analysis/ale'

    " Color Schemes
    Plug 'rafi/awesome-vim-colorschemes'

    " Languages
    Plug 'unisonweb/unison', { 'branch': 'trunk', 'rtp': 'editor-support/vim' }
    Plug 'ziglang/zig.vim'
    " Plug 'lluchs/vim-wren'
    " Plug 'artoj/pgn-syntax-vim'
    " Plug 'vim-scripts/sgf.vim'
    Plug 'cespare/vim-toml'
    " Plug 'FStarLang/VimFStar'
    " Plug 'derekelkins/agda-vim'
    " Plug 'melrief/vim-frege-syntax'
    " Plug 'jparise/vim-graphql'
    " Plug 'kevinoid/vim-jsonc'
    " Plug 'martinda/Jenkinsfile-vim-syntax'
    " Plug 'ballerina-attic/plugin-vim'
    Plug 'neovimhaskell/haskell-vim'
    " Plug 'udalov/kotlin-vim'
    " Plug 'vale1410/vim-minizinc'
    "Plug 'glench/Vim-Jinja2-Syntax'
    Plug 'PProvost/vim-ps1'
    "Plug 'dart-lang/dart-vim-plugin'
    " Plug 'hashivim/vim-terraform'
    " Plug 'zah/nim.vim'
    " Plug 'fsharp/vim-fsharp'
    Plug 'pangloss/vim-javascript'
    " Plug 'clementi/pure-vim'
    " Plug 'JuliaEditorSupport/julia-vim'
    "Plug 'ryym/vim-riot'
    " Plug 'idris-hackers/idris-vim'
    "Plug 'the-lambda-church/coquille'
    " Plug 'kchmck/vim-coffee-script'
    " Plug 'wlangstroth/vim-racket'
    " Plug 'rgrinberg/vim-ocaml'
    Plug 'fatih/vim-go'
    Plug 'tomlion/vim-solidity'
    " Plug 'keith/swift.vim'
    " Plug 'posva/vim-vue'
    " Plug 'mxw/vim-jsx'
    " Plug 'mustache/vim-mustache-handlebars'
    " Plug 'tpope/vim-cucumber'
    " Plug 'stevearc/vim-arduino'
    " Plug 'Procrat/oz.vim'
    Plug 'rust-lang/rust.vim'
    " Plug 'gootorov/q-sharp.vim'

    "" Elixir
    " Plug 'elixir-editors/vim-elixir'
    " Plug 'slashmili/alchemist.vim'

    "" Erlang
    " Plug 'vim-erlang/vim-erlang-omnicomplete'

    "" Typescript
    Plug 'leafgarland/typescript-vim'
    " Plug 'Quramy/tsuquyomi'
    " Plug 'Quramy/vim-js-pretty-template'

    " Plug 'arrufat/vala.vim'
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

map <leader>s :call RemoveTrailingWhitespace()<CR>

" Plugin Options

"" Emmet
let g:user_emmet_leader_key='<C-Z>'

"" Remove trailing whitespace
function RemoveTrailingWhitespace()
    %s/\s\+$//e
endfunction

"" Syntastic
" function! ToggleErrors()
    " let old_last_winnr = winnr('$')
    " lclose
    " if old_last_winnr == winnr('$')
        " " Nothing was closed, so open Syntastic error location panel
        " Errors
    " endif
" endfunction
" nnoremap <silent> <leader>e :call ToggleErrors()<CR>

"" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"" Airline Theme
let g:airline_theme='hybridline'

set noshowmode

"" NERDcommenter
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = { 'fstar': { 'left': '(*', 'right': '*)' },
                             \ 'jsonc': { 'left': '//', 'right': '' },
                             \ 'qs': { 'left': '//', 'right': '' } }

"" NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-n> :NERDTreeToggle<CR>

"" vim-hexdec
noremap gbh :Dec2Hex<CR>
noremap gbd :Hex2Dec<CR>

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

" Remove trailing whitespace in certain file types
autocmd FileType haskell,scala,c,cpp,java,python,fsharp,fstar,ocaml,sml,csharp,json,jsonc,javascript,scheme,racket,clojure,lisp,d,rust,go autocmd BufWritePre <buffer> call RemoveTrailingWhitespace()

" Colors
set background=dark
colors hybrid
if has("nvim") || has('gui')
    set termguicolors
endif

" Mac-specific stuff
if has('macunix') && has('gui_running')
    autocmd VimLeave * macaction terminate:
endif
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
" let s:opam_share_dir = system("opam config var share")
" let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

" let s:opam_configuration = {}

" function! OpamConfOcpIndent()
  " execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
" endfunction
" let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

" function! OpamConfOcpIndex()
  " execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
" endfunction
" let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

" function! OpamConfMerlin()
  " let l:dir = s:opam_share_dir . "/merlin/vim"
  " execute "set rtp+=" . l:dir
" endfunction
" let s:opam_configuration['merlin'] = function('OpamConfMerlin')

" let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
" let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
" let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
" for tool in s:opam_packages
  " " Respect package order (merlin should be after ocp-index)
  " if count(s:opam_available_tools, tool) > 0
    " call s:opam_configuration[tool]()
  " endif
" endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## c0efd5425fb503b29fda6973a6204b6e ## you can edit, but keep this line
" if !has("win32") && count(s:opam_available_tools,"ocp-indent") == 0 && filereadable("/home/jeff/.opam/ocaml/share/ocp-indent/vim/indent/ocaml.vim")
  " source /home/jeff/.opam/ocaml/share/ocp-indent/vim/indent/ocaml.vim
" endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
