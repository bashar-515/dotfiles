let mapleader = " "

set background=dark
colorscheme gruvbox-material

inoremap jk <Esc>
nnoremap <leader>nh :nohl<CR>

nnoremap <leader>sv <C-w>v
nnoremap <leader>sh <C-w>s
nnoremap <leader>se <C-w>=
nnoremap <leader>sx :close<CR>

nnoremap <leader>to :tabnew<CR>
nnoremap <leader>tx :tabclose<CR>
nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tp :tabp<CR>
nnoremap <leader>tf :tabnew %<CR>
nnoremap <leader>ts :tab split<CR>

set relativenumber
set number

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

set ignorecase
set smartcase

set cursorline

set signcolumn=yes

set backspace=indent,eol,start

set clipboard+=unnamedplus

set splitright
set splitbelow

set scrolloff=8
set nowrap
set undofile

let extra_file = expand("~/.vim/extra.vim")
if filereadable(extra_file)
  execute "source " . extra_file
endif
