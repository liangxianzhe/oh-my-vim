" VIM Setup {{{


" END VIM SETUP }}}

" Plugins {{{

NeoBundleLazy 'fatih/vim-go', {'autoload': {'filetypes': ['go']}}

" END Plugins }}}

" Plugin Setup {{{

let g:go_bin_path = expand("$OH_MY_VIM/vim-go")

au FileType go nmap <C-C>i :GoInfo<CR> 
au FileType go nmap <C-C>l :GoLint<CR> 
au FileType go nmap <C-C>D :GoDoc<CR> 
au FileType go nmap <C-C>Db :GoDocBrowser<CR> 
au FileType go nmap <C-C>f :GoFmt<CR> 
au FileType go nmap <C-C>p :GoPlay<CR> 
au FileType go nmap <C-C>v :GoVet<CR> 
au FileType go nmap <C-C>d :GoDef<CR> 
au FileType go nmap <C-C>r :GoRun<CR> 
au FileType go nmap <C-C>b :GoBuild<CR> 
au FileType go nmap <C-C>I :GoInstall<CR> 
au FileType go nmap <C-C>t :GoTest<CR> 
au FileType go nmap <C-C>e :GoErrCheck<CR> 
au FileType go nmap <C-C>fi :GoFiles<CR> 
au FileType go nmap <C-C>de :GoDeps<CR> 
au FileType go nmap <C-C>u :GoUpdateBinaries<CR> 
au FileType go nmap <C-C>od :GoOracleDescribe<CR> 
au FileType go nmap <C-C>oce :GoOracleCallees<CR> 
au FileType go nmap <C-C>ocr :GoOracleCallers<CR> 
au FileType go nmap <C-C>ocs :GoOracleCallstack<CR> 
au FileType go nmap <C-C>ocg :GoOracleCallgraph<CR> 
au FileType go nmap <C-C>oci :GoOracleImplements<CR> 
au FileType go nmap <C-C>occ :GoOracleChannelPeers<CR> 
au FileType go nmap <C-C>of :GoOracleFreevars<CR> 
au FileType go nmap <C-C>or :GoOracleReferrers<CR> 

" END Plugin Setup }}}

" Unite Menu {{{
let g:unite_source_menu_menus.golang = {
    \ 'description' : '         golang development
        \                                    ⌘ [space]d',
    \}
let g:unite_source_menu_menus.golang.command_candidates = [
    \['▷  go info                                                   ⌘ (C-C)i',
        \'GoInfo'],
    \['▷  go lint                                                   ⌘ (C-C)l',
        \'GoLint'],
    \['▷  go doc                                                    ⌘ (C-C)D',
        \'GoDoc'],
    \['▷  go fmt                                                    ⌘ (C-C)f',
        \'GoFmt'],
    \['▷  go play                                                   ⌘ (C-C)p',
        \'GoPlay'],
    \['▷  go def                                                    ⌘ (C-C)d',
        \'GoDef'],
    \['▷  go install                                                ⌘ (C-C)I',
        \'GoInstall'],
    \['▷  go build                                                  ⌘ (C-C)b',
        \'GoBuild'],
    \['▷  go error check                                            ⌘ (C-C)e',
        \'GoErrCheck'],
    \]
nnoremap <silent>[menu]d :Unite -silent -winheight=42 menu:golang<CR>

" END Unite Menu }}}
