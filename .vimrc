set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line

Plugin 'junegunn/fzf' " Fuzzy Finder
Plugin 'tpope/vim-commentary' " Comment toggler
Plugin 'mhartington/oceanic-next'
Plugin 'sheerun/vim-polyglot' " Extended syntax highlighting (+Haskell)
Plugin 'neoclide/coc.nvim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround' " Surround
Plugin 'preservim/nerdtree' " File tree
Plugin 'neovimhaskell/haskell-vim' " Haskell syntax highlighting
Plugin 'jiangmiao/auto-pairs' " Bracket pairing

call vundle#end()            " required

filetype plugin indent on    " required
filetype plugin on " Needed for nerdcommenter

" Key Mappings
map <C-o> :NERDTree<CR>
map ; :Files<CR>
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

nnoremap <F7> gg=G <bar> :%s/\s\+$//e<CR>

" Turn settings back on
syntax on " Syntax highlighting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.

" We have VCS -- we don't need this stuff.
set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile " They're just annoying. Who likes them?

" don't nag me when hiding buffers
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.

" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

set number " Turn on line numbers

set colorcolumn=120

" Coc.vim stuff
set cmdheight=2
set updatetime=300
set shortmess+=c
if has("patch-8.1.1564")
"       Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" Maps <cr> to confirm when completion popup is visible
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Tab to trigger completion with characters ahead
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <Tab> and <Shift-Tab> to navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

" leader is a key that allows you to have your own "namespace" of keybindings.
" You'll see it a lot below as <leader>
let mapleader = ","


" So we don't have to press shift when we want to get into command mode.
" nnoremap ; :
" vnoremap ; :

" So we don't have to reach for escape to leave insert mode.
inoremap jf <esc>

" create new vsplit, and switch to it.
noremap <leader>v <C-w>v

" bindings for easy split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use sane regex's when searching
nnoremap / /\v
vnoremap / /\v

" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>


" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.
noremap j gj
noremap k gk

" Plugin settings:
" Below are some 'sane' (IMHO) defaults for a couple of the above plugins I
" referenced.

" Map the key for toggling comments with vim-commentary
nnoremap <leader>c <Plug>CommentaryLine

" Remap ctrlp to ctrl-t -- map it however you like, or stick with the
" defaults. Additionally, in my OS, I remap caps lock to control. I never use
" caps lock. This is highly recommended.
let g:ctrlp_map = '<c-t>'

" Let ctrlp have up to 30 results.
let g:ctrlp_max_height = 30


" Finally the color scheme.
if (has("termguicolors"))
    set termguicolors
endif

colorscheme OceanicNext

set background=dark

if has('gui_running')
  set guifont=Roboto_Mono:h10
endif
