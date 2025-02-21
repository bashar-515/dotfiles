call plug#begin()

Plug 'christoomey/vim-tmux-navigator'

call plug#end()

let mapleader = " "

inoremap jk <Esc> " exit insert mode
nnoremap <leader>nh :nohl<CR> " clear search highlights

nnoremap <leader>sv <C-w>v " split window vertically
nnoremap <leader>sh <C-w>s " split window horizontally
nnoremap <leader>se <C-w>= " make splits equal size
nnoremap <leader>sx :close<CR> " close current split

nnoremap <leader>to :tabnew<CR> " open new tab
nnoremap <leader>tx :tabclose<CR> " close current tab
nnoremap <leader>tn :tabn<CR> " go to next tab
nnoremap <leader>tp :tabp<CR> " go to previous tab
nnoremap <leader>tf :tabnew %<CR> " open current buffer in new tab
nnoremap <leader>ts :tab split<CR> " open current buffer in new tab without moving cursor

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
