call plug#begin()

set nocompatible
" List your plugins here
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive' 
Plug 'ryanoasis/vim-devicons'
Plug 'dense-analysis/ale'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tomasiser/vim-code-dark'
Plug 'sheerun/vim-polyglot'
Plug 'davidhalter/jedi-vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-sandwich'
Plug 'vlime/vlime'


call plug#end()

set encoding=UTF-8
set number
set termguicolors
set noswapfile

let g:coc_disable_startup_warning = 1
colorscheme codedark

highlight Normal guibg=#0B1c2c ctermbg=NONE

let g:coc_disable_startup_warning = 1
let g:coc_default_semantic_highlight_groups = 1
let mapleader = ","
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Refresh the current folder when Vim gains focus from another application
autocmd FocusGained * NERDTreeRefreshRoot


let b:ale_fixers = {'javascript': ['prettier', 'eslint'], 'python': ["flake8", "pylint"],}

let g:lightline = {
      \ 'colorscheme': 'solarized', 
      \ 'background': 'dark',
      \ }
