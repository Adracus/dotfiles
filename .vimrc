call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'derekwyatt/vim-scala'

:set number 

augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

call plug#end()
