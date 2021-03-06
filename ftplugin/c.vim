function! CRun(...)
    if (a:0 > 0)
        let args=join(a:000, ' ')
    else
        let args=""
    endif

    execute "w"
    execute "!make %:r"
    if has('nvim')
        exec "sp"
        execute "term ./%:r ".args
    else
        execute "!./%:r ".args
    endif
endfunction

command! -nargs=* Run :call CRun(<f-args>)
