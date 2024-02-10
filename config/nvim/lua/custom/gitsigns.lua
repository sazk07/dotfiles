local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
	gitsigns = nil
end
if gitsigns then
	gitsigns.setup()
end
