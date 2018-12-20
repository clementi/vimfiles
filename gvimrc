if has('win32')
  set guifont=IBM_Plex_Mono:h10.2,Consolas:h10.2
elseif has('macunix')
  set guifont=IBM_Plex_Mono:h13,Menlo:h13
else
  set guifont=IBM\ Plex\ Mono\ 13,monospace\ 11
endif

set background=dark
colors PaperColor

set guioptions-=m
set guioptions-=T

set lines=50
set columns=120
