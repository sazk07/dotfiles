function! FugitiveSetup() abort
    try
        nnoremap <silent> <leader>gs :Git<CR>
    catch
        echo "FugitiveSetup failed: " . v:exception
    endtry
endfunction

call FugitiveSetup()
