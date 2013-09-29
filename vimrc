"
"                       __   _(_)_ __ ___  _ __ ___
"                       \ \ / / | '_ ` _ \| '__/ __|
"                        \ V /| | | | | | | | | (__
"                       (_)_/ |_|_| |_| |_|_|  \___|
"
" Author: Xianzhe Liang <liangxianzhe@gmail.com>
" Source: https://github.com/liangxianzhe/dotvim

" Setup language {{{ ==========================================================

" language en_US.UTF-8           " Solve some plugins incompatibilities

" }}}

" NEOBUNDLE {{{ ===============================================================

set nocompatible             " No to the total compatibility with the ancient vi

" NeoBundle auto-installation and setup {{{

" Auto installing NeoBundle
let iCanHazNeoBundle=1
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
    let iCanHazNeoBundle=0
endif


" Call NeoBundle
if has('vim_starting')
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand($HOME.'/.vim/bundle/'))

" is better if NeoBundle rules NeoBundle (needed!)
NeoBundle 'Shougo/neobundle.vim'
" }}}

" BUNDLES (plugins administrated by NeoBundle) {{{

" Shougo's way {{{

" Vimproc to asynchronously run commands (NeoBundle, Unite)
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" Unite. The interface to rule almost everything
NeoBundle 'Shougo/unite.vim'

" Unite sources
NeoBundleLazy 'Shougo/unite-outline', {'autoload':{'unite_sources':'outline'}}
NeoBundleLazy 'Shougo/unite-session', {'autoload':{'unite_sources':'session',
            \ 'commands' : ['UniteSessionSave', 'UniteSessionLoad']}}
NeoBundleLazy 'tsukkee/unite-help', {'autoload':{'unite_sources':'help'}}
NeoBundleLazy 'ujihisa/unite-colorscheme', {'autoload':{'unite_sources':
            \ 'colorscheme'}}
NeoBundleLazy 'ujihisa/unite-locate', {'autoload':{'unite_sources':'locate'}}
NeoBundleLazy 'thinca/vim-unite-history', { 'autoload' : { 'unite_sources' :
            \ ['history/command', 'history/search']}}
NeoBundleLazy 'osyo-manga/unite-filetype', { 'autoload' : {'unite_sources' :
            \ 'filetype', }}
NeoBundleLazy 'osyo-manga/unite-quickfix', {'autoload':{'unite_sources':
            \ ['quickfix', 'location_list']}}
NeoBundleLazy 'osyo-manga/unite-fold', {'autoload':{'unite_sources':'fold'}}
NeoBundleLazy 'tacroe/unite-mark', {'autoload':{'unite_sources':'mark'}}

" File explorer (needed where ranger is not available)
NeoBundleLazy 'Shougo/vimfiler', {'autoload' : { 'commands' : ['VimFiler']}}

" Junk files
NeoBundleLazy 'Shougo/junkfile.vim', {'autoload':{'commands':'JunkfileOpen',
            \ 'unite_sources':['junkfile','junkfile/new']}}

" }}}

" Colorschemes {{{

" Dark themes
" Improved terminal version of molokai, almost identical to the GUI one
NeoBundle 'joedicastro/vim-molokai256'

NeoBundle 'tomasr/molokai'
NeoBundleLazy 'sjl/badwolf', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}
NeoBundleLazy 'nielsmadan/harlequin', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}


" Light themes
NeoBundleLazy 'vim-scripts/summerfruit256.vim', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}
NeoBundleLazy 'joedicastro/vim-github256', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}

" Make terminal themes from GUI themes
NeoBundleLazy 'godlygeek/csapprox', { 'autoload' :
        \ { 'commands' : ['CSApprox', 'CSApproxSnapshot']}}

" }}}

" DCVS {{{
"
" Admin Git
NeoBundle 'tpope/vim-fugitive'
" Show git repository changes in the current file
NeoBundle 'airblade/vim-gitgutter'
" Git viewer
NeoBundleLazy 'gregsexton/gitv', {'depends':['tpope/vim-fugitive'],
            \ 'autoload':{'commands':'Gitv'}}

" }}}

" Markdown {{{

" Markdown Syntax
NeoBundleLazy 'joedicastro/vim-markdown'
" Makes a Markdown Extra preview into the browser
NeoBundleLazy 'joedicastro/vim-markdown-extra-preview'

" }}}

" Linux tools {{{

" A diff tool for directories
NeoBundleLazy 'joedicastro/DirDiff.vim', { 'autoload': { 'commands' : 'DirDiff'}}
" Hexadecimal editor
NeoBundle 'Shougo/vinarise.vim'

" }}}

" Python {{{

" Autocompletion
NeoBundle 'Shougo/neocomplete.vim'
" A Python plugin
NeoBundleLazy 'klen/python-mode', {'autoload': {'filetypes': ['python']}}
" Admin virtualenvs
NeoBundle 'jmcantrell/vim-virtualenv'
" Show indent lines
NeoBundleLazy 'Yggdroot/indentLine', {'autoload': {'filetypes': ['python']}}
" Show reports from coverage.py
NeoBundleLazy 'alfredodeza/coveragepy.vim', {'autoload': {'filetypes': ['python']}}

" }}}

" Code Snippets {{{

" Powerful and advanced Snippets tool
NeoBundle 'SirVer/ultisnips'

" }}}

" Syntax {{{

NeoBundleLazy 'vim-scripts/JSON.vim', {'autoload': {'filetypes': ['json']}}
NeoBundleLazy 'vim-scripts/po.vim--gray', {'autoload': {'filetypes': ['po']}}
NeoBundleLazy 'joedicastro/vim-pentadactyl', {
            \ 'autoload': {'filetypes': ['pentadactyl']}}
NeoBundle 'scrooloose/syntastic'

" }}}

" Open external links {{{

" Open a url into the browser or another files with an external app
NeoBundle 'vim-scripts/utl.vim'

" }}}

" Text edition {{{

" Autocompletion of (, [, {, ', ", ...
NeoBundle 'delimitMate.vim'
" Smart and fast date changer
NeoBundle 'tpope/vim-speeddating'
" to surround vim objects with a pair of identical chars
NeoBundle 'tpope/vim-surround'
" extend repetitions by the 'dot' key
NeoBundle 'tpope/vim-repeat'
" toggle comments
NeoBundle 'tpope/vim-commentary'
" smart digraphs insertion
NeoBundle 'Rykka/easydigraph.vim'
" browse the vim undo tree
NeoBundleLazy 'sjl/gundo.vim', { 'autoload' : {'commands': 'GundoToggle'}}
" to insert lorem ipsum blocks
NeoBundleLazy 'vim-scripts/loremipsum', { 'autoload' :
            \ { 'commands' : 'Loremipsum'}}
" reveals all the character info, Unicode included
NeoBundle 'tpope/vim-characterize'
" transpose lines and text blocks
NeoBundleLazy 'salsifis/vim-transpose', { 'autoload' :
            \ { 'commands' : 'Transpose'}}
" marks admin
NeoBundle 'kshenoy/vim-signature'
" text-objects
NeoBundle 'kana/vim-textobj-entire' " ae, ie
NeoBundle 'kana/vim-textobj-indent' " ai, ii, aI, iI
NeoBundle 'kana/vim-textobj-lastpat' " a/, i/, a?, i?
NeoBundle 'kana/vim-textobj-line' " al, il
NeoBundle 'kana/vim-textobj-underscore' " a_, i_
NeoBundle 'kana/vim-textobj-user'
" multiple cursors
NeoBundle 'terryma/vim-multiple-cursors'
" translate text with google translator
NeoBundle 'maksimr/vim-translator'

" }}}

" HTML/CSS {{{

" A smart and powerful Color Management tool. Needs to be loaded to be able
" to use the mappings
NeoBundleLazy 'Rykka/colorv.vim', {'autoload' : {
            \ 'commands' : [
                             \ 'ColorV', 'ColorVView', 'ColorVPreview',
                             \ 'ColorVPicker', 'ColorVEdit', 'ColorVEditAll',
                             \ 'ColorVInsert', 'ColorVList', 'ColorVName',
                             \ 'ColorVScheme', 'ColorVSchemeFav',
                             \ 'ColorVSchemeNew', 'ColorVTurn2'],
            \ }}

NeoBundleLazy 'othree/html5.vim', {'autoload':
            \ {'filetypes': ['html', 'xhttml', 'css']}}

NeoBundleLazy 'mattn/emmet-vim', {'autoload':
            \ {'filetypes': ['html', 'xhttml', 'css', 'xml', 'xls', 'markdown']}}
" }}}

" GUI {{{

" A better looking status line
NeoBundle 'bling/vim-airline'
" Zooms a window
NeoBundleLazy 'vim-scripts/zoomwintab.vim', {'autoload' :
            \{'commands' : 'ZoomWinTabToggle'}}
" easily window resizing
NeoBundle 'jimsei/winresizer'

" }}}

" Tmux {{{

" Easily interacts with Tmux from Vim
NeoBundle 'benmills/vimux'
" Tmux config file syntax
NeoBundleLazy 'vimez/vim-tmux', { 'autoload' : { 'filetypes' : 'conf'}}

" }}}

" API Web {{{

NeoBundle 'mattn/webapi-vim'

" }}}

" END BUNDLES }}}

" Auto install the plugins {{{

" First-time plugins installation
if iCanHazNeoBundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :NeoBundleInstall
endif

" Check if all of the plugins are already installed, in other case ask if we
" want to install them (useful to add plugins in the .vimrc)
NeoBundleCheck

" }}}

filetype plugin indent on      " Indent and plugins by filetype

" END NEOBUNDLE }}}

" VIM Setup {{{ ===============================================================

" <Leader> & <LocalLeader> mapping {{{

let mapleader=','
let maplocalleader= ' '

" }}}

" Basic options {{{

scriptencoding utf-8
set encoding=utf-8              " setup the encoding to UTF-8
set ls=2                        " status line always visible
set go-=T                       " hide the toolbar
set go-=m                       " hide the menu
set go+=rRlLbh                  " show all the scrollbars
set go-=rRlLbh                  " hide all the scrollbars
set visualbell                  " turn on the visual bell
set cursorline                  " highlight the line under the cursor
set fillchars+=vert:│           " better looking for windows separator
set ttyfast                     " better screen redraw
set title                       " set the terminal title to the current file
set showcmd                     " shows partial commands
set hidden                      " hide the inactive buffers
set ruler                       " sets a permanent rule
set lazyredraw                  " only redraws if it is needed
set autoread                    " update a open file edited outside of Vim
set ttimeoutlen=0               " toggle between modes almost instantly
set backspace=indent,eol,start  " defines the backspace key behavior
set virtualedit=all             " to edit where there is no actual character

" }}}

" Searching {{{

set incsearch                   " incremental searching
set showmatch                   " show pairs match
set hlsearch                    " highlight search results
set smartcase                   " smart case ignore
set ignorecase                  " ignore case letters

" }}}

" History and permanent undo levels {{{

set history=1000
set undofile
set undoreload=1000

" }}}

" Make a dir if no exists {{{

function! MakeDirIfNoExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path), "p")
    endif
endfunction

" }}}

" Backups {{{

set backup
set noswapfile
set backupdir=$HOME/.vim/tmp/backup/
set undodir=$HOME/.vim/tmp/undo/
set directory=$HOME/.vim/tmp/swap/
set viminfo+=n$HOME/.vim/tmp/viminfo

" make this dirs if no exists previously
silent! call MakeDirIfNoExists(&undodir)
silent! call MakeDirIfNoExists(&backupdir)
silent! call MakeDirIfNoExists(&directory)

" }}}

" Wildmenu {{{

set wildmenu                        " Command line autocompletion
set wildmode=list:longest,full      " Shows all the options

set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.jar                            " java archives
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.stats                          " Pylint stats

" }}}

" Tabs, space and wrapping {{{

set expandtab                  " spaces instead of tabs
set tabstop=4                  " a tab = four spaces
set shiftwidth=4               " number of spaces for auto-indent
set softtabstop=4              " a soft-tab of four spaces
set autoindent                 " set on the auto-indent

" set formatoptions=qrn1ct
set textwidth=80
set colorcolumn=81

function! ToggleWrap()
    let s:nowrap_cc_bg = [22, '#005f00']
    redir => s:curr_cc_hi
    silent hi ColorColumn
    redir END
    let s:curr_cc_ctermbg = matchstr(s:curr_cc_hi, 'ctermbg=\zs.\{-}\s\ze\1')
    let s:curr_cc_guibg = matchstr(s:curr_cc_hi, 'guibg=\zs.\{-}\_$\ze\1')
    if s:curr_cc_ctermbg != s:nowrap_cc_bg[0]
        let g:curr_cc_ctermbg = s:curr_cc_ctermbg
    endif
    if s:curr_cc_guibg != s:nowrap_cc_bg[1]
        let g:curr_cc_guibg = s:curr_cc_guibg
    endif
    if &textwidth == 80
        set textwidth=0
        exec 'hi ColorColumn ctermbg='.s:nowrap_cc_bg[0].
                    \' guibg='.s:nowrap_cc_bg[1]
    elseif &textwidth == 0
        set textwidth=80
        exec 'hi ColorColumn ctermbg='.g:curr_cc_ctermbg.
                    \' guibg='.g:curr_cc_guibg
    endif
endfunction

nmap <silent><Leader>ew :call ToggleWrap()<CR>

" }}}

" Ok, a vim for men, get off the cursor keys {{{

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" }}}

" Colorscheme {{{

syntax enable                  " enable the syntax highlight
set background=dark            " set a dark background
set t_Co=256                   " 256 colors for the terminal
if has('gui_running')
    colorscheme molokai
else
    colorscheme molokai256
endif

" }}}

" Font {{{

set guifont=Dejavu\ Sans\ Mono\ for\ Powerline\ 11

" }}}

" Resize the divisions if the Vim window size changes {{{

au VimResized * exe "normal! \<c-w>="

" }}}

" New windows {{{

nnoremap <Leader>v <C-w>v
nnoremap <Leader>h <C-w>s

" }}}

" Fast window moves {{{

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" }}}

" Fast window & buffer close and kill {{{

nnoremap <Leader>k <C-w>c
nnoremap <silent><Leader>K :bd<CR>

" }}}

" Toggle line numbers {{{

nnoremap <silent><Leader>l :call ToggleRelativeAbsoluteNumber()<CR>
function! ToggleRelativeAbsoluteNumber()
  if !&number && !&relativenumber
      set number
      set norelativenumber
  elseif &number && !&relativenumber
      set nonumber
      set relativenumber
  elseif !&number && &relativenumber
      set number
      set relativenumber
  elseif &number && &relativenumber
      set nonumber
      set norelativenumber
  endif
endfunction

" Set the relative number for defaulteq
set number
set relativenumber

" }}}

" Show hidden chars {{{

nmap <Leader>eh :set list!<CR>
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶

" }}}

" Folding {{{

set foldmethod=marker

" Default open all folds
set foldlevel=100

" Toggle folding
nnoremap \ za
vnoremap \ za

" }}}

" Cut/Paste {{{

" to/from the clipboard
map <Leader>y "*y
map <Leader>p "*p

" toggle paste mode
map <Leader>P :set invpaste<CR>

" }}}

" Autoload configuration when this file changes ($MYVIMRC) {{{

autocmd! BufWritePost vimrc source %

" }}}

" Spelling {{{

" turn on the spell checking and set the English language
nmap <Leader>se :setlocal spell spelllang=en<CR>
" turn off the spell checking
nmap <Leader>so :setlocal nospell <CR>
" jump to the next bad spell word
nmap <Leader>sn ]s
" suggest words
nmap <Leader>sp z=
" jump to the next bad spell word and suggests a correct one
nmap <Leader>sc ]sz=
" add word to the dictionary
nmap <Leader>sa zg
" }}}

" Save as root {{{

cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" }}}

" Quick saving {{{

nmap <silent> <Leader>w :update<CR>

" }}}

" Delete trailing whitespaces {{{

nmap <silent><Leader>et :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" }}}

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

" Toggle the Quickfix window {{{

function! s:QuickfixToggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            lclose
            return
        endif
    endfor
    copen
endfunction
command! ToggleQuickfix call <SID>QuickfixToggle()

nnoremap <silent> <Leader>q :ToggleQuickfix<CR>

" }}}

" Text statistics {{{

" get the total of lines, words, chars and bytes (and for the current position)
map <Leader>es g<C-G>

" get the word frequency in the text
function! WordFrequency() range
  let all = split(join(getline(a:firstline, a:lastline)), '\A\+')
  let frequencies = {}
  for word in all
    let frequencies[word] = get(frequencies, word, 0) + 1
  endfor
  let lst = []
  for [key,value] in items(frequencies)
    call add(lst, value."\t".key."\n")
  endfor
  call sort(lst)
  echo join(lst)
endfunction
command! -range=% WordFrequency <line1>,<line2>call WordFrequency()
map <Leader>ef :Unite output:WordFrequency<CR>

" }}}

" Count lines of code {{{

function! LinesOfCode()
    echo system('cloc --quiet '.bufname("%"))
endfunction

"}}}

" Toggle the search results highlighting {{{

map <silent><Leader>eq :set invhlsearch<CR>

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

" }}}

" Quick exiting without save {{{

nnoremap <Leader>`` :qa!<CR>

" }}}

" Execution permissions by default to shebang (#!) files {{{

augroup shebang_chmod
  autocmd!
  autocmd BufNewFile  * let b:brand_new_file = 1
  autocmd BufWritePost * unlet! b:brand_new_file
  autocmd BufWritePre *
        \ if exists('b:brand_new_file') |
        \   if getline(1) =~ '^#!' |
        \     let b:chmod_post = '+x' |
        \   endif |
        \ endif
  autocmd BufWritePost,FileWritePost *
        \ if exists('b:chmod_post') && executable('chmod') |
        \   silent! execute '!chmod '.b:chmod_post.' "<afile>"' |
        \   unlet b:chmod_post |
        \ endif
augroup END

" }}}

" Load matchit by default {{{

if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" }}}

" Make the Y behavior similar to D & C {{{

nnoremap Y y$

" }}}

" END VIM SETUP }}}

" PLUGINS Setup {{{ ===========================================================

" Airline {{{

set noshowmode

let g:airline_theme='powerlineish'
let g:airline_enable_branch=1
let g:airline_powerline_fonts=1
let g:airline_detect_whitespace = 1
let g:airline#extensions#hunks#non_zero_only = 1

" }}}

" ColorV {{{

let g:colorv_cache_file=$HOME.'/.vim/tmp/vim_colorv_cache'
let g:colorv_cache_fav=$HOME.'/.vim/tmp/vim_colorv_cache_fav'

" }}}

" Commentary {{{ -------------------------------------------------------------

nmap <Leader>c <Plug>CommentaryLine
xmap <Leader>c <Plug>Commentary

augroup plugin_commentary
    au!
    au FileType python setlocal commentstring=#%s
    au FileType htmldjango setlocal commentstring={#\ %s\ #}
    au FileType puppet setlocal commentstring=#\ %s
augroup END

" }}}

" delimitmate {{{

let delimitMate_expand_space = 1

" }}}

" easydigraph {{{

let g:EasyDigraph_nmap = '<Leader>dd'

" }}}

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

" Google Translator {{{

" Translate to zh (Chinese). Using language code iso 639-1
let g:goog_user_conf = {'langpair': 'en|zh', 'v_key': 'T'}

" }}}

" Gundo {{{ ------------------------------------------------------------------

nnoremap <Leader>u :GundoToggle<CR>

let g:gundo_preview_bottom = 1

" }}}

" indentLine {{{

map <silent> <Leader>L :IndentLinesToggle<CR>
let g:indentLine_enabled = 0
let g:indentLine_char = '┊'
let g:indentLine_color_term = 239

" }}}

" Neocomplete {{{

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_refresh_always = 1
let g:neocomplete#max_list = 30
let g:neocomplete#min_keyword_length = 1
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#data_directory = $HOME.'/.vim/tmp/neocomplete'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" }}}

" PythonMode {{{ -------------------------------------------------------------

let g:pymode_breakpoint_key = '<Leader>B'

let g:pymode_lint_checker = 'pylint,pep8,mccabe,pep257'
let g:pymode_lint_ignore = ''
" let g:pymode_lint_config = $HOME.'/dotfiles/pylint/pylint.rc'
let g:pymode_virtualenv = 0

let g:pymode_rope = 1
let g:pymode_rope_goto_def_newwin = 'new'
let g:pymode_rope_guess_project = 0
let g:pymode_rope_vim_completion = 1
let g:pymode_rope_always_show_complete_menu = 1

" }}}

" Syntastic {{{

let g:syntastic_python_pylint_exe = "pylint2"

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol  = '⚡'
let g:syntastic_style_warning_symbol  = '⚡'

" }}}

" Unite {{{

" files
nnoremap <silent><Leader>o :Unite -silent -start-insert file<CR>
nnoremap <silent><Leader>O :Unite -silent -start-insert file_rec/async<CR>
nnoremap <silent><Leader>m :Unite -silent file_mru<CR>
" buffers
nnoremap <silent><Leader>b :Unite -silent buffer<CR>
" tabs
nnoremap <silent><Leader>B :Unite -silent tab<CR>
" buffer search
nnoremap <silent><Leader>f :Unite -silent -no-split -start-insert -auto-preview
            \ line<CR>
nnoremap <silent>[menu]8 :UniteWithCursorWord -silent -no-split -auto-preview
            \ line<CR>
" yankring
nnoremap <silent><Leader>i :Unite -silent history/yank<CR>
" grep
nnoremap <silent><Leader>a :Unite -silent -no-quit grep<CR>
" help
nnoremap <silent> g<C-h> :UniteWithCursorWord -silent help<CR>
" tasks
nnoremap <silent><Leader>; :Unite -silent -toggle
            \ grep:%::FIXME\|TODO\|NOTE\|XXX\|COMBAK\|@todo<CR>
" outlines (also ctags)
nnoremap <silent><Leader>t :Unite -silent -vertical -winwidth=40
            \ -direction=topleft -toggle outline<CR>
" junk files
  nnoremap <silent><Leader>d :Unite -silent junkfile/new junkfile<CR>

" menus {{{
let g:unite_source_menu_menus = {}

" menu prefix key (for all Unite menus) {{{
nnoremap [menu] <Nop>
nmap <LocalLeader> [menu]
" }}}

" menus menu
nnoremap <silent>[menu]u :Unite -silent -winheight=20 menu<CR>

" files and dirs menu {{{
let g:unite_source_menu_menus.files = {
    \ 'description' : '          files & dirs
        \                                          ⌘ [space]o',
    \}
let g:unite_source_menu_menus.files.command_candidates = [
    \['▷ open file                                                  ⌘ ,o',
        \'Unite -start-insert file'],
    \['▷ open more recently used files                              ⌘ ,m',
        \'Unite file_mru'],
    \['▷ open file with recursive search                            ⌘ ,O',
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
    \['▷ junk files                                                 ⌘ ,d',
        \'Unite junkfile/new junkfile'],
    \['▷ save as root                                               ⌘ :w!!',
        \'exe "write !sudo tee % >/dev/null"'],
    \['▷ quick save                                                 ⌘ ,w',
        \'normal ,w'],
    \['▷ open ranger                                                ⌘ ,x',
        \'call RangerChooser()'],
    \['▷ open vimfiler                                              ⌘ ,X',
        \'VimFiler'],
    \]
nnoremap <silent>[menu]o :Unite -silent -winheight=17 -start-insert
            \ menu:files<CR>
" }}}

" file searching menu {{{
let g:unite_source_menu_menus.grep = {
    \ 'description' : '           search files
        \                                          ⌘ [space]a',
    \}
let g:unite_source_menu_menus.grep.command_candidates = [
    \['▷ grep (ag → ack → grep)                                     ⌘ ,a',
        \'Unite -no-quit grep'],
    \['▷ find',
        \'Unite find'],
    \['▷ locate',
        \'Unite -start-insert locate'],
    \['▷ vimgrep (very slow)',
        \'Unite vimgrep'],
    \]
nnoremap <silent>[menu]a :Unite -silent menu:grep<CR>
" }}}

" buffers, tabs & windows menu {{{
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
" }}}

" buffer internal searching menu {{{
let g:unite_source_menu_menus.searching = {
    \ 'description' : '      searchs inside the current buffer
        \                     ⌘ [space]f',
    \}
let g:unite_source_menu_menus.searching.command_candidates = [
    \['▷ search line                                                ⌘ ,f',
        \'Unite -auto-preview -start-insert line'],
    \['▷ search word under the cursor                               ⌘ [space]8',
        \'UniteWithCursorWord -no-split -auto-preview line'],
    \['▷ search outlines & tags (ctags)                             ⌘ ,t',
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
    \['▷ search tasks                                               ⌘ ,;',
        \'Unite -toggle grep:%::FIXME|TODO|NOTE|XXX|COMBAK|@todo'],
    \]
nnoremap <silent>[menu]f :Unite -silent menu:searching<CR>
" }}}

" yanks, registers & history menu {{{
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
" }}}

" spelling menu {{{
let g:unite_source_menu_menus.spelling = {
    \ 'description' : '       spell checking
        \                                        ⌘ [space]s',
    \}
let g:unite_source_menu_menus.spelling.command_candidates = [
    \['▷ spell checking in English                                  ⌘ ,se',
        \'setlocal spell spelllang=en'],
    \['▷ turn off spell checking                                    ⌘ ,so',
        \'setlocal nospell'],
    \['▷ jumps to next bad spell word and show suggestions          ⌘ ,sc',
        \'normal ,sc'],
    \['▷ jumps to next bad spell word                               ⌘ ,sn',
        \'normal ,sn'],
    \['▷ suggestions                                                ⌘ ,sp',
        \'normal ,sp'],
    \['▷ add word to dictionary                                     ⌘ ,sa',
        \'normal ,sa'],
    \]
nnoremap <silent>[menu]s :Unite -silent menu:spelling<CR>
" }}}

" text edition menu {{{
let g:unite_source_menu_menus.text = {
    \ 'description' : '           text edition
        \                                          ⌘ [space]e',
    \}
let g:unite_source_menu_menus.text.command_candidates = [
    \['▷ toggle search results highlight                            ⌘ ,eq',
        \'set invhlsearch'],
    \['▷ toggle line numbers                                        ⌘ ,l',
        \'call ToggleRelativeAbsoluteNumber()'],
    \['▷ toggle wrapping                                            ⌘ ,ew',
        \'call ToggleWrap()'],
    \['▷ show hidden chars                                          ⌘ ,eh',
        \'set list!'],
    \['▷ toggle fold                                                ⌘ /',
        \'normal za'],
    \['▷ open all folds                                             ⌘ zR',
        \'normal zR'],
    \['▷ close all folds                                            ⌘ zM',
        \'normal zM'],
    \['▷ copy to the clipboard                                      ⌘ ,y',
        \'normal ,y'],
    \['▷ paste from the clipboard                                   ⌘ ,p',
        \'normal ,p'],
    \['▷ toggle paste mode                                          ⌘ ,P',
        \'normal ,P'],
    \['▷ remove trailing whitespaces                                ⌘ ,et',
        \'normal ,et'],
    \['▷ text statistics                                            ⌘ ,es',
        \'Unite output:normal\ ,es -no-cursor-line'],
    \['▷ show word frequency                                        ⌘ ,ef',
        \'Unite output:WordFrequency'],
    \['▷ show available digraphs',
        \'digraphs'],
    \['▷ insert lorem ipsum text',
        \'exe "Loremipsum" input("numero de palabras: ")'],
    \['▷ show current char info                                     ⌘ ga',
        \'normal ga'],
    \]
nnoremap <silent>[menu]e :Unite -silent -winheight=20 menu:text <CR>
" }}}

" neobundle menu {{{
let g:unite_source_menu_menus.neobundle = {
    \ 'description' : '      plugins administration with neobundle
        \                 ⌘ [space]n',
    \}
let g:unite_source_menu_menus.neobundle.command_candidates = [
    \['▷ neobundle',
        \'Unite neobundle'],
    \['▷ neobundle log',
        \'Unite neobundle/log'],
    \['▷ neobundle lazy',
        \'Unite neobundle/lazy'],
    \['▷ neobundle update',
        \'Unite neobundle/update'],
    \['▷ neobundle search',
        \'Unite neobundle/search'],
    \['▷ neobundle install',
        \'Unite neobundle/install'],
    \['▷ neobundle check',
        \'Unite -no-empty output:NeoBundleCheck'],
    \['▷ neobundle docs',
        \'Unite output:NeoBundleDocs'],
    \['▷ neobundle clean',
        \'NeoBundleClean'],
    \['▷ neobundle list',
        \'Unite output:NeoBundleList'],
    \['▷ neobundle direct edit',
        \'NeoBundleDirectEdit'],
    \]
nnoremap <silent>[menu]n :Unite -silent -start-insert menu:neobundle<CR>
" }}}

" git menu {{{
let g:unite_source_menu_menus.git = {
    \ 'description' : '            admin git repositories
        \                                ⌘ [space]g',
    \}
let g:unite_source_menu_menus.git.command_candidates = [
    \['▷ tig                                                        ⌘ ,gt',
        \'normal ,gt'],
    \['▷ git viewer             (gitv)                              ⌘ ,gv',
        \'normal ,gv'],
    \['▷ git viewer - buffer    (gitv)                              ⌘ ,gV',
        \'normal ,gV'],
    \['▷ git status             (fugitive)                          ⌘ ,gs',
        \'Gstatus'],
    \['▷ git diff               (fugitive)                          ⌘ ,gd',
        \'Gdiff'],
    \['▷ git commit             (fugitive)                          ⌘ ,gc',
        \'Gcommit'],
    \['▷ git log                (fugitive)                          ⌘ ,gl',
        \'exe "silent Glog | Unite -no-quit quickfix"'],
    \['▷ git log - all          (fugitive)                          ⌘ ,gL',
        \'exe "silent Glog -all | Unite -no-quit quickfix"'],
    \['▷ git blame              (fugitive)                          ⌘ ,gb',
        \'Gblame'],
    \['▷ git add/stage          (fugitive)                          ⌘ ,gw',
        \'Gwrite'],
    \['▷ git checkout           (fugitive)                          ⌘ ,go',
        \'Gread'],
    \['▷ git rm                 (fugitive)                          ⌘ ,gR',
        \'Gremove'],
    \['▷ git mv                 (fugitive)                          ⌘ ,gm',
        \'exe "Gmove " input("destino: ")'],
    \['▷ git push               (fugitive, buffer output)           ⌘ ,gp',
        \'Git! push'],
    \['▷ git pull               (fugitive, buffer output)           ⌘ ,gP',
        \'Git! pull'],
    \['▷ git command            (fugitive, buffer output)           ⌘ ,gi',
        \'exe "Git! " input("comando git: ")'],
    \['▷ git edit               (fugitive)                          ⌘ ,gE',
        \'exe "command Gedit " input(":Gedit ")'],
    \['▷ git grep               (fugitive)                          ⌘ ,gg',
        \'exe "silent Ggrep -i ".input("Pattern: ") | Unite -no-quit quickfix'],
    \['▷ git grep - messages    (fugitive)                          ⌘ ,ggm',
        \'exe "silent Glog --grep=".input("Pattern: ")." | Unite -no-quit quickfix"'],
    \['▷ git grep - text        (fugitive)                          ⌘ ,ggt',
        \'exe "silent Glog -S".input("Pattern: ")." | Unite -no-quit quickfix"'],
    \['▷ git init                                                   ⌘ ,gn',
        \'Unite output:echo\ system("git\ init")'],
    \['▷ git cd                 (fugitive)',
        \'Gcd'],
    \['▷ git lcd                (fugitive)',
        \'Glcd'],
    \['▷ git browse             (fugitive)                          ⌘ ,gB',
        \'Gbrowse'],
    \]
nnoremap <silent>[menu]g :Unite -silent -winheight=26 -start-insert menu:git<CR>
" }}}

" code menu {{{
let g:unite_source_menu_menus.code = {
    \ 'description' : '           code tools
        \                                            ⌘ [space]p',
    \}
let g:unite_source_menu_menus.code.command_candidates = [
    \['▷ run python code                            (pymode)        ⌘ ,r',
        \'Pyrun'],
    \['▷ show docs for the current word             (pymode)        ⌘ K',
        \'normal K'],
    \['▷ insert a breakpoint                        (pymode)        ⌘ ,B',
        \'normal ,B'],
    \['▷ togle pylint revison                       (pymode)',
        \'PyLintToggle'],
    \['▷ run with python2 in tmux panel             (vimux)         ⌘ ,rr',
        \'normal ,rr'],
    \['▷ run with python3 in tmux panel             (vimux)         ⌘ ,r3',
        \'normal ,r3'],
    \['▷ run with python2 & time in tmux panel      (vimux)         ⌘ ,rt',
        \'normal ,rt'],
    \['▷ run with pypy & time in tmux panel         (vimux)         ⌘ ,rp',
        \'normal ,rp'],
    \['▷ command prompt to run in a tmux panel      (vimux)         ⌘ ,rc',
        \'VimuxPromptCommand'],
    \['▷ repeat last command                        (vimux)         ⌘ ,rl',
        \'VimuxRunLastCommand'],
    \['▷ stop command execution in tmux panel       (vimux)         ⌘ ,rs',
        \'VimuxInterruptRunner'],
    \['▷ inspect tmux panel                         (vimux)         ⌘ ,ri',
        \'VimuxInspectRunner'],
    \['▷ close tmux panel                           (vimux)         ⌘ ,rq',
        \'VimuxCloseRunner'],
    \['▷ rope autocompletion                        (rope)          ⌘ C-[espacio]',
        \'RopeCodeAssist'],
    \['▷ go to definition                           (rope)          ⌘ C-C g',
        \'RopeGotoDefinition'],
    \['▷ reorganize imports                         (rope)          ⌘ C-C r o',
        \'RopeOrganizeImports'],
    \['▷ refactorize - rename                       (rope)          ⌘ C-C r r',
        \'RopeRename'],
    \['▷ refactorize - extract variable             (rope)          ⌘ C-C r l',
        \'RopeExtractVariable'],
    \['▷ refactorize - extract method               (rope)          ⌘ C-C r m',
        \'RopeExtractMethod'],
    \['▷ refactorize - inline                       (rope)          ⌘ C-C r i',
        \'RopeInline'],
    \['▷ refactorize - move                         (rope)          ⌘ C-C r v',
        \'RopeMove'],
    \['▷ refactorize - restructure                  (rope)          ⌘ C-C r x',
        \'RopeRestructure'],
    \['▷ refactorize - use function                 (rope)          ⌘ C-C r u',
        \'RopeUseFunction'],
    \['▷ refactorize - introduce factory            (rope)          ⌘ C-C r f',
        \'RopeIntroduceFactory'],
    \['▷ refactorize - change signature             (rope)          ⌘ C-C r s',
        \'RopeChangeSignature'],
    \['▷ refactorize - rename current module        (rope)          ⌘ C-C r 1 r',
        \'RopeRenameCurrentModule'],
    \['▷ refactorize - move current module          (rope)          ⌘ C-C r 1 m',
        \'RopeMoveCurrentModule'],
    \['▷ refactorize - module to package            (rope)          ⌘ C-C r 1 p',
        \'RopeModuleToPackage'],
    \['▷ show docs for current word                 (rope)          ⌘ C-C r a d',
        \'RopeShowDoc'],
    \['▷ syntastic check                            (syntastic)',
        \'SyntasticCheck'],
    \['▷ syntastic errors                           (syntastic)',
        \'Errors'],
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
    \['▷ count lines of code',
        \'Unite -default-action= output:call\\ LinesOfCode()'],
    \['▷ toggle indent lines                                        ⌘ ,L',
        \'IndentLinesToggle'],
    \]
nnoremap <silent>[menu]p :Unite -silent -winheight=42 menu:code<CR>
" }}}

" markdown menu {{{
let g:unite_source_menu_menus.markdown = {
    \ 'description' : '       preview markdown extra docs
        \                           ⌘ [space]k',
    \}
let g:unite_source_menu_menus.markdown.command_candidates = [
    \['▷ preview',
        \'Me'],
    \['▷ refresh',
        \'Mer'],
    \]
nnoremap <silent>[menu]k :Unite -silent menu:markdown<CR>
" }}}

" sessions menu {{{
let g:unite_source_menu_menus.sessions = {
    \ 'description' : '       sessions
        \                                              ⌘ [space]h',
    \}
let g:unite_source_menu_menus.sessions.command_candidates = [
    \['▷ load session',
        \'Unite session'],
    \['▷ make session (default)',
        \'UniteSessionSave'],
    \['▷ make session (custom)',
        \'exe "UniteSessionSave " input("name: ")'],
    \]
nnoremap <silent>[menu]h :Unite -silent menu:sessions<CR>
" }}}

" bookmarks menu {{{
let g:unite_source_menu_menus.bookmarks = {
    \ 'description' : '      bookmarks
        \                                             ⌘ [space]m',
    \}
let g:unite_source_menu_menus.bookmarks.command_candidates = [
    \['▷ open bookmarks',
        \'Unite bookmark:*'],
    \['▷ add bookmark',
        \'UniteBookmarkAdd'],
    \]
nnoremap <silent>[menu]m :Unite -silent menu:bookmarks<CR>
" }}}

" colorv menu {{{
function! GetColorFormat()
    let formats = {'r' : 'RGB',
                  \'n' : 'NAME',
                  \'s' : 'HEX',
                  \'ar': 'RGBA',
                  \'pr': 'RGBP',
                  \'pa': 'RGBAP',
                  \'m' : 'CMYK',
                  \'l' : 'HSL',
                  \'la' : 'HSLA',
                  \'h' : 'HSV',
                  \}
    let formats_menu = ["\n"]
    for [k, v] in items(formats)
        call add(formats_menu, "  ".k."\t".v."\n")
    endfor
    let fsel = get(formats, input('Choose a format: '.join(formats_menu).'? '))
    return fsel
endfunction

function! GetColorMethod()
    let methods = {
                   \'h' : 'Hue',
                   \'s' : 'Saturation',
                   \'v' : 'Value',
                   \'m' : 'Monochromatic',
                   \'a' : 'Analogous',
                   \'3' : 'Triadic',
                   \'4' : 'Tetradic',
                   \'n' : 'Neutral',
                   \'c' : 'Clash',
                   \'q' : 'Square',
                   \'5' : 'Five-Tone',
                   \'6' : 'Six-Tone',
                   \'2' : 'Complementary',
                   \'p' : 'Split-Complementary',
                   \'l' : 'Luma',
                   \'g' : 'Turn-To',
                   \}
    let methods_menu = ["\n"]
    for [k, v] in items(methods)
        call add(methods_menu, "  ".k."\t".v."\n")
    endfor
    let msel = get(methods, input('Choose a method: '.join(methods_menu).'? '))
    return msel
endfunction

let g:unite_source_menu_menus.colorv = {
    \ 'description' : '         color management
        \                                      ⌘ [space]c',
    \}
let g:unite_source_menu_menus.colorv.command_candidates = [
    \['▷ open colorv                                                ⌘ ,cv',
        \'ColorV'],
    \['▷ open colorv with the color under the cursor                ⌘ ,cw',
        \'ColorVView'],
    \['▷ preview colors                                             ⌘ ,cpp',
        \'ColorVPreview'],
    \['▷ color picker                                               ⌘ ,cd',
        \'ColorVPicker'],
    \['▷ edit the color under the cursor                            ⌘ ,ce',
        \'ColorVEdit'],
    \['▷ edit the color under the cursor (and all the concurrences) ⌘ ,cE',
        \'ColorVEditAll'],
    \['▷ insert a color                                             ⌘ ,cii',
        \'exe "ColorVInsert " .GetColorFormat()'],
    \['▷ color list relative to the current                         ⌘ ,cgh',
        \'exe "ColorVList " .GetColorMethod() "
        \ ".input("number of colors? (optional): ")
        \ " ".input("number of steps?  (optional): ")'],
    \['▷ show colors list (Web W3C colors)                          ⌘ ,cn',
        \'ColorVName'],
    \['▷ choose color scheme (ColourLovers, Kuler)                  ⌘ ,css',
        \'ColorVScheme'],
    \['▷ show favorite color schemes                                ⌘ ,csf',
        \'ColorVSchemeFav'],
    \['▷ new color scheme                                           ⌘ ,csn',
        \'ColorVSchemeNew'],
    \['▷ create hue gradation between two colors',
        \'exe "ColorVTurn2 " " ".input("Color 1 (hex): ")
        \" ".input("Color 2 (hex): ")'],
    \]
nnoremap <silent>[menu]c :Unite -silent menu:colorv<CR>
" }}}

" vim menu {{{
let g:unite_source_menu_menus.vim = {
    \ 'description' : '            vim
        \                                                   ⌘ [space]v',
    \}
let g:unite_source_menu_menus.vim.command_candidates = [
    \['▷ choose colorscheme',
        \'Unite colorscheme -auto-preview'],
    \['▷ mappings',
        \'Unite mapping -start-insert'],
    \['▷ edit configuration file (vimrc)',
        \'edit $MYVIMRC'],
    \['▷ choose filetype',
        \'Unite -start-insert filetype'],
    \['▷ vim help',
        \'Unite -start-insert help'],
    \['▷ vim commands',
        \'Unite -start-insert command'],
    \['▷ vim functions',
        \'Unite -start-insert function'],
    \['▷ vim runtimepath',
        \'Unite -start-insert runtimepath'],
    \['▷ vim command output',
        \'Unite output'],
    \['▷ unite sources',
        \'Unite source'],
    \['▷ kill process',
        \'Unite -default-action=sigkill -start-insert process'],
    \['▷ launch executable (dmenu like)',
        \'Unite -start-insert launcher'],
    \]
nnoremap <silent>[menu]v :Unite menu:vim -silent -start-insert<CR>
" }}}
" }}}

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate',
            \ 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/'], '\|'))

let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 0
let g:unite_enable_short_source_mes = 0
let g:unite_force_overwrite_statusline = 0
let g:unite_prompt = '>>> '
let g:unite_marked_icon = '✓'
" let g:unite_candidate_icon = '∘'
let g:unite_winheight = 15
let g:unite_update_time = 200
let g:unite_split_rule = 'botright'
let g:unite_data_directory = $HOME.'/.vim/tmp/unite'
let g:unite_source_buffer_time_format = '(%d-%m-%Y %H:%M:%S) '
let g:unite_source_file_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
let g:unite_source_directory_mru_time_format = '(%d-%m-%Y %H:%M:%S) '

if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup -a -S'
    let g:unite_source_grep_recursive_opt=''
    let g:unite_source_grep_search_word_highlight = 1
elseif executable('ack')
    let g:unite_source_grep_command='ack'
    let g:unite_source_grep_default_opts='--no-group --no-color'
    let g:unite_source_grep_recursive_opt=''
    let g:unite_source_grep_search_word_highlight = 1
endif

let g:junkfile#directory=expand($HOME."/.vim/tmp/junk")

" make this dir if no exists previously
silent! call MakeDirIfNoExists(expand(unite_data_directory)."/session/")

" }}}

" Utl {{{

map <Leader>j :Utl <CR><Bar>:redraw!<CR>

let g:utl_cfg_hdl_scm_http_system = "silent :!open %u &"
let g:utl_cfg_hdl_mt_application_pdf = 'silent :!open %p &'
let g:utl_cfg_hdl_mt_image_jpeg = 'silent :!open %p &'
let g:utl_cfg_hdl_mt_image_gif = 'silent :!open %p &'
let g:utl_cfg_hdl_mt_image_png = 'silent :!open %p &'

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

" Vim-markdown-extra-preview {{{

map <LocalLeader>mp :Me<CR>
map <LocalLeader>mr :Mer<CR>

let g:VMEPextensions = ['extra', 'codehilite']
" Choose a brower to open html file. It must accept file path as parameter
let g:VMEPhtmlreader= '/usr/bin/open -a "/Applications/Google Chrome.app"'

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

" Vinarise {{{

map <F6> :Vinarise<CR>

let g:vinarise_enable_auto_detect = 1

au FileType vinarise let g:airline_section_warning = ''

" }}}

" Virtualenv {{{

let g:virtualenv_auto_activate = 1
let g:virtualenv_stl_format = '(%n)'

" }}}

" winresizer {{{

let g:winresizer_start_key = '<C-C><C-W>'
" cancelar pulsando ESC
" let g:winresizer_finish_with_escape = 1
let g:winresizer_keycode_finish = 27

" }}}

" zoomwintab {{{

map <Leader>z :ZoomWinTabToggle<CR>

" }}}

" END PLUGINS SETUP }}}

" FILETYPES  {{{ ==============================================================

" DJANGO HTML (Templates) {{{

au BufRead,BufNewFile */templates/*.html setlocal filetype=htmldjango.html

" }}}

" JSON {{{ -------------------------------------------------------------------

" autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.json set ft=json

augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

" }}}

" LUA {{{

au BufRead,BufNewFile rc.lua setlocal foldmethod=marker

" }}}

" MARKDOWN {{{

" markdown filetype file
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
autocmd FileType markdown NeoBundleSource vim-markdown
autocmd FileType markdown NeoBundleSource vim-markdown-extra-preview

" }}}

" END FILETYPES }}}

" Other Customizations {{{ ====================================================

let s:vimcustomfile = $HOME.'/.vim/custom.vim'

if filereadable(s:vimcustomfile)
    exec 'source '.s:vimcustomfile
endif

" }}}
