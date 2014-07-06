" VIM Setup {{{


" END VIM SETUP }}}

" Plugins {{{

" Open external links {{{

" Open a url into the browser or another files with an external app
NeoBundle 'vim-scripts/utl.vim'

" }}}

" Tmux {{{

" Easily interacts with Tmux from Vim
NeoBundle 'benmills/vimux'
" Tmux config file syntax
NeoBundleLazy 'vimez/vim-tmux', { 'autoload' : { 'filetypes' : 'conf'}}

" }}}

" END Plugins }}}

" Plugin Setup {{{

" Utl {{{

map <Leader>j :Utl <CR><Bar>:redraw!<CR>

" For mac only
let g:utl_cfg_hdl_scm_http_system = "silent !firefox %u &"
let g:utl_cfg_hdl_mt_application_pdf = 'silent :!zathura %p &'
let g:utl_cfg_hdl_mt_image_jpeg = 'silent :!sxiv %p &'
let g:utl_cfg_hdl_mt_image_gif = 'silent :!sxiv %p &'
let g:utl_cfg_hdl_mt_image_png = 'silent :!sxiv %p &'

" }}}

" Vinarise {{{

map <F6> :Vinarise<CR>

let g:vinarise_enable_auto_detect = 1

au FileType vinarise let g:airline_section_warning = ''

" }}}

" Move between Vim and Tmux windows {{{

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      " The sleep and & gives time to get back to vim so tmux's focus tracking
      " can kick in and send us our ^[[O
      execute "silent !sh -c 'sleep 0.01; tmux select-pane -" . a:tmuxdir . "' &"
      redraw!
    endif
  endfunction
  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te
  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<CR>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<CR>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<CR>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<CR>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

" END Plugin Setup }}}

" Unite Menu {{{

let g:unite_source_menu_menus.tools = {
    \ 'description' : '          other tools
        \                                           ⌘ [space]t',
    \}
let g:unite_source_menu_menus.tools.command_candidates = [
    \['▷ run with python2 in tmux panel             (vimux)         ⌘ <Leader>rr',
        \'normal ,rr'],
    \['▷ run with python3 in tmux panel             (vimux)         ⌘ <Leader>r3',
        \'normal ,r3'],
    \['▷ run with python2 & time in tmux panel      (vimux)         ⌘ <Leader>rt',
        \'normal ,rt'],
    \['▷ run with pypy & time in tmux panel         (vimux)         ⌘ <Leader>rp',
        \'normal ,rp'],
    \['▷ command prompt to run in a tmux panel      (vimux)         ⌘ <Leader>rc',
        \'VimuxPromptCommand'],
    \['▷ repeat last command                        (vimux)         ⌘ <Leader>rl',
        \'VimuxRunLastCommand'],
    \['▷ stop command execution in tmux panel       (vimux)         ⌘ <Leader>rs',
        \'VimuxInterruptRunner'],
    \['▷ inspect tmux panel                         (vimux)         ⌘ <Leader>ri',
        \'VimuxInspectRunner'],
    \['▷ close tmux panel                           (vimux)         ⌘ <Leader>rq',
        \'VimuxCloseRunner'],
    \['▷ open link                                                  ⌘ <Leader>j',
        \'normal ,j'],
    \]

let g:unite_source_menu_menus.tools.command_candidates = helperfuncs#unite_menu_gen(g:unite_source_menu_menus.tools.command_candidates, [])

nnoremap <silent>[menu]t :Unite -silent menu:tools<CR>

" END Unite Menu }}}
