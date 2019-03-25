if has('win32') && !has('nvim')
  set guifont=Consolas:h10.2
elseif has('macunix')
  if !has("gui_vimr")
    set guifont=Menlo:h13
  endif
  set linespace=2
endif

set guioptions-=m
set guioptions-=T
set guioptions=

if !has("gui_vimr")
  set lines=50
  set columns=120
endif
