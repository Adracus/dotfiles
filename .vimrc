set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Lean & mean status / tabline for Vim
Plugin 'vim-airline/vim-airline'

call vundle#end()
filetype plugin indent on

" Enable syntax highlighting
syntax on

" allow backspacing over everything in insert mode
" (otherwise, sometimes vim won't allow deleting text that was not inserted
" in your current session)
set backspace=indent,eol,start

" Enable wildcard menu for filename completion
set wildmenu

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

