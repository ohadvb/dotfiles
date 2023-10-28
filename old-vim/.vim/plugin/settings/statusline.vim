" Configure the statusline

set statusline=
set statusline+=%<\ 
set statusline+=%2*[%n%H%R%W]%*\ 
set statusline+=%f\ %m\ 
set statusline+=%=%1*[
set statusline+=%{strlen(&ft)?&ft:'none'},\ 
set statusline+=%{strlen(&fenc)?&fenc:&enc},\ 
set statusline+=%{&fileformat}
set statusline+=]%*%*\ 
set statusline+=%10((%l/%L,%c)%)\ 
set statusline+=%P\ 
