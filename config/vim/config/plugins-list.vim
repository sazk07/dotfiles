vim9script

augroup PackAddOnVimEnter
    autocmd!
    autocmd VimEnter * ++once packadd vim-devicons
    autocmd VimEnter * ++once packadd vim-airline
    autocmd VimEnter * ++once packadd vim-fugitive
    autocmd VimEnter * ++once packadd vim-repeat
    autocmd VimEnter * ++once packadd windsurf.vim
    autocmd VimEnter * ++once packadd undotree
    autocmd VimEnter * ++once packadd vim-gitgutter
    autocmd VimEnter * ++once packadd vim-sleuth
    autocmd VimEnter * ++once packadd vim-commentary
    autocmd VimEnter * ++once packadd vimwiki
    autocmd VimEnter * ++once packadd lsp
    autocmd VimEnter * ++once packadd ale
augroup END

augroup PackAddOnInsertEnter
    autocmd!
    autocmd InsertEnter * ++once packadd vim-surround
augroup END

augroup PackAddOnCmdlineEnter
    autocmd!
    autocmd CmdlineEnter * ++once packadd vim-surround
augroup END

augroup PackAddOnBufReadPost
    autocmd!
    autocmd BufReadPost * ++once packadd vim-autoformat
augroup END
