set nocompatible

" Clear all autocommands
autocmd!

" Load pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" General
filetype plugin indent on
syntax on
set hidden
set autoread

" Temporary files stuff
set nobackup
set writebackup
set noswapfile

" Tabbing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set shiftround

" Editing
set backspace=indent,eol,start
inoremap <c-e> <end>
inoremap <c-u> <c-g>u<c-u>
set formatoptions+=j
set nojoinspaces

" Windows
set splitright

" Searching
set incsearch
set ignorecase smartcase

" Movement
" Remember long moves to jumplist
nnoremap <silent> k :<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count : '') . 'k'<CR>
nnoremap <silent> j :<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count : '') . 'j'<CR>
" Scrolling
noremap <c-j> 3<c-e>
noremap <c-k> 3<c-y>

" Visual
set cursorline
set laststatus=2
set ruler
set relativenumber
set number
set showcmd

" Color scheme
set t_Co=256
set background=dark
colorscheme molokai

" Hebrew/RTL
noremap <F2> :setlocal invrightleft<cr>
inoremap <F2> <c-o>:setlocal invrightleft<cr>

" Tags
noremap g] g<c-]>

" Omnicomplete
set completeopt-=preview

" Encryption
set cryptmethod=blowfish

" Global substitute
nnoremap gs :%s/<c-r><c-w>/
nnoremap gS :%s/<c-r><c-a>/

" System clipboard stuff
map zy "+y
map zY "+Y
map zp "+p
map zP "+P

" Highlight current word
nnoremap <silent> <space> :let @/ = "\\<".expand("<cword>")."\\>"<cr>:set hls<cr>

"""""""""""""""""""""""""""""""
" Autocommands
"""""""""""""""""""""""""""""""
augroup vimrc
    " Clear all commands in the group
    autocmd!

    autocmd FileType text,markdown setlocal textwidth=78
    autocmd FileType help setlocal number relativenumber

    autocmd BufWritePost $MYVIMRC source %
augroup END

nnoremap <leader>V :tabe $MYVIMRC<cr>

" Faster macro invocation
noremap <leader>q @q

" Edit files in current directory
cnoremap %% <c-r>=expand('%:h').'/'<cr>
map <leader>e :edit %%

" Faster buffer switching
noremap <Tab> :bn<cr>
noremap <S-Tab> :bp<cr>
