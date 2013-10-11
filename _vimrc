execute pathogen#infect()
syntax on
filetype plugin indent on

set ts=2
set expandtab
set shiftwidth=2

if has('gui_running')
  colorscheme wombat256mod
  set guifont=Consolas:h11:cDEFAULT

  " remove (m)enu bar, (T)ool bar and (r)ight-hand scroll bar:
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
else
  colorscheme wombat
endif

set ignorecase
set smartcase

" Navigate tabs with Alt-left/right
nnoremap <M-Left> gT
nnoremap <M-Right> gt
