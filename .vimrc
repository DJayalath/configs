" Auto-install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Call :PlugInstall to install plugins
call plug#begin('~/.vim/plugged')

" Sensible vim default configuration
Plug 'tpope/vim-sensible'

" Colorschemes pack
Plug 'flazz/vim-colorschemes'

" gc in visual mode to comment out selection
" gcc to comment out a line in normal mode
" gc toggles, so uncomments if already commented
Plug 'tpope/vim-commentary'

call plug#end()

syntax on
colo molokai
set autoindent

" Highlight character past 80-char line
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)


