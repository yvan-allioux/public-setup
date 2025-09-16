set nocompatible
set number
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set clipboard=unnamedplus
set mouse=a
syntax on
set background=dark
set ruler
set showcmd
set incsearch
set hlsearch
set ignorecase
set smartcase
set wildmenu
set wildmode=longest:full,full
set list
set listchars=tab:▸\ ,trail:·
autocmd BufWritePre * :%s/\s\+$//e
