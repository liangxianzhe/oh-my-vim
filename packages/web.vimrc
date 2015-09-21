" VIM Setup {{{


" END VIM SETUP }}}

" Plugins {{{

" HTML/CSS {{{

NeoBundleLazy 'othree/html5.vim', {'autoload':
            \ {'filetypes': ['html', 'xhttml', 'css']}}

NeoBundleLazy 'mattn/emmet-vim', {'autoload':
            \ {'filetypes': ['html', 'xhttml', 'css', 'xml', 'xls', 'markdown']}}

" }}}

" API Web {{{

NeoBundle 'mattn/webapi-vim'

" }}}

" END Plugins }}}

" Plugin Setup {{{


" END Plugin Setup }}}

" Unite Menu {{{

let g:unite_source_menu_menus.web = {
    \ 'description' : '            web development
        \                                       ⌘ [space]w',
    \}
let g:unite_source_menu_menus.web.command_candidates = [
    \['▷ show emmet tutorial',
        \'h emmet-tutorial'],
    \]

let g:unite_source_menu_menus.web.command_candidates = helperfuncs#unite_menu_gen(g:unite_source_menu_menus.web.command_candidates, [])

nnoremap <silent>[menu]w :Unite -silent menu:web<CR>

" END Unite Menu }}}
