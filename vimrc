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
"nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

"if has("autocmd")
"  filetype plugin indent on
"endif

filetype plugin indent on
syntax on
"colorscheme quantum
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
" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

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

":imap <leader>m <C-n><C-x>
":imap <leader>n <C-n>
" key for open nerdtree
:nmap <F2> :NERDTreeToggle<CR>
"change inside parentheses
:nmap <leader>p ci)
:nmap <leader>d di)
" change between screens "
:nmap <leader>w <C-w>w
:nmap <leader>ci 0wi#<Esc>
:nmap <leader>cc 0i#<Esc>
:nmap <leader>. Lzz
:nmap <leader>m Hzz
"Setting some configurations for Python purposes
:nmap <leader>p :!clear && ~/anaconda3/bin/python -B % <CR>
:nmap <leader>test :!test  


"Setting some configurations for C++ purposes
"with ",cr" you can compile and run your c/c++ program
:nmap <leader>createc :! ~/anaconda3/bin/python ~/.vim/pyFiles/createClass.py % <CR> <CR>
:nmap <leader>_test :! ~/anaconda3/bin/python ~/.vim/pyFiles/createInstanceOfTest.py % <CR>
:nmap <leader>re :!make %:r<CR> :!./%:r
:nmap <leader>ra :!g++ -o main *.cpp<CR> :!./main 
:nmap <leader>ogl :!gcc -o main % -lglut -lGL -lGLU -lm <CR> :!./main <CR>
:nmap <leader>ocv :!g++ -o main % `pkg-config opencv --cflags --libs` <CR> :!./main <CR>
:nmap <leader>l :!clear <CR><CR>
" If you're using the eigen library for 
" matrices, arrays, and linear algebra
" you can type ,reigen and that will compile
:nmap <leader>reigen :!g++ -I /home/hphesto/git/nogit/cpp/eigenLibrary -o main *.cpp<CR> :!./main

"Setting some configurations for git purposes

:nmap <leader>gc :!git add % && git commit -m "update" <CR> 
":let t = strftime('%c') 
":nmap <leader>t :!date
:nmap <leader>up :!~/anaconda3/bin/python -B ~/.vim/pyFiles/update.py % <CR>
"commit is maped as cm
"git push origin master is maped as gm
"git push origin develop is maped as gd
:nmap <leader>gum :!~/anaconda3/bin/python -B ~/.vim/pyFiles/update.py % && git add % && git cm -m "update" <CR> 
:nmap <leader>gud :!~/anaconda3/bin/python -B ~/.vim/pyFiles/update.py % && ~/anaconda3/bin/python ~/.vim/pyFiles/git.py % 
:nmap <leader>gm :!git add % && git cm -m "update" <CR>

"Setting some configurations for latex purposes
:nmap <leader>latex :!pdflatex % <CR> 
