let g:user_emmet_leader_key = '<c-h>'
let g:user_emmet_install_global = 0

augroup my_emmet
    autocmd!
    " Load in HTML only
    autocmd FileType html,css EmmetInstall
augroup END
