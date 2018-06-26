set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

call vundle#end()
filetype plugin indent on

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

