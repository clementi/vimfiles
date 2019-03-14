if has('win32')
  set guifont=Consolas:h10.2
elseif has('macunix')
  if !has("gui_vimr")
    set guifont=Menlo:h13
  endif
  set linespace=2
else
  set guifont=Meslo\ LG\ S\ 10,monospace\ 10
endif

set background=dark
colors cosmic_latte

set guioptions-=m
set guioptions-=T
set guioptions=

if !has("gui_vimr")
  set lines=50
  set columns=120
endif
