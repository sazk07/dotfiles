vim9script

def FugitiveSetup(): void
    try
        nnoremap <silent> <leader>gs <Cmd>Git<CR>
    catch
        echo "FugitiveSetup failed: " .. v:exception
    endtry
enddef

FugitiveSetup()
