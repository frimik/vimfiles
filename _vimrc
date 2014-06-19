" https://github.com/gmarik/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'FuzzyFinder'
" scripts not on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" ...

" vim-chef
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'vadv/vim-chef'

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-sensible'
Plugin 'python.vim'
Plugin 'pythonhelper'

Plugin 'Lokaltog/vim-distinguished'

Plugin 'CountJump'
Plugin 'ingo-library'
Plugin 'ConflictMotions'

Plugin 'elzr/vim-json'

Plugin 'tpope/vim-markdown'

" The vim-kolor colorscheme from https://github.com/zeis/vim-kolor
Plugin 'zeis/vim-kolor'
let g:kolor_italic=1                    " Enable italic. Default: 1
let g:kolor_bold=1                      " Enable bold. Default: 1
let g:kolor_underlined=0                " Enable underline. Default: 0
let g:kolor_alternative_matchparen=0    " Gray 'MatchParen' color. Default: 0
colorscheme kolor

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line


set ts=2
set expandtab
set shiftwidth=2

if has('gui_running')
  set guifont=Consolas:h11:cDEFAULT

  " remove (m)enu bar, (T)ool bar and (r)ight-hand scroll bar:
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  
  " initial window size
  set lines=50 columns=128
else

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

autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType ruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby let g:rubycomplete_classes_in_global=1

autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal shiftwidth=4

" http://vim.wikia.com/wiki/Omni_completion_popup_menu
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
"let g:SuperTabDefaultCompletionType = "context"

" http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
match OverLength /\%80v.\+/

" minor tag jump fix
" http://tartley.com/?p=1277
" go to defn of tag under the cursor
fun! MatchCaseTag()
    let ic = &ic
    set noic
    try
        exe 'tjump ' . expand('<cword>')
    finally
       let &ic = ic
    endtry
endfun
nnoremap <silent> <c-'> :call MatchCaseTag()<CR>

