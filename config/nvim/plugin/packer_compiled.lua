-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/sazk/.cache/nvim/packer_hererocks/2.1.1720049189/share/lua/5.1/?.lua;/home/sazk/.cache/nvim/packer_hererocks/2.1.1720049189/share/lua/5.1/?/init.lua;/home/sazk/.cache/nvim/packer_hererocks/2.1.1720049189/lib/luarocks/rocks-5.1/?.lua;/home/sazk/.cache/nvim/packer_hererocks/2.1.1720049189/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/sazk/.cache/nvim/packer_hererocks/2.1.1720049189/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Abstract-cs"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/Abstract-cs",
    url = "https://github.com/Abstract-IDE/Abstract-cs"
  },
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19custom.comment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["Onedarker.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/Onedarker.nvim",
    url = "https://github.com/lunarvim/Onedarker.nvim"
  },
  ["apprentice.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/apprentice.nvim",
    url = "https://github.com/adisen99/apprentice.nvim"
  },
  astrotheme = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/astrotheme",
    url = "https://github.com/AstroNvim/astrotheme"
  },
  aurora = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/aurora",
    url = "https://github.com/ray-x/aurora"
  },
  ["better-escape.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25custom.better-escape\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/opt/better-escape.nvim",
    url = "https://github.com/max397574/better-escape.nvim"
  },
  ["blue-moon"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/blue-moon",
    url = "https://github.com/kyazdani42/blue-moon"
  },
  ["boo-colorscheme-nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/boo-colorscheme-nvim",
    url = "https://github.com/rockerBOO/boo-colorscheme-nvim"
  },
  ["calvera-dark.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/calvera-dark.nvim",
    url = "https://github.com/yashguptaz/calvera-dark.nvim"
  },
  catppuccin = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["citruszest.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/citruszest.nvim",
    url = "https://github.com/zootedb0t/citruszest.nvim"
  },
  ["cloak.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17custom.cloak\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/opt/cloak.nvim",
    url = "https://github.com/laytan/cloak.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-dap"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/cmp-dap",
    url = "https://github.com/rcarriga/cmp-dap"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["codeium.vim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19custom.codeium\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/opt/codeium.vim",
    url = "https://github.com/Exafunction/codeium.vim"
  },
  ["codeschool.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/codeschool.nvim",
    url = "https://github.com/adisen99/codeschool.nvim"
  },
  ["conform.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19custom.conform\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/opt/conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  ["cyberdream.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/cyberdream.nvim",
    url = "https://github.com/scottmckendry/cyberdream.nvim"
  },
  ["dark_flat.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/dark_flat.nvim",
    url = "https://github.com/sekke276/dark_flat.nvim"
  },
  ["doom-one.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/doom-one.nvim",
    url = "https://github.com/NTBBloodbath/doom-one.nvim"
  },
  ["dracula.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/dracula.nvim",
    url = "https://github.com/Mofiqul/dracula.nvim"
  },
  embark = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/embark",
    url = "https://github.com/embark-theme/vim"
  },
  ["eva01.vim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/eva01.vim",
    url = "https://github.com/hachy/eva01.vim"
  },
  everblush = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/everblush",
    url = "https://github.com/Everblush/nvim"
  },
  ["everforest-nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/everforest-nvim",
    url = "https://github.com/neanias/everforest-nvim"
  },
  falcon = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/falcon",
    url = "https://github.com/fenetikm/falcon"
  },
  ["fluoromachine.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/fluoromachine.nvim",
    url = "https://github.com/maxmx03/fluoromachine.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20custom.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox-baby"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/gruvbox-baby",
    url = "https://github.com/luisiacc/gruvbox-baby"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["guess-indent.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24custom.guess-indent\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/opt/guess-indent.nvim",
    url = "https://github.com/nmac427/guess-indent.nvim"
  },
  ["hybrid.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/hybrid.nvim",
    url = "https://github.com/HoNamDuong/hybrid.nvim"
  },
  ["indent-blankline.nvim"] = {
    after_files = { "/home/sazk/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim/after/plugin/commands.lua" },
    commands = { "IBLToggle" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19custom.lualine\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-nvim-dap.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/mason-nvim-dap.nvim",
    url = "https://github.com/jay-babu/mason-nvim-dap.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  ["mellifluous.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/mellifluous.nvim",
    url = "https://github.com/ramojus/mellifluous.nvim"
  },
  ["mellow.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/mellow.nvim",
    url = "https://github.com/mellow-theme/mellow.nvim"
  },
  ["midnight.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/midnight.nvim",
    url = "https://github.com/dasupradyumna/midnight.nvim"
  },
  ["minimal.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/minimal.nvim",
    url = "https://github.com/Yazeed1s/minimal.nvim"
  },
  ["modus-themes.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/modus-themes.nvim",
    url = "https://github.com/miikanissi/modus-themes.nvim"
  },
  ["monochrome.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/monochrome.nvim",
    url = "https://github.com/kdheepak/monochrome.nvim"
  },
  ["monokai-nightasty.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/monokai-nightasty.nvim",
    url = "https://github.com/polirritmico/monokai-nightasty.nvim"
  },
  ["monokai.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/monokai.nvim",
    url = "https://github.com/tanvirtin/monokai.nvim"
  },
  moonfly = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/moonfly",
    url = "https://github.com/bluz71/vim-moonfly-colors"
  },
  ["moonlight.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/moonlight.nvim",
    url = "https://github.com/shaunsingh/moonlight.nvim"
  },
  ["night-owl.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/night-owl.nvim",
    url = "https://github.com/oxfist/night-owl.nvim"
  },
  ["nightcity.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/nightcity.nvim",
    url = "https://github.com/cryptomilk/nightcity.nvim"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/gbprod/nord.nvim"
  },
  ["nordic.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/nordic.nvim",
    url = "https://github.com/AlexvZyl/nordic.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-go"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/nvim-dap-go",
    url = "https://github.com/leoluz/nvim-dap-go"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/nvim-dap-python",
    url = "https://github.com/mfussenegger/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15custom.dap\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/opt/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lint"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16custom.lint\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/opt/nvim-lint",
    url = "https://github.com/mfussenegger/nvim-lint"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-nio"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/nvim-nio",
    url = "https://github.com/nvim-neotest/nvim-nio"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20custom.surround\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/opt/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["ofirkai.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/ofirkai.nvim",
    url = "https://github.com/ofirgall/ofirkai.nvim"
  },
  ["oh-lucy.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/oh-lucy.nvim",
    url = "https://github.com/Yazeed1s/oh-lucy.nvim"
  },
  ["omni.vim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/omni.vim",
    url = "https://github.com/yonlu/omni.vim"
  },
  ["one_monokai.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/one_monokai.nvim",
    url = "https://github.com/cpea2506/one_monokai.nvim"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["onedarkpro.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/onedarkpro.nvim",
    url = "https://github.com/olimorris/onedarkpro.nvim"
  },
  ["onenord.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/onenord.nvim",
    url = "https://github.com/rmehri01/onenord.nvim"
  },
  ["oxocarbon.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/oxocarbon.nvim",
    url = "https://github.com/nyoom-engineering/oxocarbon.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["palenight.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/palenight.nvim",
    url = "https://github.com/alexmozaidze/palenight.nvim"
  },
  ["peek.nvim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16custom.peek\frequire\0" },
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/peek.nvim",
    url = "https://github.com/toppair/peek.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["poimandres.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/poimandres.nvim",
    url = "https://github.com/olivercederborg/poimandres.nvim"
  },
  ["rasmus.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/rasmus.nvim",
    url = "https://github.com/kvrohit/rasmus.nvim"
  },
  ["ronny.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/ronny.nvim",
    url = "https://github.com/judaew/ronny.nvim"
  },
  ["rose-pine"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["sherbet.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/sherbet.nvim",
    url = "https://github.com/lewpoly/sherbet.nvim"
  },
  sonokai = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/sonokai",
    url = "https://github.com/sainnhe/sonokai"
  },
  ["space-nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/space-nvim",
    url = "https://github.com/Th3Whit3Wolf/space-nvim"
  },
  ["starry.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/starry.nvim",
    url = "https://github.com/ray-x/starry.nvim"
  },
  ["substrata.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/substrata.nvim",
    url = "https://github.com/kvrohit/substrata.nvim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyodark.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/tokyodark.nvim",
    url = "https://github.com/tiagovla/tokyodark.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19custom.trouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["typescript-tools.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/typescript-tools.nvim",
    url = "https://github.com/pmizio/typescript-tools.nvim"
  },
  undotree = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20custom.undotree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20custom.fugitive\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-go"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/opt/vim-go",
    url = "https://github.com/fatih/vim-go"
  },
  ["vim-repeat"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/opt/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/vim-vinegar",
    url = "https://github.com/tpope/vim-vinegar"
  },
  vimwiki = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19custom.vimwiki\frequire\0" },
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  },
  visual_studio_code = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/visual_studio_code",
    url = "https://github.com/askfiy/visual_studio_code"
  },
  ["vn-night.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/vn-night.nvim",
    url = "https://github.com/nxvu699134/vn-night.nvim"
  },
  ["vscode.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/vscode.nvim",
    url = "https://github.com/Mofiqul/vscode.nvim"
  },
  witch = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/witch",
    url = "https://github.com/sontungexpt/witch"
  },
  ["zenbones.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/zenbones.nvim",
    url = "https://github.com/mcchrish/zenbones.nvim"
  },
  ["zenburn.nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/zenburn.nvim",
    url = "https://github.com/phha/zenburn.nvim"
  },
  ["zephyr-nvim"] = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/zephyr-nvim",
    url = "https://github.com/glepnir/zephyr-nvim"
  },
  zephyrium = {
    loaded = true,
    path = "/home/sazk/.local/share/nvim/site/pack/packer/start/zephyrium",
    url = "https://github.com/titanzero/zephyrium"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: peek.nvim
time([[Config for peek.nvim]], true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16custom.peek\frequire\0", "config", "peek.nvim")
time([[Config for peek.nvim]], false)
-- Config for: vimwiki
time([[Config for vimwiki]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19custom.vimwiki\frequire\0", "config", "vimwiki")
time([[Config for vimwiki]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd nvim-treesitter-context ]]
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'IBLToggle', function(cmdargs)
          require('packer.load')({'indent-blankline.nvim'}, { cmd = 'IBLToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'indent-blankline.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('IBLToggle ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType .env ++once lua require("packer.load")({'cloak.nvim'}, { ft = ".env" }, _G.packer_plugins)]]
vim.cmd [[au FileType glimmer ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "glimmer" }, _G.packer_plugins)]]
vim.cmd [[au FileType handlebars ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "handlebars" }, _G.packer_plugins)]]
vim.cmd [[au FileType hbs ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "hbs" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType jsx ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "jsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType php ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "php" }, _G.packer_plugins)]]
vim.cmd [[au FileType rescript ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "rescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType svelte ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "svelte" }, _G.packer_plugins)]]
vim.cmd [[au FileType tsx ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "tsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'vim-go'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType xml ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "xml" }, _G.packer_plugins)]]
vim.cmd [[au FileType astro ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "astro" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'conform.nvim'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'trouble.nvim', 'nvim-dap-ui', 'codeium.vim', 'vim-repeat', 'guess-indent.nvim', 'gitsigns.nvim', 'undotree', 'lualine.nvim', 'vim-fugitive', 'Comment.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-surround', 'better-escape.nvim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CmdLineEnter * ++once lua require("packer.load")({'nvim-surround'}, { event = "CmdLineEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertLeave * ++once lua require("packer.load")({'nvim-lint'}, { event = "InsertLeave *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/sazk/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], true)
vim.cmd [[source /home/sazk/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]]
time([[Sourcing ftdetect script at: /home/sazk/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
