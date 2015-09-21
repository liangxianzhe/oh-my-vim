" VIM Setup {{{

" END VIM SETUP }}}

" Plugins {{{

" Admin Git
NeoBundle 'tpope/vim-fugitive'
" Show git repository changes in the current file
NeoBundle 'airblade/vim-gitgutter'
" Git viewer
NeoBundleLazy 'gregsexton/gitv', {'depends':['tpope/vim-fugitive'],
            \ 'autoload':{'commands':'Gitv'}}
" Browse GitHub events in Vim
NeoBundle 'joedicastro/vim-github-dashboard'

" END Plugins }}}

" Plugin Setup {{{

" Fugitive {{{

nnoremap <Leader>gn :Unite output:echo\ system("git\ init")<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>go :Gread<CR>
nnoremap <Leader>gR :Gremove<CR>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gB :Gbrowse<CR>
nnoremap <Leader>gp :Git! push<CR>
nnoremap <Leader>gP :Git! pull<CR>
nnoremap <Leader>gi :Git!<Space>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gE :Gedit<Space>
nnoremap <Leader>gl :exe "silent Glog <Bar> Unite -no-quit
            \ quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gL :exe "silent Glog -- <Bar> Unite -no-quit
            \ quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gt :!tig<CR>:redraw!<CR>
nnoremap <Leader>gS :exe "silent !shipit"<CR>:redraw!<CR>
nnoremap <Leader>gg :exe 'silent Ggrep -i '.input("Pattern: ")<Bar>Unite
            \ quickfix -no-quit<CR>
nnoremap <Leader>ggm :exe 'silent Glog --grep='.input("Pattern: ").' <Bar>
            \Unite -no-quit quickfix'<CR>
nnoremap <Leader>ggt :exe 'silent Glog -S='.input("Pattern: ").' <Bar>
            \Unite -no-quit quickfix'<CR>

nnoremap <Leader>ggc :silent! Ggrep -i<Space>

" for the diffmode
noremap <Leader>du :diffupdate<CR>

if !exists(":Gdiffoff")
    command Gdiffoff diffoff | q | Gedit
endif
noremap <Leader>dq :Gdiffoff<CR>
" }}}

" Gitv {{{

nnoremap <silent> <leader>gv :Gitv --all<CR>
nnoremap <silent> <leader>gV :Gitv! --all<CR>
vnoremap <silent> <leader>gV :Gitv! --all<CR>

let g:Gitv_OpenHorizontal = 'auto'
let g:Gitv_WipeAllOnClose = 1
let g:Gitv_DoNotMapCtrlKey = 1
" let g:Gitv_WrapLines = 1

autocmd FileType git set nofoldenable

" }}}

" GitHub dashboard {{{

nnoremap <Leader>gD :exe 'GHD! '.input("Username: ")<CR>
nnoremap <Leader>gA :exe 'GHA! '.input("Username or repository: ")<CR>

function! GHDashboard (...)
  if &filetype == 'github-dashboard'
    " first variable is the statusline builder
    let builder = a:1

    call builder.add_section('airline_a', 'GitHub ')
    call builder.add_section('airline_b',
                \ ' %{get(split(get(split(github_dashboard#statusline(), " "),
                \ 1, ""), ":"), 0, "")} ')
    call builder.add_section('airline_c',
                \ ' %{get(split(get(split(github_dashboard#statusline(), " "),
                \ 2, ""), "]"), 0, "")} ')

    " tell the core to use the contents of the builder
    return 1
  endif
endfunction

autocmd FileType github-dashboard call airline#add_statusline_func('GHDashboard')

" }}}

" END Plugin Setup }}}

" Unite Menu {{{
let g:unite_source_menu_menus.git = {
    \ 'description' : '            admin git repositories
        \                                ⌘ [space]g',
    \}
let g:unite_source_menu_menus.git.command_candidates = [
    \['▷ tig                                                        ⌘ <Leader>gt',
        \'normal <Leader>gt'],
    \['▷ git viewer             (gitv)                              ⌘ <Leader>gv',
        \'normal <Leader>gv'],
    \['▷ git viewer - buffer    (gitv)                              ⌘ <Leader>gV',
        \'normal <Leader>gV'],
    \['▷ git status             (fugitive)                          ⌘ <Leader>gs',
        \'Gstatus'],
    \['▷ git diff               (fugitive)                          ⌘ <Leader>gd',
        \'Gdiff'],
    \['▷ git commit             (fugitive)                          ⌘ <Leader>gc',
        \'Gcommit'],
    \['▷ git log                (fugitive)                          ⌘ <Leader>gl',
        \'exe "silent Glog | Unite -no-quit quickfix"'],
    \['▷ git log - all          (fugitive)                          ⌘ <Leader>gL',
        \'exe "silent Glog -all | Unite -no-quit quickfix"'],
    \['▷ git blame              (fugitive)                          ⌘ <Leader>gb',
        \'Gblame'],
    \['▷ git add/stage          (fugitive)                          ⌘ <Leader>gw',
        \'Gwrite'],
    \['▷ git checkout           (fugitive)                          ⌘ <Leader>go',
        \'Gread'],
    \['▷ git rm                 (fugitive)                          ⌘ <Leader>gR',
        \'Gremove'],
    \['▷ git mv                 (fugitive)                          ⌘ <Leader>gm',
        \'exe "Gmove " input("destino: ")'],
    \['▷ git push               (fugitive, buffer output)           ⌘ <Leader>gp',
        \'Git! push'],
    \['▷ git pull               (fugitive, buffer output)           ⌘ <Leader>gP',
        \'Git! pull'],
    \['▷ git command            (fugitive, buffer output)           ⌘ <Leader>gi',
        \'exe "Git! " input("comando git: ")'],
    \['▷ git edit               (fugitive)                          ⌘ <Leader>gE',
        \'exe "command Gedit " input(":Gedit ")'],
    \['▷ git grep               (fugitive)                          ⌘ <Leader>gg',
        \'exe "silent Ggrep -i ".input("Pattern: ") | Unite -no-quit quickfix'],
    \['▷ git grep - messages    (fugitive)                          ⌘ <Leader>ggm',
        \'exe "silent Glog --grep=".input("Pattern: ")." | Unite -no-quit quickfix"'],
    \['▷ git grep - text        (fugitive)                          ⌘ <Leader>ggt',
        \'exe "silent Glog -S".input("Pattern: ")." | Unite -no-quit quickfix"'],
    \['▷ git init                                                   ⌘ <Leader>gn',
        \'Unite output:echo\ system("git\ init")'],
    \['▷ git cd                 (fugitive)',
        \'Gcd'],
    \['▷ git lcd                (fugitive)',
        \'Glcd'],
    \['▷ git browse             (fugitive)                          ⌘ <Leader>gB',
        \'Gbrowse'],
    \['▷ github dashboard       (github-dashboard)                  ⌘ <Leader>gD',
        \'exe "GHD! " input("Username: ")'],
    \['▷ github activity        (github-dashboard)                  ⌘ <Leader>gA',
        \'exe "GHA! " input("Username or repository: ")'],
    \['▷ github issues & PR                                         ⌘ <Leader>gS',
\'der>gSnormal <Leader>gS'],
\]

let g:unite_source_menu_menus.git.command_candidates = helperfuncs#unite_menu_gen(g:unite_source_menu_menus.git.command_candidates, [])

nnoremap <silent>[menu]g :Unite -silent -winheight=29 -start-insert menu:git<CR>

" END Unite Menu }}}
