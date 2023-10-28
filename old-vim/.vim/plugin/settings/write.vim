noremap <Leader>W :wall<cr>

function! MapCR()
  nnoremap <cr> :write<cr>
endfunction

call MapCR()

augroup mapcr
    autocmd!
    " Unmap CR in command window
    autocmd! CmdwinEnter * unmap <cr>
    autocmd! CmdwinLeave * call MapCR()
augroup END
