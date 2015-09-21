" VIM Setup {{{

" END VIM SETUP }}}

" Plugins {{{
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

" END Plugins }}}

" Plugin Setup {{{
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

" ColorV {{{

let g:colorv_cache_file=$HOME.'/.vim/tmp/vim_colorv_cache'
let g:colorv_cache_fav=$HOME.'/.vim/tmp/vim_colorv_cache_fav'

" }}}

" END Plugin Setup }}}

" Unite Menu {{{
let g:unite_source_menu_menus.colorv = {
    \ 'description' : '         color management
        \                                      ⌘ [space]l',
    \}
let g:unite_source_menu_menus.colorv.command_candidates = [
    \['▷ open colorv                                                ⌘ <Leader>cv',
        \'ColorV'],
    \['▷ open colorv with the color under the cursor                ⌘ <Leader>cw',
        \'ColorVView'],
    \['▷ preview colors                                             ⌘ <Leader>cpp',
        \'ColorVPreview'],
    \['▷ color picker                                               ⌘ <Leader>cd',
        \'ColorVPicker'],
    \['▷ edit the color under the cursor                            ⌘ <Leader>ce',
        \'ColorVEdit'],
    \['▷ edit the color under the cursor (and all the concurrences) ⌘ <Leader>cE',
        \'ColorVEditAll'],
    \['▷ insert a color                                             ⌘ <Leader>cii',
        \'exe "ColorVInsert " .GetColorFormat()'],
    \['▷ color list relative to the current                         ⌘ <Leader>cgh',
        \'exe "ColorVList " .GetColorMethod() "
        \ ".input("number of colors? (optional): ")
        \ " ".input("number of steps?  (optional): ")'],
    \['▷ show colors list (Web W3C colors)                          ⌘ <Leader>cn',
        \'ColorVName'],
    \['▷ choose color scheme (ColourLovers, Kuler)                  ⌘ <Leader>css',
        \'ColorVScheme'],
    \['▷ show favorite color schemes                                ⌘ <Leader>csf',
        \'ColorVSchemeFav'],
    \['▷ new color scheme                                           ⌘ <Leader>csn',
        \'ColorVSchemeNew'],
    \['▷ create hue gradation between two colors',
        \'exe "ColorVTurn2 " " ".input("Color 1 (hex): ")
        \" ".input("Color 2 (hex): ")'],
    \]

let g:unite_source_menu_menus.colorv.command_candidates = helperfuncs#unite_menu_gen(g:unite_source_menu_menus.colorv.command_candidates, [])

nnoremap <silent>[menu]l :Unite -silent menu:colorv<CR>

" END Unite Menu }}}
