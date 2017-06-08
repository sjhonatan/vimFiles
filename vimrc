" .vimrc file modified by Jhonatan da Silva

"Set up for search the pathogen file for loading vim setups
runtime ~/.vim/bundle/pathogen/autoload/pathogen.vim

" Pathogen load
filetype off
call pathogen#infect()
call pathogen#helptags()
:set noshowmatch

"different menu
set wildmenu 
"Shows the commands that you type in the botton of the screen
set showcmd
"This map is to make a file with a map of a file that you use a lot
filetype plugin indent on
syntax on
colorscheme blues
"For no vi compatibility
set nocompatible
set nocp
set modelines=0
" Showing line numbers and length
set number " show line numbers
set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233
"Show the relative number on the left screen
set relativenumber
set foldmethod=indent
set foldlevel=99
"Some configurations for python
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

set encoding=utf-8
set scrolloff=3
set showmode
set hidden
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile

let mapleader = ','
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap 
set formatoptions=qrn1
set colorcolumn=85
"set lazyredraw

"Disable F1 Help command
inoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap <F1> <ESC>
"you can use ; as : 
nnoremap ; :
au FocusLost * :wa
"add comment to the init of the line
"delete line
:nmap - dd
:nmap <leader>' ci'
:nmap <leader>9 ci(
:nmap <leader>[ ci[

" change between screens "
:nmap <leader>w <C-w>w
" clean screen "
:nmap <leader>l :!clear <CR><CR>
"Setting some configurations for Python purposes
:let conda3py="/home/hphesto/anaconda3/bin/python "
:let pyVim="/home/hphesto/.vim/pyFiles"
:let pyUpdate="/home/hphesto/anaconda3/bin -B /home/hphesto/.vim/pyFiles/update.py"
:let pyGit="/home/hphesto/anaconda3/bin -B /home/hphesto/.vim/pyFiles/git.py"
:nmap <leader>p :!clear && conda3py -B % <CR>
"Setting some configurations for C++ purposes
:nmap <leader>re :!make %:r<CR> :!./%:r
:nmap <leader>gud :!pyUpdate % && pyGit % 

"Setting some configurations for latex purposes
:nmap <leader>latex :!pdflatex % <CR> 
