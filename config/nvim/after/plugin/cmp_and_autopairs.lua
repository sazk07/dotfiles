local ok, start = pcall(function()
	require("nvim-autopairs").setup()
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	local cmp = require("cmp")
	local lemonade_luasnip = require("luasnip")

	require("luasnip.loaders.from_vscode").lazy_load()

	-- NOTE_SELF: should only work for vue but comment out if disrupts javascript
	lemonade_luasnip.filetype_extend("vue", {
		"vue",
		"html",
		"javascript",
		"nuxt_html",
		"nuxt_js_ts",
	})

	-- cmp config
	-- check for has words before
	local has_words_before = function()
		unpack = unpack or table.unpack
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	local default_cmp_sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "nvim_lua" },
	})

	vim.api.nvim_create_autocmd("BufReadPre", {
		callback = function(t)
			local sources = default_cmp_sources
			cmp.setup.buffer({
				snippet = {
					expand = function(args)
						lemonade_luasnip.lsp_expand(args.body)
					end,
				},
				enabled = function()
					return vim.api.nvim_get_option_value("buftype", {
						buf = 0,
					}) ~= "prompt" or require("cmp_dap").is_dap_buffer()
				end,
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif lemonade_luasnip.expand_or_jumpable() then
							lemonade_luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-p>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif lemonade_luasnip.jumpable(-1) then
							lemonade_luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-s>"] = cmp.mapping.complete(),
					["<C-b>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping({
						i = function(fallback)
							if cmp.visible() and cmp.get_active_entry() then
								cmp.confirm({
									behavior = cmp.ConfirmBehavior.Replace,
									select = false,
								})
							else
								fallback()
							end
						end,
						s = cmp.mapping.confirm({ select = true }),
						c = cmp.mapping.confirm({
							behavior = cmp.ConfirmBehavior.Replace,
							select = true,
						}),
					}),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if #cmp.get_entries() == 1 then
								cmp.confirm({ select = true })
							else
								cmp.select_next_item()
							end
						elseif lemonade_luasnip.expand_or_jumpable() then
							lemonade_luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = sources,
			})
		end,
	})

	-- Set configuration for specific filetypes.
	cmp.setup.filetype("gitcommit", {
		sources = cmp.config.sources({
			{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
		}, {
				{ name = "buffer" },
			}),
	})
	require("cmp_git").setup()

	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{
				name = "cmdline",
				option = {
					ignore_cmds = { "Man", "!" },
				},
			},
		}),
	})

	-- cmp DAP
	cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
		sources = {
			{ name = "dap" },
		},
	})

	-- auto paren on cmp selection
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

	-- Global mappings.
	vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, {
		desc = "show diagnostics in floating window",
	})
	vim.keymap.set("n", "[d", vim.diagnostic.goto_next, {
		desc = "diagnostic goto next",
	})
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, {
		desc = "diagnostic goto prev",
	})
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {
		desc = "diagnostic setloclist",
	})

	-- Use LspAttach autocommand to only map the following keys
	-- after the language server attaches to the current buffer
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			-- Enable completion triggered by <c-x><c-o>
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
			-- Buffer local mappings.
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
				buffer = ev.buf,
				desc = "go to definition",
			})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
				buffer = ev.buf,
				desc = "go to declaration",
			})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
				buffer = ev.buf,
				desc = "go to implementation",
			})
			vim.keymap.set("n", "go", vim.lsp.buf.type_definition, {
				buffer = ev.buf,
				desc = "go to type definition",
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {
				buffer = ev.buf,
				desc = "open hover",
			})
			vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, {
				buffer = ev.buf,
				desc = "list all symbols in current workspace in the quickfix window",
			})
			vim.keymap.set("n", "<leader>vwa", vim.lsp.buf.add_workspace_folder, {
				buffer = ev.buf,
				desc = "Add dir at path to workspace dir",
			})
			vim.keymap.set("n", "<leader>vwr", vim.lsp.buf.remove_workspace_folder, {
				buffer = ev.buf,
				desc = "remove dir at path from workspace dir",
			})
			vim.keymap.set("n", "<leader>vwl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, {
				buffer = ev.buf,
				desc = "list workspace directories",
			})
			vim.keymap.set(
				{
					"n",
					"v",
				},
				"<leader>vca",
				vim.lsp.buf.code_action,
				{
					buffer = ev.buf,
					desc = "variable code action",
				}
			)
			vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, {
				buffer = ev.buf,
				desc = "variable references",
			})
			vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, {
				buffer = ev.buf,
				desc = "variable rename",
			})
			vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {
				buffer = ev.buf,
				desc = "signature help",
			})
		end,
	})
	vim.diagnostic.config({
		virtual_text = false,
	})
end)

if not ok then
	start = nil
end
if start then
	start()
end
