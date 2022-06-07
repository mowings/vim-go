let mapleader = ","
execute pathogen#infect()

filetype plugin indent on
syntax on

color summerfruit256
set mouse=a
command JsonFormat %!python -m json.tool
command -nargs=* Wget %!wget -qO - <args>
map ,n            :NERDTreeToggle<CR>
set autowrite
let g:syntastic_go_checkers = ['go']
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
set encoding=utf-8
set tabstop=2
set expandtab
set shiftwidth=2
set backspace=2
" Need to put this stuff in /app directory somewhere. This is kinf of dumb
set backup                      " Enable creation of backup file.
set backupdir=~/.vim/backups//  " Where backups will go.
set directory=~/.vim/tmp//      " Where temporary files will go.

" Stuff for osx
set clipboard=unnamed
" map c :!pbcopy<BAR>pbpaste<CR>
:nmap <C-N><C-N> :set invnumber<CR>
vmap <C-c> :w !pbcopy<CR><CR>
" check for changes
autocmd CursorHold,CursorHoldI,BufEnter * checktime
" " could be slow
autocmd CursorMoved,CursorMovedI * checktime
" automatically reload files that haven't been modified
set autoread
let NERDTreeShowHidden=1
let g:terraform_fmt_on_save=1
let g:terraform_align=1
set t_ut=
