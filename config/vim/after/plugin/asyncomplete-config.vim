vim9script

def RegisterSources(): void
    asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
        name: 'omni',
        allowlist: ['*'],
        completor: function('asyncomplete#sources#omni#completor')
    }))
    asyncomplete#register_source(asyncomplete#sources#vsnip#get_source_options({
        name: 'vsnip',
        allowlist: ['*'],
        completor: function('asyncomplete#sources#vsnip#completor')
    }))
enddef

augroup AsyncompleteSources
    autocmd!
    autocmd User asyncomplete_setup RegisterSources()
augroup END

