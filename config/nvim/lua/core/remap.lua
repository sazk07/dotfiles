vim.g.mapleader = " "
--[[ vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = "go to dir"}) ]]

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selection up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "join above to cursor with cursor in place" })
vim.keymap.set("n", "n", "nzzzv", { desc = "search next and zz" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "search prev and zz" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "paste over highlighted and preserve original yank" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "yank to global register" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "yank line to global register" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "delete to void" })

--[[ vim.keymap.set("i", "<C-c>", "<Esc>") ]]

vim.keymap.set("n", "Q", "<nop>", { desc = "disable Q" })

--[[ vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "format buffer" })
]]

vim.keymap.set("n", "<leader>ft", "<cmd>Format<CR>", { desc = "format buffer" })

vim.keymap.set("n", "<leader>kq", "<cmd>cnext<CR>zz", { desc = "forward qfixlist" })
vim.keymap.set("n", "<leader>jq", "<cmd>cprev<CR>zz", { desc = "backward qfixlist" })
vim.keymap.set("n", "<leader>kl", "<cmd>lnext<CR>zz", { desc = "forward location list" })
vim.keymap.set("n", "<leader>jl", "<cmd>lprev<CR>zz", { desc = "backward location list" })

vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "sed on word at cursor" }
)

--[[ vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "chmod +x current file" }) ]]

--[[ vim.keymap.set(
	"n",
	"<leader>/",
	'<cmd>lua require("Comment.api").toggle.linewise.current()<CR>',
	{ desc = "toggle comment out" }
)
]]

--[[ vim.keymap.set(
	"v",
	"<leader>/",
	'<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
	{ desc = "toggle comment out" }
)
]]

vim.keymap.set("n", "<leader>o", "o<Esc>0_D", { desc = "insert line below in normal mode" })
vim.keymap.set("n", "<leader>O", "O<Esc>0_D", { desc = "insert line above in normal mode" })

vim.keymap.set("n", "<leader>tk", "<C-w>t<C-w>K", { desc = "change vertical window to horizontal" })
vim.keymap.set("n", "<leader>th", "<C-w>t<C-w>H", { desc = "change horizontal window to vertical" })

vim.keymap.set("i", "jj", "<ESC>", { desc = "escape insert mode" })
vim.keymap.set("i", "jk", "<ESC>", { desc = "escape insert mode" })
