--[[ vim.opt.guicursor = "" ]]

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.compatible = false

vim.api.nvim_exec2("set mps +=<:>", { output = false })

vim.opt.hidden = false

vim.opt.winborder = "rounded"

--------------------------------------------------------------------------
-- Highlight on yank
vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    group = "YankHighlight",
    callback = function()
        vim.hl.on_yank({
            higroup = "IncSearch",
            timeout = "300",
        })
    end,
})

--------------------------------------------------------------------------
-- Remove whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "",
    command = ":%s/\\s\\+$//e",
})

--------------------------------------------------------------------------
-- Don't auto commenting new lines
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '',
    command = 'set fo-=c fo-=r fo-=o'
})

--------------------------------------------------------------------------
-- Disable line length marker
vim.api.nvim_create_augroup("setLineLength", { clear = true })
vim.api.nvim_create_autocmd("Filetype", {
    group = "setLineLength",
    pattern = { "text", "markdown", "html", "xhtml" },
    command = "setlocal cc=0",
})

--------------------------------------------------------------------------
-- Set indentation to 4 spaces
vim.api.nvim_create_augroup("setIndent", { clear = true })
vim.api.nvim_create_autocmd("Filetype", {
    group = "setIndent",
    pattern = { "python", "rust", "go", "nim" },
    command = "setlocal shiftwidth=4 tabstop=4 softtabstop=4 smartindent expandtab",
})

--------------------------------------------------------------------------
-- Terminal settings:

-- Open a Terminal on the right tab
vim.api.nvim_create_autocmd("CmdlineEnter", {
    command = "command! Term :botright split term://$SHELL",
})

-- Enter insert mode when switching to terminal
vim.api.nvim_create_autocmd("TermOpen", {
    command = "setlocal listchars= nonumber norelativenumber nocursorline",
})

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "",
    command = "startinsert",
})

-- Close terminal buffer on process exit
vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "term://*",
    command = "stopinsert",
})

--------------------------------------------------------------------------
-- codium custom keybindings
vim.g.codeium_disable_bindings = 1

--------------------------------------------------------------------------
-- fatih/vim-go settings
vim.g.go_def_mode = "gopls"
vim.g.go_info_mode = "gopls"

--------------------------------------------------------------------------
-- Register markdown as the parser for vimwiki files
vim.treesitter.language.register("markdown", "vimwiki")

--------------------------------------------------------------------------
-- AutoFormat on save settings:
-- toggle autoformat on save
vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
    else
        vim.g.disable_autoformat = true
    end
end, {
    desc = "Disable autoformat-on-save",
    bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
end, {
    desc = "Re-enable autoformat-on-save",
})

-- Disable autoformat on save
vim.g.disable_autoformat = true
