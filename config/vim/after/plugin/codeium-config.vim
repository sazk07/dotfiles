vim9script

def CodeiumSetup(): void
    try
        # Disable Codeium default keybindings
        g:codeium_disable_bindings = 1
        #Accept completion
        imap <script><silent><nowait><expr> <C-a> codeium#Accept()
        # next completion
        imap <C-x> <Cmd>call codeium#CycleCompletions(1)<CR>
        # previous completion
        imap <C-r> <Cmd>call codeium#CycleCompletions(-1)<CR>
        # clear suggestion
        imap <C-l> <Cmd>call codeium#Clear()<CR>
    catch
        echo 'CodeiumSetup() failed: ' .. v:exception
    endtry
enddef

CodeiumSetup()
