function! VimwikiSetup() abort
    try
        " Use Markdown syntax for vimwiki files
        let g:vimwiki_list = [{
        \   'path': '~/Documents/unodrive/vimwiki/',
        \   'syntax': 'markdown', 'ext': 'md'
        \}]
        let g:vimwiki_global_ext = 0
        let g:vimwiki_ext2syntax = {}
    catch
        echo "VimwikiSetup failed: " . v:exception
    endtry
endfunction
call VimwikiSetup()
