vim9script

g:mkdp_browser = 'brave'
g:mkdp_auto_close = 0
g:mkdp_combine_preview = 1

def PeekOpen()
    try
        if !get(b:, 'MarkdownPreviewToggleBool')
            system('i3-msg split horizontal')
            mkdp#util#open_preview_page()
            b:MarkdownPreviewToggleBool = 1
        endif
    catch
        echoerr v:exception
    endtry
enddef

def PeekClose()
    try
        mkdp#util#stop_preview()
        system('i3-msg move left')
    catch
        echoerr v:exception
    endtry
enddef

def PeekToggle()
    if !get(b:, 'MarkdownPreviewToggleBool')
        PeekOpen()
        b:MarkdownPreviewToggleBool = 1
    else
        PeekClose()
        b:MarkdownPreviewToggleBool = 0
    endif
enddef

augroup MarkDownPreviewInit
    autocmd!
    command! -buffer PeekOpen PeekOpen()
    command! -buffer PeekClose PeekClose()
    command! -buffer PeekToggle PeekToggle()
augroup END
