augroup my_scons
    autocmd!
    autocmd BufRead,BufNewFile SCons{cript,truct} setlocal filetype=python
augroup END
