local ok, start = pcall(function()
	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")
	local lspconfig = require("lspconfig")
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
			"astro",
			"bashls",
			"clangd",
			"cssls",
			"eslint",
			"emmet_ls",
			"gopls",
			"html",
			"htmx",
			"jsonls",
			"ltex",
			"lua_ls",
			"neocmake",
			"pyright",
			"sqlls",
			"svelte",
			"tailwindcss",
			"volar",
			"yamlls",
		},
	})
	mason_lspconfig.setup_handlers({
		["eslint"] = function()
			require("typescript-tools").setup({
				expose_as_code_action = { "organize_imports" },
			})
		end,
	})

	lspconfig.pyright.setup({
		capabilities = capabilities,
		filetypes = { "python" },
	})
	lspconfig.clangd.setup({
		capabilities = capabilities,
		filetypes = { "cpp", "c" },
	})
	lspconfig.gopls.setup({
		capabilities = capabilities,
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
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

	local servers = {
		"astro",
		"bashls",
		"cssls",
		"emmet_ls",
		"html",
		"htmx",
		"jsonls",
		"ltex",
		"lua_ls",
		"neocmake",
		"sqlls",
		"svelte",
		"volar",
		"yamlls",
	}
	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup({
			capabilities = capabilities,
		})
	end

	-- needed only if using tsserver and not typescript-tools.nvim
	-- Organize Imports function
	-- local function organize_imports()
	-- 	local params = {
	-- 		command = "_typescript.organizeImports",
	-- 		arguments = { vim.api.nvim_buf_get_name(0) },
	-- 	}
	-- 	vim.lsp.buf.execute_command(params)
	-- end

	-- add tsserver if not using typescript-tools.nvim
	-- local ts_servers = {"eslint", "tailwindcss"}
	-- for _, lsp in ipairs(ts_servers) do
	--   lspconfig[lsp].setup({
	--     capabilities = capabilities,
	--   root_dir = nvim_lsp.util.root_pattern("package.json"),
	--   single_file_support = false
	-- uncomment below if using tsserver
	-- init_options = {
	-- preferences = {
	-- disableSuggestions = true,
	-- }
	-- },
	-- commands = {
	-- OrganizeImports = {
	-- organize_imports,
	-- description = "Organize Imports",
	-- },
	-- },
	--   })
	-- end
end)

if not ok then
	start = nil
end

if start then
	start()
end
