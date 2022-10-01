" Plugin manager and plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-fugitive'
Plugin 'ngmy/vim-rubocop'
Plugin 'mattn/emmet-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'pbondoer/vim-42header'
Plugin 'vim-syntastic/syntastic'
Plugin 'alexandregv/norminette-vim'
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

" Theme
colorscheme molokai

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

" Ruby hotkeys
let g:vimrubocop_keymap = 0
nmap <Leader>rc :RuboCop<CR>

" Rust hotkeys
nmap <Leader>rf :RustFmt<CR>

" C hotkeys
nmap <Leader>gcc :! gcc -o compiled_output %<CR>

" Autosource .vimrc
autocmd bufwritepost .vimrc source $MYVIMRC

" 42 config start -------------------------------------------------------------

" C => 4-spaces-long tabs for indentation
autocmd FileType c setlocal ts=4 sts=4 sw=4 noet ai sta si

" 42 header variables
let g:hdr42mail = "placeholder@email.com"
let g:hdr42user = "username"

" 42 hotkeys
nmap <Leader>42 :Stdheader<CR>
nmap <Leader>nm :Errors<CR>

" Enable norminette-vim (and gcc)
let g:syntastic_c_checkers = ['norminette', 'gcc']
let g:syntastic_aggregate_errors = 1
" Set the path to norminette (do no set if using norminette of 42 mac)
let g:syntastic_c_norminette_exec = 'norminette'
" Support headers (.h)
let g:c_syntax_for_h = 1
let g:syntastic_c_include_dirs = ['include', '../include', '../../include', 'libft', '../libft/include', '../../libft/include']
" Pass custom arguments to norminette (this one ignores 42header)
"let g:syntastic_c_norminette_args = '-R CheckTopCommentHeader'
" Check errors when opening a file (disable to speed up startup time)
let g:syntastic_check_on_open = 1
" Enable error list
let g:syntastic_always_populate_loc_list = 1
" Automatically open error list
let g:syntastic_auto_loc_list = 1
" Skip check when closing
let g:syntastic_check_on_wq = 0
" Errors list (location list) height
let g:syntastic_loc_list_height=15

" 42 config end ---------------------------------------------------------------
