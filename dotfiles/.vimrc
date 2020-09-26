set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup      " Stop vim from leaving temp files everywhere
set nowritebackup " Don't write your undo history to a file
set history=200   " Only save 200 undos
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set vb            " NO BELLS!
set wildmenu      " Turn on the WiLd menu
set laststatus=2  " Always display the status line
set mousefocus    " gvim mouse click will select pane
set shell=/bin/sh " Ensure that vim always runs from a shell https://rvm.io/integration/vim
set backspace=indent,eol,start "http://vim.wikia.com/wiki/Backspace_and_delete_problems
set list listchars=tab:»·,trail:· " Display extra whitespace

" Ignore compiled files
set wildignore+=*.o,*~,*.pyc
set wildignore+="bin/*"
set wildignore+="build/*"

" Turn on Line Numbers and set width to 4
set number " You can set relative numbers if you prefer those with set relativenumber
set numberwidth=4 " How many numbers to allow on the left column. Hope your file isn't longer than 9,999 lines.

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
call plug#end()


" setup copy pasting
set clipboard=unnamed
nnoremap <SPACE> <Nop>
:let mapleader = " "
nnoremap d "_d
nnoremap c "_c
nnoremap x "_x
nnoremap <leader>c c
nnoremap <leader>d d
nnoremap <leader>x x
vnoremap d "_d
vnoremap c "_c
vnoremap x "_x
vnoremap p "_dP
vnoremap <leader>c c
vnoremap <leader>d d
vnoremap <leader>x x
vnoremap <leader>p p

set tabstop=8
set expandtab
set shiftwidth=2




" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-commentary'
call vundle#end()            " required
filetype plugin indent on    " required
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Optionally reset the cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

let g:airline_solarized_bg='dark'
