let s:vimcustomfile = '/Users/maple/config/new/dotfiles/vim/dotvim/bundle.vimrc'

if filereadable(s:vimcustomfile)
    exec 'source '.s:vimcustomfile
endif
