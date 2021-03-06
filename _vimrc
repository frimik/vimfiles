" https://github.com/gmarik/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if has("unix") && !has("win32unix")
  set rtp+=~/.vim/bundle/Vundle.vim/
else
  set rtp+=~/vimfiles/bundle/Vundle.vim/
endif
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim'}

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" ...

" vim-chef
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'

Plugin 'vadv/vim-chef'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'voronkovich/ctrlp-nerdtree.vim'
Plugin 'tpope/vim-sensible'

Plugin 'Lokaltog/vim-distinguished'

Plugin 'CountJump'
Plugin 'ingo-library'
Plugin 'ConflictMotions'

Plugin 'elzr/vim-json'

Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

Plugin 'klen/python-mode'

Plugin 'frimik/vim-winclipper', {'rtp': 'vim'}
let g:winclipper_register_path='/vagrant/vimregister.txt'

" https://justin.abrah.ms/vim/vim_and_python.html
" NERD_tree
Plugin 'scrooloose/nerdtree'

Plugin 'majutsushi/tagbar'

" Adaptations of the molokai colorscheme
Plugin 'sentientmachine/Pretty-Vim-Python'
" https://github.com/jnurmine/Zenburn
Plugin 'jnurmine/Zenburn'

Plugin 'vim-scripts/EasyGrep'

Plugin 'bling/vim-airline'

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'nginx/nginx', {'rtp': 'contrib/vim/'}

Plugin 'godlygeek/tabular'

" .aurora syntax plugin
Plugin 'grimreaper/vim-aurora-syntax'

Plugin 'SirVer/ultisnips'

Plugin 'honza/vim-snippets'

" Terraform plug and snippets
Plugin 'hashivim/vim-terraform'

Plugin 'frimik/ultisnips-fridh-snippets'

"Plugin 'valloric/YouCompleteMe'
Plugin 'oblitum/YouCompleteMe'

Plugin 'fatih/vim-go'

Plugin 'Modeliner'

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


if has('gui_running')
  set background=dark
  silent! colorscheme solarized
else
  silent! colors zenburn
endif

  
    
      
        
          
            
              
                
                  
                
              
            
          
        
      
    
  

" silent! colorscheme molokai
" fix colors for indentline
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=235
autocmd FileType yaml IndentGuidesEnable


set ts=2
set expandtab
set shiftwidth=2
set smartindent

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

" number the lines
set number

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
let g:pymode_rope_complete_on_dot = 0

" easier moving of code blocks
" https://www.youtube.com/watch?v=YhqsjUUHj6g
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" ctrlp settings
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

fun! CtrlPOrNERDTree()
  if g:NERDTree.IsOpen()
    CtrlPNerdTree
  else
    CtrlP
  endif
endfun

command! CtrlPOrNERDTree call CtrlPOrNERDTree()

let g:ctrlp_cmd = 'CtrlPOrNERDTree'

""" UltiSnips begin
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsListSnippets='<c-b>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsSnippetsDir='~/.vim/bundle/ultisnips-fridh-snippets/UltiSnips'
""" UltiSnips end

let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_key_list_accept_completion = ['<C-y>']
let g:ycm_python_binary_path = 'python'
let g:ycm_autoclose_preview_window_after_completion=1
" go to definition with ,g
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" list references with ,h
map <leader>h  :YcmCompleter GoToReferences<CR>


" Folding rules {{{
set foldenable                  " enable folding
set foldcolumn=2                " add a fold column
set foldmethod=marker           " detect fold levels based on indent
set foldlevelstart=99           " start out with everything unfolded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
																" which commands trigger auto-unfold

" Mappings to easily toggle fold levels
nnoremap <silent> z0 :set foldlevel=0<cr>
nnoremap <silent> z1 :set foldlevel=1<cr>
nnoremap <silent> z2 :set foldlevel=2<cr>
nnoremap <silent> z3 :set foldlevel=3<cr>
nnoremap <silent> z4 :set foldlevel=4<cr>
nnoremap <silent> z5 :set foldlevel=5<cr>
nnoremap <silent> z6 :set foldlevel=6<cr>
nnoremap <silent> z7 :set foldlevel=7<cr>
nnoremap <silent> z8 :set foldlevel=8<cr>
nnoremap <silent> z9 :set foldlevel=9<cr>
" }}}
