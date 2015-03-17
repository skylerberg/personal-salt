set nocompatible
filetype off
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype ruby setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype eruby setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufReadPost *.yml set syntax=sls

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

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
Plugin 'git://github.com/kien/ctrlp.vim.git'
Plugin 'git://github.com/vim-scripts/closetag.vim.git'
Plugin 'git://github.com/wting/rust.vim'

Bundle "lepture/vim-jinja"

call vundle#end()
filetype plugin indent on
syntax on

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:EasyMotion_leader_key = '<Leader>'

set smarttab
set number
set ruler
set showcmd
set incsearch
set hlsearch
set ignorecase
set smartcase
set splitbelow
set splitright
set lazyredraw
set hidden
set history=1000
set backspace=2
set ttimeoutlen=100
set notimeout
set autowrite

let mapleader = ","
inoremap jj <Esc>
cnoremap w!! w !sudo tee % >/dev/null
nnoremap <silent> ,/ :let @/ = ""<CR>
