if has('win32')
  set guifont=Consolas:h10.2
elseif has('macunix')
  if !has("gui_vimr")
    set guifont=Menlo:h13
  endif
else
  set guifont=monospace\ 11
endif

set background=dark
colors PaperColor

set guioptions-=m
set guioptions-=T

set lines=50
set columns=120
