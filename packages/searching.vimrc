" VIM Setup {{{

" END VIM SETUP }}}

" Plugins {{{

" END Plugins }}}

" Plugin Setup {{{

" END Plugin Setup }}}

" Unite Menu {{{
let g:unite_source_menu_menus.searching = {
    \ 'description' : '      searchs inside the current buffer
        \                     ⌘ [space]f',
    \}
let g:unite_source_menu_menus.searching.command_candidates = [
    \['▷ search line                                                ⌘ <Leader>f',
        \'Unite -auto-preview -start-insert line'],
    \['▷ search word under the cursor                               ⌘ [space]8',
        \'UniteWithCursorWord -no-split -auto-preview line'],
    \['▷ search outlines & tags (ctags)                             ⌘ <Leader>t',
        \'Unite -vertical -winwidth=40 -direction=topleft -toggle outline'],
    \['▷ search marks',
        \'Unite -auto-preview mark'],
    \['▷ search folds',
        \'Unite -vertical -winwidth=30 -auto-highlight fold'],
    \['▷ search changes',
        \'Unite change'],
    \['▷ search jumps',
        \'Unite jump'],
    \['▷ search undos',
        \'Unite undo'],
    \['▷ search tasks                                               ⌘ <Leader>;',
        \'Unite -toggle grep:%::FIXME|TODO|NOTE|XXX|COMBAK|@todo'],
    \]

let g:unite_source_menu_menus.searching.command_candidates = helperfuncs#unite_menu_gen(g:unite_source_menu_menus.searching.command_candidates, [])

nnoremap <silent>[menu]f :Unite -silent menu:searching<CR>

" END Unite Menu }}}
