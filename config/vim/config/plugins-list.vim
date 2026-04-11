augroup PackAddOnVimEnter
    autocmd!
    autocmd VimEnter * packadd vim-devicons
    autocmd VimEnter * packadd vim-airline
    autocmd VimEnter * packadd vim-fugitive
    autocmd VimEnter * packadd vim-repeat
    autocmd VimEnter * packadd windsurf.vim
    autocmd VimEnter * packadd undotree
    autocmd VimEnter * packadd vim-gitgutter
    autocmd VimEnter * packadd vim-sleuth
    autocmd VimEnter * packadd vim-commentary
    autocmd VimEnter * packadd vimwiki
    autocmd VimEnter * ++once packadd lsp
    autocmd VimEnter * ++once packadd ale
augroup END

augroup PackAddOnInsertEnter
    autocmd!
    autocmd InsertEnter * packadd vim-surround
augroup END

augroup PackAddOnCmdlineEnter
    autocmd!
    autocmd CmdlineEnter * packadd vim-surround
augroup END

augroup PackAddOnBufReadPost
    autocmd!
    autocmd BufReadPost * packadd vim-autoformat
augroup END
