" Plugin manager and plugins
set nocompatible
filetype off
set rtp+=/home/pierrick/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ngmy/vim-rubocop'
Plugin 'vim-syntastic/syntastic'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
call vundle#end()

" General config
syntax on
filetype plugin indent on
set colorcolumn=81
set number
set noswapfile
set nobackup
set nowb
set hlsearch
set ignorecase
set incsearch
set showcmd
set backspace=indent,eol,start
set cursorline
set laststatus=2
set confirm
set undofile
set undodir=~/.config/nvim/undodir
set t_Co=256

" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 1

" Theme
colorscheme gruvbox
set bg=dark

" Airline status bar
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_section_x = '%{&filetype}'
let g:airline_section_z = '%l/%L-%c'
let g:airline#extensions#wordcount#enabled = 0

" Ruby => 2 spaces for indentation
autocmd FileType ruby setlocal ts=2 sts=0 sw=2 et ai sta
" Rust => 4 spaces for indentation
autocmd FileType rust setlocal ts=4 sts=0 sw=4 et ai sta
" Bash => 2 spaces for indentation
autocmd FileType sh setlocal ts=2 sts=0 sw=2 et ai sta

" Git commit message width
autocmd FileType gitcommit setlocal tw=72

" Autoremove trailing whitespaces macro
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()
autocmd BufWritePre * call TrimWhitespace()

" Vim hotkeys
inoremap kj <ESC>
nmap cl :noh<CR>
nnoremap <C-j> <C-f>
nnoremap <C-f> <Nop>
nnoremap <C-k> <C-b>
nnoremap <C-b> <Nop>

" Ruby hotkeys
let g:vimrubocop_keymap = 0
nmap <Leader>rc :RuboCop<CR>

" Rust hotkeys
nmap <Leader>rf :RustFmt<CR>

" C hotkeys
nmap <Leader>gcc :! gcc -o compiled_output %<CR>

" Autosource nvim config file
autocmd bufwritepost ~/.config/nvim/init.vim source $MYVIMRC
