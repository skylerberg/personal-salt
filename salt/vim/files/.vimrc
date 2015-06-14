set nocompatible
filetype off
au Bufread,BufNewFile *.feature set filetype=gherkin
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype ruby setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype eruby setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd Filetype gherkin setlocal expandtab tabstop=2 shiftwidth=2
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
Plugin 'git://github.com/python-rope/ropevim.git'
Plugin 'git://github.com/Valloric/YouCompleteMe.git'
Plugin 'git://github.com/tpope/vim-cucumber.git'

Bundle "lepture/vim-jinja"

call vundle#end()
filetype plugin indent on
syntax on

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:EasyMotion_leader_key = '<Leader>'

" Syntax checkers
let g:syntastic_python_checkers = ['flake8', 'pylint']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_pylint_args = '--rcfile=/home/skyler/.pylintrc'

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" Speed up CtrlP indexing
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*,*/bin/*,
set wildignore+=*/node_modules/*,*/bower_components/*,

" Ropevim settings
let g:ropevim_autoimport_modules = ["os", "shutil"]

set smarttab
set number
set ruler
set showcmd
set incsearch
set hlsearch
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


function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
