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
  
  " initial window size
  set lines=50 columns=128
else
  colorscheme wombat

  " initial window size
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=128
  endif
endif

set ignorecase
set smartcase

" Navigate tabs with Alt-left/right
nnoremap <M-Left> gT
nnoremap <M-Right> gt

" Share register x between active Vim windows.
vmap <silent> ,y "xy<CR>:wviminfo! ~/.viminfo
nmap <silent> ,p :rviminfo! ~/.viminfo<CR>"xp

" Convenient toggle for NERDTree
nmap <silent> <F3> :NERDTreeToggle<CR>
