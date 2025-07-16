local ok, peek = pcall(require, "peek")
if not ok then
	peek = nil
end
if peek then
	peek.setup({
		app = "browser",
		filetype = {
			"markdown",
			"vimwiki",
			"wiki",
			"markdown.pandoc",
			"markdown.gfm",
			"telekasten"
		},
	})

	vim.api.nvim_create_user_command("PeekOpen", function()
		local ft = vim.bo[vim.api.nvim_get_current_buf()].filetype
		if
				not peek.is_open()
				and (ft == "vimwiki" or ft == "markdown" or ft == "wiki" or ft == "markdown.pandoc" or ft == "markdown.gfm")
		then
			vim.fn.system("i3-msg split horizontal")
			peek.open()
		end
	end, {})

	vim.api.nvim_create_user_command("PeekOpenLight", function()
		peek.setup({ theme = "light" })
		local ft = vim.bo[vim.api.nvim_get_current_buf()].filetype
		if
				not peek.is_open()
				and (ft == "vimwiki" or ft == "markdown" or ft == "wiki" or ft == "markdown.pandoc" or ft == "markdown.gfm")
		then
			vim.fn.system("i3-msg split horizontal")
			peek.open()
		end
	end, {})

	vim.api.nvim_create_user_command("PeekClose", function()
		if peek.is_open() then
			peek.close()
			vim.fn.system("i3-msg move left")
		end
	end, {})
end
