vim9script

def VimwikiSetup(): void
    try
        # Use Markdown syntax for vimwiki files
        g:vimwiki_list = [{
            path: '$HOME/Documents/unodrive/vimwiki/',
            syntax: 'markdown',
            ext: 'md'
        }]
        g:vimwiki_global_ext = 0
        g:vimwiki_ext2syntax = {}
    catch
        echo "VimwikiSetup failed: " .. v:exception
    endtry
enddef

VimwikiSetup()
