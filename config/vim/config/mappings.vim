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
# bind :find command to <leader>ff
nnoremap <leader>ff :Files<Space>.<CR>
# bind <leader>fg to :vimgrep
nnoremap <leader>fg :Rg<Space>
