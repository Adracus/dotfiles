set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Fuzzy file, buffer, mru, tag ... finder for Vim
Plugin 'ctrlpvim/ctrlp.vim'

" Syntax checking plugin
Plugin 'scrooloose/syntastic'

" Lean & mean status / tabline for Vim
Plugin 'vim-airline/vim-airline'

call vundle#end()
filetype plugin indent on

" Enable syntax highlighting
syntax on

" Speed up escape handling
set noesckeys
set timeout timeoutlen=200

" Use smart and auto indentation
set smartindent
set autoindent

" Tab settings
set expandtab
set tabstop=4
set shiftwidth=4

" Enable line numbers
set number

" Don't wrap long lines
set nowrap

" Quick escape in insert mode
inoremap jk <esc>

