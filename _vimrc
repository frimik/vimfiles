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

  " Fix some colors in terminal ...
  highlight Visual ctermbg=5

  highlight Pmenu ctermbg=13
  highlight PmenuSel ctermbg=7
  highlight PmenuSbar ctermbg=7
endif


" smartcase searching ...
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

" Chef
autocmd FileType ruby set filetype=ruby.eruby.chef
autocmd FileType eruby set filetype=eruby.chef

" Omnicomplete and SuperTab settings
set omnifunc=syntaxcomplete#Complete

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

