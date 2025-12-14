local ok, bigfile = pcall(require, "bigfile")
if not ok then
	bigfile = nil
end
if bigfile then
	bigfile.setup({
		features = { -- features to disable
			"indent_blankline",
			"illuminate",
			"lsp",
			"treesitter",
			"syntax",
			"vimopts",
			"filetype",
		},
	})
end
