" VIM Setup {{{

" END VIM SETUP }}}

" Plugins {{{

" Zooms a window
NeoBundleLazy 'vim-scripts/zoomwintab.vim', {'autoload' :
            \{'commands' : 'ZoomWinTabToggle'}}
" easily window resizing
NeoBundle 'jimsei/winresizer'

" END Plugins }}}

" Plugin Setup {{{

" zoomwintab {{{

map <Leader>z :ZoomWinTabToggle<CR>

" }}}

" END Plugin Setup }}}

" Unite Menu {{{
let g:unite_source_menu_menus.navigation = {
    \ 'description' : '     navigate by buffers, tabs & windows
        \                   ⌘ [space]b',
    \}
let g:unite_source_menu_menus.navigation.command_candidates = [
    \['▷ buffers                                                    ⌘ ,b',
        \'Unite buffer'],
    \['▷ tabs                                                       ⌘ ,B',
        \'Unite tab'],
    \['▷ windows',
        \'Unite window'],
    \['▷ location list',
        \'Unite location_list'],
    \['▷ quickfix',
        \'Unite quickfix'],
    \['▷ resize windows                                             ⌘ C-C C-W',
        \'WinResizerStartResize'],
    \['▷ new vertical window                                        ⌘ ,v',
        \'vsplit'],
    \['▷ new horizontal window                                      ⌘ ,h',
        \'split'],
    \['▷ close current window                                       ⌘ ,k',
        \'close'],
    \['▷ toggle quickfix window                                     ⌘ ,q',
        \'normal ,q'],
    \['▷ zoom                                                       ⌘ ,z',
        \'ZoomWinTabToggle'],
    \['▷ delete buffer                                              ⌘ ,K',
        \'bd'],
    \]
nnoremap <silent>[menu]b :Unite -silent menu:navigation<CR>

" END Unite Menu }}}
