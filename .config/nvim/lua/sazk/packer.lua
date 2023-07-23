-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  use {
	  "nvim-telescope/telescope.nvim", tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = { {"nvim-lua/plenary.nvim"} }
  }

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- themes
  use "navarasu/onedark.nvim"
  use "tanvirtin/monokai.nvim"
  use "folke/tokyonight.nvim"
  use { "catppuccin/nvim", as = "catppuccin" }
  use  "ellisonleao/gruvbox.nvim"
  use 'rmehri01/onenord.nvim'
  use 'AlexvZyl/nordic.nvim'
  use "rebelot/kanagawa.nvim"
  use 'nyoom-engineering/oxocarbon.nvim'
  use { 'Everblush/nvim', as = 'everblush' }
  use "lunarvim/Onedarker.nvim"
  use 'gbprod/nord.nvim'
  use "neanias/everforest-nvim"
  use "hachy/eva01.vim"
  use "AstroNvim/astrotheme"
  use 'Mofiqul/dracula.nvim'
  use "EdenEast/nightfox.nvim"
  use { 'embark-theme/vim', as = 'embark' }
  use 'maxmx03/fluoromachine.nvim'

  -- tools
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use "ThePrimeagen/harpoon"
  use "mbbill/undotree"
  use "tpope/vim-fugitive"
  use {
	  "VonHeikemen/lsp-zero.nvim",
	  requires = {
		  -- LSP Support
		  {"neovim/nvim-lspconfig"},
		  {"williamboman/mason.nvim"},
		  {"williamboman/mason-lspconfig.nvim"},

		  -- Autocompletion
		  {"hrsh7th/nvim-cmp"},
		  {"hrsh7th/cmp-buffer"},
		  {"hrsh7th/cmp-path"},
		  {"saadparwaiz1/cmp_luasnip"},
		  {"hrsh7th/cmp-nvim-lsp"},
		  {"hrsh7th/cmp-nvim-lua"},

		  -- Snippets
		  {"L3MON4D3/LuaSnip"},
		  {"rafamadriz/friendly-snippets"},
	  }
  }

  use {"nvim-lualine/lualine.nvim"}
  -- use 'itchyny/lightline.vim'

  use "nvim-tree/nvim-web-devicons"

  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use "mattn/emmet-vim"

  use "nvim-treesitter/nvim-treesitter-textobjects"

  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  })

  use "windwp/nvim-ts-autotag"

  use "tpope/vim-vinegar"

  use "lewis6991/gitsigns.nvim"

  use "vimwiki/vimwiki"

  use "fatih/vim-go"

  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}

  use { "jay-babu/mason-nvim-dap.nvim" }

  use {
    "numToStr/Comment.nvim",
    config = function()
        require('Comment').setup()
    end
  }

  use "christoomey/vim-tmux-navigator"

  use ({
    "folke/trouble.nvim",
    config = function ()
      require("trouble").setup {
        icons = false
      }
    end
  })

  use("laytan/cloak.nvim")

end)

