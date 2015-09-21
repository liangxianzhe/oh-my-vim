let s:leaderKey = exists("&mapleader")?&mapleader:'\'

function! helperfuncs#unite_menu_gen(unite_menu, empty_list)
    let l:leaderKey = exists("&mapleader")?&mapleader:'\'
    let l:empty_list = a:empty_list

    if empty(a:unite_menu)
        return l:empty_list
    endif

    for entry in a:unite_menu
        if type(entry) == 1
            let entry = substitute(entry, '\V<Leader>\c', '\1'.s:leaderKey, 'g')
        elseif type(entry) == 3
            let entry = helperfuncs#unite_menu_gen(entry, [])
        endif

        call add(l:empty_list, entry)
    endfor

    return l:empty_list
endfunction
