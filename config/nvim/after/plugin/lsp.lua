local ok, start = pcall(function()
	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	mason.setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})

	mason_lspconfig.setup({
		ensure_installed = {
			-- "astro",
			"bashls",
			"clangd",
			"cssls",
			"eslint",
			"emmet_ls",
			"gopls",
			"html",
			"jsonls",
			-- "ltex",
			"lua_ls",
			"neocmake",
			"pyright",
			"sqlls",
			-- "svelte",
			"tailwindcss",
			"ts_ls",
			"yamlls",
		},
	})

	vim.lsp.config("pyright", { capabilities = capabilities, filetypes = { "python" } })
	vim.lsp.enable("pyright")

	vim.lsp.config("clangd", { capabilities = capabilities, filetypes = { "c", "cpp" } })
	vim.lsp.enable("clangd")

	vim.lsp.config("gopls", {
		capabilities = capabilities,
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		settings = {
			gopls = {
				completeUnimported = true,
				usePlaceholders = true,
				staticcheck = true,
				gofumpt = true,
				analyses = {
					unusedparams = true,
				},
			},
		},
	})
	vim.lsp.enable("gopls")

	--[[ lspconfig.ltex.setup({
		capabilities = capabilities,
		filetypes = {
			"tex",
			"markdown",
			"bib",
			"gitcommit",
			"org",
			"rst",
			"rnoweb",
			"pandoc",
			"quarto",
			"rmd",
			"context",
		},
	}) ]]
	--[[ lspconfig.ltex_plus.setup({
		capabilities = capabilities,
		filetypes = {
			"tex",
			"markdown",
			"bib",
			"gitcommit",
			"org",
			"rst",
			"rnoweb",
			"pandoc",
			"quarto",
			"rmd",
			"context",
		},
	}) ]]

	vim.lsp.config("emmet_ls", {
		capabilities = vim.lsp.protocol.make_client_capabilities(),
		filetypes = {
			"css",
			"html",
			"javascript",
			"javascriptreact",
			"less",
			"sass",
			"scss",
			"typescript",
			"typescriptreact",
			"vue",
		},
		init_options = {
			html = {
				options = {
					["bem.enabled"] = true
				}
			}
		}
	})
	vim.lsp.enable("emmet_ls")

	local servers = {
		"astro",
		"bashls",
		"cssls",
		"html",
		"jsonls",
		"lua_ls",
		"neocmake",
		"prisma",
		"sqlls",
		"svelte",
		-- "ts_ls",
		"yamlls",
	}
	for _, lsp in ipairs(servers) do
		vim.lsp.config(lsp, { capabilities = capabilities })
		vim.lsp.enable(lsp)
	end

	-- setup ts_ls with vs_ls
	local vue_language_server_path = vim.fn.stdpath('data') ..
			"/mason/packages/vue-language-server/node_modules/@vue/language-server"
	local cfg = vim.lsp.config.ts_ls
	local tsserver_filetypes = (cfg and cfg.filetypes) or {}
	local vue_plugin = {
		name = "@vue/typescript-plugin",
		location = vue_language_server_path,
		languages = { "vue" },
		configNamespace = "typescript"
	}
	local ts_ls_config = {
		init_options = {
			plugins = {
				vue_plugin
			}
		},
		filetypes = tsserver_filetypes,
		table.insert(tsserver_filetypes, "vue")
	}
	local vue_ls_config = {}
	vim.lsp.config("vue_ls", vue_ls_config)
	vim.lsp.config("ts_ls", ts_ls_config)
	vim.lsp.enable({ "ts_ls", "vue_ls" })

	-- needed only if using tsserver and not typescript-tools.nvim
	-- Organize Imports function
	local function organize_imports()
		local params = {
			command = "_typescript.organizeImports",
			arguments = { vim.api.nvim_buf_get_name(0) },
		}
		vim.lsp.buf.execute_command(params)
	end

	-- add tsserver if not using typescript-tools.nvim
	local ts_servers = { "eslint", "tailwindcss" }
	for _, lsp in ipairs(ts_servers) do
		vim.lsp.config(lsp, {
			capabilities = capabilities,
			single_file_support = false,
			-- uncomment below if using tsserver
			init_options = {
				preferences = {
					disableSuggestions = true,
				}
			},
			commands = {
				OrganizeImports = {
					organize_imports,
					description = "Organize Imports",
				},
			},
		})
		vim.lsp.enable(lsp)
	end

	-- dart lsp config
	--[[ vim.lsp.config("dartls", {
		capabilities = capabilities,
		filetypes = { "dart" },
	})
	vim.lsp.enable({ "dartls" }) ]]
end)

if not ok then
	start = nil
end

if start then
	start()
end
