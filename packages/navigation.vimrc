" VIM Setup {{{

" END VIM SETUP }}}

" Plugins {{{
call neobundle#append()

" Zooms a window
NeoBundleLazy 'vim-scripts/zoomwintab.vim', {'autoload' :
            \{'commands' : 'ZoomWinTabToggle'}}
" easily window resizing
NeoBundle 'jimsei/winresizer'

call neobundle#end()
" END Plugins }}}

" Plugin Setup {{{

" winresizer {{{

let g:winresizer_start_key = '<C-C><C-W>'
" cancelar pulsando ESC
" let g:winresizer_finish_with_escape = 1
let g:winresizer_keycode_finish = 27

" }}}

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
    \['▷ buffers                                                    ⌘ <Leader>b',
        \'Unite buffer'],
    \['▷ tabs                                                       ⌘ <Leader>B',
        \'Unite tab'],
    \['▷ windows',
        \'Unite window'],
    \['▷ location list',
        \'Unite location_list'],
    \['▷ quickfix',
        \'Unite quickfix'],
    \['▷ resize windows                                             ⌘ C-C C-W',
        \'WinResizerStartResize'],
    \['▷ new vertical window                                        ⌘ <Leader>v',
        \'vsplit'],
    \['▷ new horizontal window                                      ⌘ <Leader>h',
        \'split'],
    \['▷ close current window                                       ⌘ <Leader>k',
        \'close'],
    \['▷ toggle quickfix window                                     ⌘ <Leader>q',
        \'normal <Leader>q'],
    \['▷ zoom                                                       ⌘ <Leader>z',
        \'ZoomWinTabToggle'],
    \['▷ delete buffer                                              ⌘ <Leader>K',
        \'bd'],
    \]

let g:unite_source_menu_menus.navigation.command_candidates = helperfuncs#unite_menu_gen(g:unite_source_menu_menus.navigation.command_candidates, [])

nnoremap <silent>[menu]b :Unite -silent menu:navigation<CR>

" END Unite Menu }}}
