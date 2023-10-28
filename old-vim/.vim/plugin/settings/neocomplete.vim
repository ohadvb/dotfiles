let g:neocomplete#enable_at_startup = 1 
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_refresh_always = 1

" Complete from all buffers
if !exists('g:neocomplete#same_filetypes')
    let g:neocomplete#same_filetypes = {}
endif
let g:neocomplete#same_filetypes._ = "_"

inoremap <expr><tab>  pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <c-l> neocomplete#close_popup()
