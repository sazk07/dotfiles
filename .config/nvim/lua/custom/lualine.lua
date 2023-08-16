local ok, lualine = pcall(require, "lualine")
if not ok then
	lualine = nil
end
if lualine then
	lualine.setup({
		options = { theme = "dracula" },
		extensions = { "trouble", "fugitive", "nvim-dap-ui", "quickfix", "toggleterm" },
	})
end
