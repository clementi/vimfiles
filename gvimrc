set guifont=JetBrains\ Mono:h10

set guioptions-=m
set guioptions-=T
set guioptions=

if !has("gui_vimr")
  set lines=50
  set columns=120
else
  set guifont=JetBrains\ Mono:h13
endif

if has("gui") && has("win32") && !has("nvim")
  set renderoptions=type:directx,gamma:1.5,contrast:0.5,geom:1,renmode:5,taamode:1,level:0.5
endif
