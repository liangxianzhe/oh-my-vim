" VIM Setup {{{

" END VIM SETUP }}}

" Plugins {{{

" browse the vim undo tree
NeoBundleLazy 'sjl/gundo.vim', { 'autoload' : {'commands': 'GundoToggle'}}

" END Plugins }}}

" Plugin Setup {{{

" Gundo {{{

nnoremap <Leader>u :GundoToggle<CR>

let g:gundo_preview_bottom = 1

" }}}

" END Plugin Setup }}}

" Unite Menu {{{
let g:unite_source_menu_menus.registers = {
    \ 'description' : '      yanks, registers & history
        \                            ⌘ [space]i',
    \}
let g:unite_source_menu_menus.registers.command_candidates = [
    \['▷ yanks                                                      ⌘ ,i',
        \'Unite history/yank'],
    \['▷ commands       (history)                                   ⌘ q:',
        \'Unite history/command'],
    \['▷ searches       (history)                                   ⌘ q/',
        \'Unite history/search'],
    \['▷ registers',
        \'Unite register'],
    \['▷ messages',
        \'Unite output:messages'],
    \['▷ undo tree      (gundo)                                     ⌘ ,u',
        \'GundoToggle'],
    \]
nnoremap <silent>[menu]i :Unite -silent menu:registers<CR>

" END Unite Menu }}}
