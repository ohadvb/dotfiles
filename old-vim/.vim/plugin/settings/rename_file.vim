" Rename file
function! RenameFile(new_name)
let old_name = expand('%')
if a:new_name != '' && a:new_name != old_name
    exec ':saveas ' . a:new_name
    exec ':silent !rm ' . old_name
    redraw!
endif
endfunction
command! -complete=file -nargs=1 Rename call RenameFile(<q-args>)

