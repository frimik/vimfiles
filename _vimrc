" https://github.com/gmarik/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if has("unix") && !has("win32unix")
  set rtp+=~/.vim/bundle/vundle/
else
  set rtp+=~/vimfiles/bundle/vundle/
endif
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim'}
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

Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-sensible'

Plugin 'Lokaltog/vim-distinguished'

Plugin 'CountJump'
Plugin 'ingo-library'
Plugin 'ConflictMotions'

Plugin 'elzr/vim-json'

Plugin 'tpope/vim-markdown'

Plugin 'klen/python-mode'

Plugin 'frimik/vim-winclipper', {'rtp': 'vim'}


" https://justin.abrah.ms/vim/vim_and_python.html
" NERD_tree
Plugin 'scrooloose/nerdtree'

Plugin 'majutsushi/tagbar'

" Adaptations of the molokai colorscheme
Plugin 'sentientmachine/Pretty-Vim-Python'

Plugin 'vim-scripts/EasyGrep'

Plugin 'bling/vim-airline'

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()
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

" Viewport Controls
" ie moving between split panes
map <silent><Leader>h <C-w>h
map <silent><Leader>j <C-w>j
map <silent><Leader>k <C-w>k
map <silent><Leader>l <C-w>l

" search tags before cscope database(s)
" https://bugzilla.redhat.com/show_bug.cgi?id=143039
set csto=1

"set tags=tags;$HOME/.vim/tags/
" vim-easytags
let g:easytags_dynamic_files = 1
set cpoptions += "d"

" taglist, (currently replaced by tagbar plugin)
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
map <F7> :TlistToggle<CR>

" Tagbar config
nmap <F8> :TagbarToggle<CR>

set showcmd
let mapleader = ","

let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
map <silent> <F3> :NERDTreeToggle<CR>
"nmap <silent> <F3> :NERDTreeToggle<CR>

colorscheme molokai
set background=dark
" fix colors for indentline
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=235


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
vmap <silent> <Leader>y "xy<CR>:wviminfo! ~/.viminfo
nmap <silent> <Leader>p :rviminfo! ~/.viminfo<CR>"xp

" Chef
autocmd FileType ruby set filetype=ruby.eruby.chef
autocmd FileType eruby set filetype=eruby.chef
autocmd BufRead,BufNewFile {Gemfile,Vagrantfile,Berksfile} set ft=ruby

" Omnicomplete and SuperTab settings
set omnifunc=syntaxcomplete#Complete

autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType ruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby let g:rubycomplete_classes_in_global=1

"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType python setlocal shiftwidth=4

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

" PymodeVirtualenv autodetect ...
let g:pymode_virtualenv = 1
" workaround for https://github.com/klen/python-mode/issues/342
let g:pymode_rope_lookup_project = 0


