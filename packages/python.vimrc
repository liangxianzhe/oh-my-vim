" VIM Setup {{{


" END VIM SETUP }}}

" Plugins {{{

" Admin virtualenvs
NeoBundle 'jmcantrell/vim-virtualenv'
" Show indent lines
NeoBundleLazy 'Yggdroot/indentLine', {'autoload': {'filetypes': ['python']}}
" A Python plugin
NeoBundleLazy 'klen/python-mode', {'autoload': {'filetypes': ['python']}}
" Show reports from coverage.py
NeoBundleLazy 'alfredodeza/coveragepy.vim', {'autoload': {'filetypes': ['python']}}

" END Plugins }}}

" Plugin Setup {{{

" Virtualenv {{{

let g:virtualenv_auto_activate = 1
let g:virtualenv_stl_format = '(%n)'

" }}}

" PythonMode {{{ -------------------------------------------------------------

nmap <silent><Leader>n :PymodeLint<CR>

let g:pymode_breakpoint_bind = '<Leader>B'

let g:pymode_lint = 1
let g:pymode_lint_on_write = 0
let g:pymode_lint_checkers = ['pylint', 'pep8', 'mccabe', 'pep257']
let g:pymode_lint_ignore = ''
let g:pymode_virtualenv = 0
let g:pymode_rope = 1

let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 1

" Ignore missing docstring error
let g:pymode_lint_ignore = "C0111,D100,D103" 

" }}}


" vimux {{{

let g:VimuxUseNearestPane = 1

map <Leader>rr :call VimuxRunCommand('clear;cd '.expand("%:p:h") .' ;python2 '.bufname("%"))<CR>
map <Leader>r3 :call VimuxRunCommand('clear;cd '.expand("%:p:h") .' ;python3 '.bufname("%"))<CR>
map <Leader>rt :call VimuxRunCommand('clear;cd '.expand("%:p:h") .' ;time python2 '.bufname("%"))<CR>
map <Leader>rp :call VimuxRunCommand('clear;cd '.expand("%:p:h") .' ;time pypy '.bufname("%"))<CR>

map <Leader>rc :VimuxPromptCommand<CR>
map <Leader>rl :VimuxRunLastCommand<CR>
map <Leader>rs :VimuxInterruptRunner<CR>
map <Leader>ri :VimuxInspectRunner<CR>
map <Leader>rq :VimuxCloseRunner<CR>

" }}}

" indentLine {{{

map <silent> <Leader>L :IndentLinesToggle<CR>
let g:indentLine_enabled = 0
let g:indentLine_char = '┊'
let g:indentLine_color_term = 239

" }}}

" END Plugin Setup }}}

" Unite Menu {{{
let g:unite_source_menu_menus.python = {
    \ 'description' : '         python tools
        \                                          ⌘ [space]p',
    \}
let g:unite_source_menu_menus.python.command_candidates = [
    \['▷ run python code                            (pymode)        ⌘ ,r',
        \'PymodeRun'],
    \['▷ show docs for the current word             (pymode)        ⌘ K',
        \'normal K'],
    \['▷ insert a breakpoint                        (pymode)        ⌘ ,B',
        \'normal ,B'],
    \['▷ pylint check                               (pymode)        ⌘ ,n',
        \'PymodeLint'],
    \['▷ go to definition                           (pymode-rope)   ⌘ C-C g',
        \'call pymode#rope#goto_definition()'],
    \['▷ find where a function is used              (pymode-rope)   ⌘ C-C f',
        \'call pymode#rope#find_it()'],
    \['▷ show docs for current word                 (pymode-rope)   ⌘ C-C d',
        \'call pymode#rope#show_doc()'],
    \['▷ reorganize imports                         (pymode-rope)   ⌘ C-C r o',
        \'call pymode#rope#organize_imports()'],
    \['▷ refactorize - rename                       (pymode-rope)   ⌘ C-C r r',
        \'call pymode#rope#rename()'],
    \['▷ refactorize - inline                       (pymode-rope)   ⌘ C-C r i',
        \'call pymode#rope#inline()'],
    \['▷ refactorize - move                         (pymode-rope)   ⌘ C-C r v',
        \'call pymode#rope#move()'],
    \['▷ refactorize - use function                 (pymode-rope)   ⌘ C-C r u',
        \'call pymode#rope#use_function()'],
    \['▷ refactorize - change signature             (pymode-rope)   ⌘ C-C r s',
        \'call pymode#rope#signature()'],
    \['▷ refactorize - rename current module        (pymode-rope)   ⌘ C-C r 1 r',
        \'PymodeRopeRenameModule'],
    \['▷ refactorize - module to package            (pymode-rope)   ⌘ C-C r 1 p',
        \'PymodeRopeModuleToPackage'],
    \['▷ list virtualenvs                           (virtualenv)',
        \'Unite output:VirtualEnvList'],
    \['▷ activate virtualenv                        (virtualenv)',
        \'VirtualEnvActivate'],
    \['▷ deactivate virtualenv                      (virtualenv)',
        \'VirtualEnvDeactivate'],
    \['▷ run coverage2                              (coveragepy)',
        \'call system("coverage2 run ".bufname("%")) | Coveragepy report'],
    \['▷ run coverage3                              (coveragepy)',
        \'call system("coverage3 run ".bufname("%")) | Coveragepy report'],
    \['▷ toggle coverage report                     (coveragepy)',
        \'Coveragepy session'],
    \['▷ toggle coverage marks                      (coveragepy)',
        \'Coveragepy show'],
    \]
nnoremap <silent>[menu]p :Unite -silent -winheight=42 menu:python<CR>

" END Unite Menu }}}
