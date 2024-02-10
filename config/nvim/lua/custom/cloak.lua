local ok, cloak = pcall(require, "cloak")
if not ok then
	cloak = nil
end
if cloak then
	cloak.setup({
		enabled = true,
		cloak_character = "*",
		highlight_group = "Comment",
		patterns = {
			{
				file_pattern = {
					".env*",
					".dev.vars",
				},
				cloak_pattern = "=.+",
			},
		},
	})
end
