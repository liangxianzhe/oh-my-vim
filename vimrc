let s:vimcustomfile = $HOME . '/.vim/bundle.vimrc'

if filereadable(s:vimcustomfile)
    exec 'source '.s:vimcustomfile
endif
