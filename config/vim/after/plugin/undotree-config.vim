function! UndotreeSetup() abort
    try
        nnoremap <silent> <leader>u :UndotreeToggle<CR>
    catch
        echo "UndotreeSetup failed: " . v:exception
    endtry
endfunction

call UndotreeSetup()
