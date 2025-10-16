vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({
				with_sync = true,
			})
			ts_update()
		end,
		requires = {
			{ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
			{ "nvim-treesitter/nvim-treesitter-context",     after = "nvim-treesitter" },
		},
	})

	-- Telescope
	use({
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.8",
			-- or                            , branch = '0.1.x',
			requires = {
				"nvim-lua/plenary.nvim",
			},
		},
		{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		"nvim-telescope/telescope-dap.nvim",
	})

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
	})

	--[[ use({
		"sazk07/typescript-tools.nvim",
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	}) ]]


	-- Completion snippets
	use({
		{
			"hrsh7th/nvim-cmp",
			requires = {
				"rcarriga/cmp-dap",
				"windwp/nvim-autopairs",
				{
					"windwp/nvim-ts-autotag",
					ft = {
						"astro",
						"glimmer",
						"handlebars",
						"hbs",
						"html",
						"javascript",
						"javascriptreact",
						"jsx",
						"markdown",
						"php",
						"rescript",
						"svelte",
						"tsx",
						"typescript",
						"typescriptreact",
						"vue",
						"xml",
					},
				},
			},
		},
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"petertriho/cmp-git",
		{
			"L3MON4D3/LuaSnip",
			tag = "v2.*",
			run = "make install_jsregexp",
		},
		"rafamadriz/friendly-snippets",
	})

	-- Linter
	use({
		"mfussenegger/nvim-lint",
		event = { "InsertLeave" },
		config = function()
			require("custom.lint")
		end,
	})

	-- Formatter
	use({
		"stevearc/conform.nvim",
		event = { "BufReadPost" },
		config = function()
			require("custom.conform")
		end,
	})

	-- DAP
	use({
		"rcarriga/nvim-dap-ui",
		requires = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
			"jay-babu/mason-nvim-dap.nvim",
			"mfussenegger/nvim-dap-python", -- requires debugpy from Mason
			"leoluz/nvim-dap-go",        -- requires delve from Mason
			"rcarriga/cmp-dap",
		},
		event = { "VimEnter" },
		config = function()
			require("custom.dap")
		end,
	})

	-- Others

	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = { "InsertEnter", "CmdLineEnter" },
		config = function()
			require("custom.surround")
		end,
	})

	use({
		"mbbill/undotree",
		event = "VimEnter",
		config = function()
			require("custom.undotree")
		end,
	})

	use({
		{
			"tpope/vim-fugitive",
			event = "VimEnter",
			config = function()
				require("custom.fugitive")
			end,
		},
		{
			"tpope/vim-vinegar",
		},
	})

	use({
		"lewis6991/gitsigns.nvim",
		event = "VimEnter",
		config = function()
			require("custom.gitsigns")
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		config = function()
			require("custom.lualine")
		end,
	})
	--[[ 	use 'itchyny/lightline.vim' ]]

	use("nvim-tree/nvim-web-devicons")

	use({
		"vimwiki/vimwiki",
		config = function()
			require("custom.vimwiki")
		end,
	})

	use({
		"fatih/vim-go",
		ft = "go",
		run = ":GoUpdateBinaries",
	})

	use({
		"numToStr/Comment.nvim",
		event = "VimEnter",
		config = function()
			require("custom.comment")
		end,
	})

	use({ "christoomey/vim-tmux-navigator" })

	use({
		"folke/trouble.nvim",
		event = "VimEnter",
		config = function()
			require("custom.trouble")
		end,
	})

	use({
		"laytan/cloak.nvim",
		ft = ".env",
		config = function()
			require("custom.cloak")
		end,
	})

	--[[ use({
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("custom.better-escape")
		end,
	}) ]]

	use({
		"Exafunction/codeium.vim",
		event = "VimEnter",
		config = function()
			require("custom.codeium")
		end,
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		cmd = "IBLToggle",
	})

	use({
		"tpope/vim-repeat",
		event = "VimEnter",
	})

	use({
		"nmac427/guess-indent.nvim",
		event = "VimEnter",
		config = function()
			require("custom.guess-indent")
		end,
	})

	--[[ use({
		"kosayoda/nvim-lightbulb",
		event = "BufReadPost",
		config = function()
			require("custom.nvim-lightbulb")
		end,
	}) ]]

	use({
		"sazk07/peek.nvim",
		run = "deno task --quiet build:fast",
		config = function()
			require("custom.peek")
		end,
	})

	--[[ use({
		"MeanderingProgrammer/render-markdown.nvim",
		after={"nvim-treesitter"},
		config = function()
			require("custom.render-markdown")
		end,
	}) ]]

	--[[ 	use ({ "ThePrimeagen/harpoon" }) ]]

	--[[ 	use({ "ray-x/lsp_signature.nvim", }) ]]

	use({
		"nvim-flutter/flutter-tools.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("custom.flutter")
		end,
	})

	--[[ use({
		"dart-lang/dart-vim-plugin",
		config = function()
			require("custom.dart")
		end,
	}) ]]

	-- Themes
	use({
		{ "navarasu/onedark.nvim" },
		"tanvirtin/monokai.nvim",
		"folke/tokyonight.nvim",
		{ "catppuccin/nvim",      as = "catppuccin" },
		"ellisonleao/gruvbox.nvim",
		"rmehri01/onenord.nvim",
		"AlexvZyl/nordic.nvim",
		"rebelot/kanagawa.nvim",
		"nyoom-engineering/oxocarbon.nvim",
		{ "Everblush/nvim",   as = "everblush" },
		"lunarvim/Onedarker.nvim",
		"gbprod/nord.nvim",
		"neanias/everforest-nvim",
		"hachy/eva01.vim",
		"AstroNvim/astrotheme",
		"Mofiqul/dracula.nvim",
		"EdenEast/nightfox.nvim",
		{ "embark-theme/vim", as = "embark" },
		"maxmx03/fluoromachine.nvim",
		"sontungexpt/witch",
		"Abstract-IDE/Abstract-cs",
		"Mofiqul/vscode.nvim",
		"askfiy/visual_studio_code",
		"marko-cerovac/material.nvim",
		{ "bluz71/vim-moonfly-colors", as = "moonfly" },
		"sainnhe/sonokai",
		"kyazdani42/blue-moon",
		"glepnir/zephyr-nvim",
		"rockerBOO/boo-colorscheme-nvim",
		"Th3Whit3Wolf/space-nvim",
		"yonlu/omni.vim",
		"ray-x/aurora",
		"ray-x/starry.nvim",
		"ofirgall/ofirkai.nvim",
		"fenetikm/falcon",
		"shaunsingh/moonlight.nvim",
		"NTBBloodbath/doom-one.nvim",
		"yashguptaz/calvera-dark.nvim",
		"nxvu699134/vn-night.nvim",
		{ "adisen99/codeschool.nvim",  requires = { "rktjmp/lush.nvim" } },
		"kdheepak/monochrome.nvim",
		{ "rose-pine/neovim", as = "rose-pine" },
		"mcchrish/zenbones.nvim",
		"kvrohit/substrata.nvim",
		"adisen99/apprentice.nvim",
		"olimorris/onedarkpro.nvim",
		"luisiacc/gruvbox-baby",
		"titanzero/zephyrium",
		"tiagovla/tokyodark.nvim",
		"cpea2506/one_monokai.nvim",
		"phha/zenburn.nvim",
		"kvrohit/rasmus.nvim",
		"ramojus/mellifluous.nvim",
		"lewpoly/sherbet.nvim",
		"olivercederborg/poimandres.nvim",
		"mellow-theme/mellow.nvim",
		"dasupradyumna/midnight.nvim",
		"sekke276/dark_flat.nvim",
		"zootedb0t/citruszest.nvim",
		"judaew/ronny.nvim",
		"cryptomilk/nightcity.nvim",
		"polirritmico/monokai-nightasty.nvim",
		"oxfist/night-owl.nvim",
		"miikanissi/modus-themes.nvim",
		"alexmozaidze/palenight.nvim",
		"scottmckendry/cyberdream.nvim",
		"HoNamDuong/hybrid.nvim",
	})
end)
