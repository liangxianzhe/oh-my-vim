" VIM Setup {{{

" Save as root
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" Quick saving
nmap <silent> <Leader>w :update<CR>

" Use Ranger as a file explorer {{{
fun! RangerChooser()
    exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
    if filereadable('/tmp/chosenfile')
        exec 'edit ' . system('cat /tmp/chosenfile')
        call system('rm /tmp/chosenfile')
    endif
    redraw!
endfun
map <Leader>x :call RangerChooser()<CR>
" }}}

" END VIM SETUP }}}

" Plugins {{{
call neobundle#append()

" File explorer (needed where ranger is not available)
NeoBundleLazy 'Shougo/vimfiler', {'autoload' : { 'commands' : ['VimFiler']}}

" Junk files
NeoBundleLazy 'Shougo/junkfile.vim', {'autoload':{'commands':'JunkfileOpen',
            \ 'unite_sources':['junkfile','junkfile/new']}}

" Linux tools {{{

" A diff tool for directories
NeoBundleLazy 'joedicastro/DirDiff.vim', { 'autoload': { 'commands' : 'DirDiff'}}
" Hexadecimal editor
NeoBundle 'Shougo/vinarise.vim'

" }}}

call neobundle#end()
" END Plugins }}}

" Plugin Setup {{{

" Junk files {{{

nnoremap <silent><Leader>d :Unite -silent junkfile/new junkfile<CR>
let g:junkfile#directory=expand($HOME."/.vim/tmp/junk")

" }}}

" VimFiler {{{

nnoremap <silent><Leader>X :VimFiler<CR>

let g:vimfiler_as_default_explorer = 1

let g:vimfiler_tree_leaf_icon = '├'
let g:vimfiler_tree_opened_icon = '┐'
let g:vimfiler_tree_closed_icon = '─'
let g:vimfiler_file_icon = '┄'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_readonly_file_icon = '✗'

let g:vimfiler_force_overwrite_statusline = 0

let g:vimfiler_time_format = '%d-%m-%Y %H:%M:%S'
let g:vimfiler_data_directory = $HOME.'/.vim/tmp/vimfiler'

" }}}

" END Plugin Setup }}}

" Unite Menu {{{
let g:unite_source_menu_menus.files = {
    \ 'description' : '          files & dirs
        \                                          ⌘ [space]o',
    \}
let g:unite_source_menu_menus.files.command_candidates = [
    \['▷ open file                                                  ⌘ <Leader>o',
        \'Unite -start-insert file'],
    \['▷ open more recently used files                              ⌘ <Leader>m',
        \'Unite file_mru'],
    \['▷ open file with recursive search                            ⌘ <Leader>O',
        \'Unite -start-insert file_rec/async'],
    \['▷ edit new file',
        \'Unite file/new'],
    \['▷ search directory',
        \'Unite directory'],
    \['▷ search recently used directories',
        \'Unite directory_mru'],
    \['▷ search directory with recursive search',
        \'Unite directory_rec/async'],
    \['▷ make new directory',
        \'Unite directory/new'],
    \['▷ change working directory',
        \'Unite -default-action=lcd directory'],
    \['▷ know current working directory',
        \'Unite output:pwd'],
    \['▷ junk files                                                 ⌘ <Leader>d',
        \'Unite junkfile/new junkfile'],
    \['▷ save as root                                               ⌘ :w!!',
        \'exe "write !sudo tee % >/dev/null"'],
    \['▷ quick save                                                 ⌘ <Leader>w',
        \'normal <Leader>w'],
    \['▷ open ranger                                                ⌘ <Leader>x',
        \'call RangerChooser()'],
    \['▷ open vimfiler                                              ⌘ <Leader>X',
        \'VimFiler'],
    \]

let g:unite_source_menu_menus.files.command_candidates = helperfuncs#unite_menu_gen(g:unite_source_menu_menus.files.command_candidates, [])

nnoremap <silent>[menu]o :Unite -silent -winheight=17 -start-insert
            \ menu:files<CR>
" END Unite Menu }}}
