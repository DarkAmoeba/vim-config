"vundle
set nocompatible   "required
filetype off   	   "required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"python sytax checker
Plugin 'vim-syntastic/syntastic'
"Plugin 'w0rp/ale' " reuires vim 8, only 7 at work
Plugin 'nvie/vim-flake8'
Plugin 'tell-k/vim-autopep8'

"Colors!!!
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized' " The colorscheme for work hence included

"prevent excessive default folding with this plugin
Plugin 'tmhedberg/SimpylFold'

"usage
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes' " included so the solarized airline theme can be used
Plugin 'tpope/vim-fugitive' " provides the git integration on the powerline

call vundle#end()
filetype plugin indent on    " required

" Set up the colour theme and syntax highlighting
"colorscheme gruvbox
let python_highlight_all=1
syntax enable
set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized

colorscheme gruvbox

call togglebg#map("<F5>")
let g:autopep8_max_line_length=119
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

"turn on numbering
set number

" set status line configuration for lightline
"set laststatus=2
set noshowmode " remove the -- INSERT -- message

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
"set backspace=indent,eol,start

"Folding based on indentation:
autocmd FileType python set foldmethod=indent
set nofoldenable    " disable folding

"use space to open folds
nnoremap <space> za 
"----------Stop python PEP 8 stuff--------------