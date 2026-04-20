vim9script

def UndotreeSetup(): void
    try
        nnoremap <silent> <leader>u <Cmd>UndotreeToggle<CR>
    catch
        echo "UndotreeSetup failed: " .. v:exception
    endtry
enddef

UndotreeSetup()
