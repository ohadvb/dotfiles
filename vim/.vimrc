set nocompatible

" Clear all autocommands
autocmd!

" Vim-Plug setup
call plug#begin('~/.vim/plugged')

" List your plugins here
" Co-pilot
Plug 'github/copilot.vim'
" CoC for LSP support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Vista for tag navigation
Plug 'liuchengxu/vista.vim'

" FZF for file and buffer navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" molokai for pretty colors
Plug 'tomasr/molokai'
" stuff i'm used to
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'Raimondi/delimitMate'

" Add more plugins as needed

call plug#end()

" CoC config location
let g:coc_user_config = expand('~/.vim/coc/coc-settings.json')
" use coc for vista
let g:vista#renderer#coc#enable = ['coc-clangd', 'coc-pyright']
let g:vista_ignore_kinds = ['class']
let g:vista_default_executive = 'coc'


" CoC configuration for Python
autocmd FileType python source $VIMRUNTIME/ftplugin/python.vim
autocmd BufWritePre *.py silent! :call CocAction('runCommand', 'python.sortImports')

" CoC configuration for C++
let g:coc_global_extensions = ['coc-clangd', 'coc-pyright']

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


nnoremap <leader>V :tabe $MYVIMRC<cr>

" faster esc (for fzf)
set ttimeoutlen=100

" Faster macro invocation
noremap <leader>q @q

" Edit files in current directory
cnoremap %% <c-r>=expand('%:h').'/'<cr>
map <leader>e :edit %%

" Faster buffer switching
noremap <Tab> :bn<cr>
noremap <S-Tab> :bp<cr>
noremap d<Tab> :bd<cr>

" use Enter to save
nnoremap <CR> :w<CR>

" FZF with CtrlP for file and buffer navigation
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>

" CoC key mappings 
" motions
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Vista key mapping
nnoremap <leader>t :Vista!!<CR>
nnoremap <leader>f :Vista finder coc <CR>
nnoremap <leader>s :CocList symbols<CR>
