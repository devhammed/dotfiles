" Load Plugins
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" Required for vim to be iMproved
set nocompatible

" Determines filetype from name to allow intelligent auto-indenting, etc.
filetype indent plugin on

" Enable syntax highlighting
syntax enable
colorscheme dracula

" Moving lines up (Alt + Up Arrow) and down (Alt + Down Arrow)
noremap <A-down> ddp
noremap <A-up> :call feedkeys(line('.') == 1 ? '' : 'ddkP')<CR>

" Better command-line completion
set wildmenu

" Use case insensitive search except when using capital letters
set ignorecase
set smartcase

" When opening a new line and no file-specific indenting is enabled,
" keep same indent as the line you're currently on
set autoindent

" Stricter indent rules for C 
set cindent

" Display line numbers on the left
set number

" Number of visual spaces per TAB
set tabstop=2

" Number of spaces in TAB when editing
set softtabstop=2

" Number of spaces indented when reindent operations (>> and <<) are used
set shiftwidth=2

" Convert TABs to spaces
set expandtab

" Enable intelligent tabbing and spacing for indentation and alignment
set smarttab

" Set different identation for PHP
autocmd BufEnter *.php setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Set nonumber for .crt and .key files
autocmd BufEnter *.key,*.crt setlocal nonumber
