call plug#begin()

" List your plugins here
Plug 'tomasiser/vim-code-dark'
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


set encoding=UTF-8

call plug#end()


let g:coc_disable_startup_warning = 1
colorscheme codedark
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

let b:ale_fixers = {'javascript': ['prettier', 'eslint'], 'python': ["flake8", "pylint"],}

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'background': 'dark', 
      \ }
