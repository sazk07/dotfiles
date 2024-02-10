local ok, trouble = pcall(require, "trouble")
if not ok then
	trouble = nil
end
if trouble then
	trouble.setup()
	vim.keymap.set("n", "<leader>xx", function()
		trouble.toggle()
	end, { desc = "toggle trouble" })
	vim.keymap.set("n", "<leader>xw", function()
		trouble.toggle("workspace_diagnostics")
	end, { desc = "trouble workspace diagnostics" })
	vim.keymap.set("n", "<leader>xd", function()
		trouble.toggle("document_diagnostics")
	end, { desc = "trouble document diagnostics" })
	vim.keymap.set("n", "<leader>xl", function()
		trouble.toggle("loclist")
	end, { desc = "trouble loclist" })
	vim.keymap.set("n", "gR", function()
		trouble.toggle("lsp_references")
	end, { desc = "lsp references" })
	vim.keymap.set("n", "<leader>xq", function()
		trouble.toggle("quickfix")
	end, { desc = "quickfix" })
end
