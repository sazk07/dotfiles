local ok, conform = pcall(require, "conform")
if not ok then
	conform = nil
end
if conform then
	conform.setup({
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black", "ruff_format" },
			javascript = {  "prettier" },
			typescript = {  "prettier" },
			go = { "gofumpt", "goimports_reviser", "golines" },
			html = { "prettier" },
			markdown = {  "mdformat", "prettier" },
			latex = { "latexindent" },
			cpp = { "clang_format" },
			c = { "clang_format" },
			css = {  "prettier" },
			dart = { "dart_format" }
		},
		format_on_save = function(bufnr)
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			-- Disable autoformat for files in a certain path
			local bufname = vim.api.nvim_buf_get_name(bufnr)
			if bufname:match("/node_modules/") then
				return
			end
			return { timeout_ms = 500, lsp_fallback = true }
		end,
		notify_on_error = true,
		log_level = vim.log.levels.ERROR,
	})
	-- command to run async formatting
	vim.api.nvim_create_user_command("Format", function(args)
		local range = nil
		if args.count ~= -1 then
			local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
			range = {
				start = { args.line1, 0 },
				["end"] = { args.line2, end_line:len() },
			}
		end
		conform.format({ async = true, lsp_format = "fallback", range = range })
	end, { range = true })
end
