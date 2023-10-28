let g:ctrlp_working_path_mode = 0
let g:ctrlp_switch_buffer = 0

let g:ctrlp_user_command = {
            \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': 'find %s -type f'
            \ }

nnoremap <leader>] :CtrlPTag<cr>
nnoremap <leader>o :CtrlPMRUFiles<cr>
