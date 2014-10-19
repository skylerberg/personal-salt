set nocompatible              " be iMproved, required
filetype off                  " required
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'git://github.com/SirVer/ultisnips.git'

Plugin 'git://github.com/honza/vim-snippets.git'

Plugin 'git://github.com/tpope/vim-surround.git'

Plugin 'git://github.com/tpope/vim-repeat.git'

Plugin 'git://github.com/vim-scripts/matchit.zip.git'

Plugin 'git://github.com/vim-scripts/a.vim.git'

Plugin 'git://github.com/scrooloose/syntastic.git'

Plugin 'git://github.com/Lokaltog/vim-easymotion.git'

Plugin 'git://github.com/tpope/vim-fugitive.git'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'git://github.com/saltstack/salt-vim.git'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>" 
let g:EasyMotion_leader_key = '<Leader>'

"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set autowrite		" Automatically save before commands like :next and :make

filetype plugin indent on
syntax on

set smarttab
"set tabstop=4
"set shiftwidth=4
"set expandtab
set autoindent

set ruler
set showcmd
set nocompatible
set autowrite
inoremap jj <Esc>

set number
set incsearch
set hlsearch

noremap <F2> <Esc>:e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
noremap <F3> <Esc>:vs %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
noremap <F4> <Esc>:e Makefile<CR>
noremap <F5> <Esc>:vs Makefile<CR>
cnoremap w!! w !sudo tee % >/dev/null
nnoremap <silent> ,/ :let @/ = ""<CR>

set splitbelow
set splitright
set lazyredraw
set hidden
let mapleader = ","
set history=1000
set backspace=2
set ttimeoutlen=100
set notimeout
