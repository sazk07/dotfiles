vim9script

# Leader key
g:mapleader = " "
# move selection up
vmap <silent> J :m '>+1<CR>gv=gv
# move selection down
vmap <silent> K :m '<-2<CR>gv=gv
# join above to cursor with cursor in place"
nnoremap <silent> J mzJ`z
# search next and zz"
nnoremap <silent> n nzzzv
# search prev and zz"
nnoremap <silent> N Nzzzv
# paste over highlighted and preserve original yank"
xnoremap <silent> <leader>p "_dP
# yank to global register"
nnoremap <silent> <leader>y "+y
vnoremap <silent> <leader>y "+y
# yank line to global register"
nnoremap <silent> <leader>Y "+Y
# delete to void"
nnoremap <silent> <leader>d "_d
vnoremap <silent> <leader>d "_d
# disable Q"
nnoremap <silent> Q <nop>
# format buffer"
nnoremap <silent> <leader>ft <Cmd>ALEFix<CR>
# forward qfixlist"
nnoremap <silent> <leader>kq :cnext<CR>zz
# backward qfixlist"
nnoremap <silent> <leader>jq :cprev<CR>zz
# forward location list"
nnoremap <silent> <leader>kl :lnext<CR>zz
# backward location list"
nnoremap <silent> <leader>jl :lprev<CR>zz
# sed on word at cursor"
nnoremap <silent> <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
# insert line below in normal mode"
nnoremap <silent> <leader>o o<Esc>0_D
# insert line above in normal mode"
nnoremap <silent> <leader>O O<Esc>0_D
# change vertical window to horizontal"
nnoremap <silent> <leader>tk <C-w>t<C-w>K
# change horizontal window to vertical"
nnoremap <silent> <leader>th <C-w>t<C-w>H
# escape insert mode"
inoremap <silent> jj <Esc>
# escape insert mode"
inoremap <silent> jk <Esc>
# bind fzf command to <leader>ff
nnoremap <leader>ff :Files<Space>.<CR>
# bind <leader>fg to :Rg
nnoremap <leader>fg :Rg<Space>

# vim-fugitive keymaps
nnoremap <silent> <leader>gs <Cmd>Git<CR>

# codeium keymaps
imap <script><silent><nowait><expr> <C-a>c codeium#Accept()
# next completion
imap <C-x>c <Cmd>call codeium#CycleCompletions(1)<CR>
# previous completion
imap <C-r>c <Cmd>call codeium#CycleCompletions(-1)<CR>
# clear suggestion
imap <C-l>c <Cmd>call codeium#Clear()<CR>

# undotree keymaps
nnoremap <silent> <leader>u <Cmd>UndotreeToggle<CR>

# vsnip keymaps
# Expand
imap <expr> <C-j> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'
smap <expr> <C-j> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'

# Expand or jump
imap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

# Jump forward or backward
imap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
smap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'

# Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
# See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap <leader>v <Plug>(vsnip-select-text)
xmap <leader>v <Plug>(vsnip-select-text)
nmap <leader>x <Plug>(vsnip-cut-text)
xmap <leader>x <Plug>(vsnip-cut-text)

# lsp keymaps
nnoremap <silent> gd <Cmd>LspGotoDefinition<CR>
nnoremap <silent> gD <Cmd>LspGotoDeclaration<CR>
nnoremap <silent> gi <Cmd>LspGotoImpl<CR>
nnoremap <silent> gy <Cmd>LspGotoTypeDef<CR>
nnoremap <silent> <leader>vrr <Cmd>LspShowReferences<CR>
# Hover / Signature
nnoremap <silent> K <Cmd>LspHover<CR>
inoremap <silent> <C-h> <Cmd>LspShowSignature<CR>
# Diagnostics
nnoremap <silent> [d <Cmd>LspDiagPrev<CR>
nnoremap <silent> ]d <Cmd>LspDiagNext<CR>
nnoremap <silent> <leader>q <Cmd>LspDiagShow<CR>
nnoremap <silent> <leader>vd <Cmd>LspDiagHere<CR>
# Refactoring
nnoremap <silent> <leader>vrn <Cmd>LspRename<CR>
nnoremap <silent> <leader>vca <Cmd>LspCodeAction<CR>
vnoremap <silent> <leader>vca <Cmd>LspCodeAction<CR>
# Formatting
# nnoremap <silent> <leader>f <Cmd>LspFormat<CR>
# vnoremap <silent> <leader>f <Cmd>LspFormat<CR>
# Outline / Symbols
nnoremap <silent> <leader>vso <Cmd>LspOutline<CR>
nnoremap <silent> <leader>vws <Cmd>LspSymbolSearch<CR>
# Workspace dir
nnoremap <silent> <leader>vwa <Cmd>LspWorkspaceAddFolder<CR>
nnoremap <silent> <leader>vwr <Cmd>LspWorkspaceRemoveFolder %:p:h<CR>
nnoremap <silent> <leader>vwl <Cmd>LspWorkspaceListFolders %:p:h<CR>
