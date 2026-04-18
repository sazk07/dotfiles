vim9script

# ── Keymaps ───────────────────────────────────────────────────────────────────
# Use imap (not inoremap) so <Plug> remaps resolve correctly.
#
# Priority when Tab is pressed:
#   1. Popup visible          → move to next item
#   2. Snippet expandable     → expand it
#   3. Inside snippet tabstop → jump to next tabstop
#   4. Fallback               → literal <Tab>

imap <expr> <Tab> pumvisible() ? '<C-n>' : vsnip#expandable() ? '<Plug>(vsnip-expand)' : vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'

imap <expr> <S-Tab> pumvisible() ? '<C-p>' : vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'

# Select mode: jumping between tabstops after a snippet is expanded
smap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'

# Confirm selected completion item and close popup
inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() : '<CR>'
