local ok, lightbulb = pcall(require, "nvim-lightbulb")
if not ok then
	lightbulb = nil
end
if lightbulb then
	lightbulb.setup({
		autocmd = {
			enabled = true,
		},
	})
end
