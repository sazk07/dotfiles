-- local rosepine_main_ok, rosepine_main = pcall(require, "rose-pine")
-- local rosepine_moon_ok, rosepine_moon = pcall(require, "rose-pine")
-- local rosepine_dawn_ok, rosepine_dawn = pcall(require, "rose-pine")
-- local monokai_ok, monokai = pcall(require, "monokai")
-- local monokai_pro_ok, monokai_pro = pcall(require, "monokai")
-- local monokai_soda_ok, monokai_soda = pcall(require, "monokai")
-- local monokai_ristretto_ok, monokai_ristretto = pcall(require, "monokai")
-- local onedark_dark_ok, onedark_dark = pcall(require, "onedark")
-- local onedark_darker_ok, onedark_darker = pcall(require, "onedark")
-- local onedark_cool_ok, onedark_cool = pcall(require, "onedark")
-- local onedark_deep_ok, onedark_deep = pcall(require, "onedark")
-- local onedark_warm_ok, onedark_warm = pcall(require, "onedark")
-- local onedark_warmer_ok, onedark_warmer = pcall(require, "onedark")
-- local onedark_light_ok, onedark_light = pcall(require, "onedark")
-- local catppuccin_mocha_ok, catppuccin_mocha = pcall(require, "catppuccin")
-- local catppuccin_frappe_ok, catppuccin_frappe = pcall(require, "catppuccin")
-- local catppuccin_macchiato_ok, catppuccin_macchiato = pcall(require, "catppuccin")
-- local catppuccin_latte_ok, catppuccin_latte = pcall(require, "catppuccin")
-- local gruvbox_ok, gruvbox = pcall(require, "gruvbox")
-- local onenord_ok, onenord = pcall(require, "onenord")
-- local nordic_ok, nordic = pcall(require, "nordic")
-- local kanagawa_wave_ok, kanagawa_wave = pcall(require, "kanagawa")
-- local kanagawa_dragon_ok, kanagawa_dragon = pcall(require, "kanagawa")
-- local kanagawa_lotus_ok, kanagawa_lotus = pcall(require, "kanagawa")
-- local oxocarbon_ok, oxocarbon = pcall(require, "oxocarbon")
-- local everblush_ok, everblush = pcall(require, "everblush")
-- local onedarker_ok, onedarker = pcall(require, "onedarker")
-- local nord_ok, nord = pcall(require, "nord")
-- local everforest_medium_ok, everforest_medium = pcall(require, "everforest")
-- local everforest_soft_ok, everforest_soft = pcall(require, "everforest")
-- local everforest_hard_ok, everforest_hard = pcall(require, "everforest")
-- local eva01_ok, eva01 = pcall(require, "eva01")
-- local eva01_lcl_ok, eva01_lcl = pcall(require, "eva01")
-- local astrotheme_ok, astrotheme = pcall(require, "astrotheme")
-- local dracula_ok, dracula = pcall(require, "dracula")
-- local dracula_soft_ok, dracula_soft = pcall(require, "dracula")
-- local nightfox_nf_ok, nightfox_nf = pcall(require, "nightfox")
-- local nightfox_cf_ok, nightfox_cf = pcall(require, "nightfox")
-- local nightfox_nord_ok, nightfox_nord = pcall(require, "nightfox")
-- local nightfox_dusk_ok, nightfox_dusk = pcall(require, "nightfox")
-- local fluoromachine_ok, fluoromachine = pcall(require, "fluoromachine")
-- local tokyonight_night_ok, tokyonight_night = pcall(require, "tokyonight")
-- local tokyonight_storm_ok, tokyonight_storm = pcall(require, "tokyonight")
-- local tokyonight_moon_ok, tokyonight_moon = pcall(require, "tokyonight")
-- local tokyonight_day_ok, tokyonight_day = pcall(require, "tokyonight")
-- local embark_ok, embark = pcall(require, "embark")

if not rosepine_main_ok then
  rosepine_main = nil
end
if rosepine_main then
  rosepine_main.setup({
    variant = "main",
  })
  vim.cmd.colorscheme("rose-pine")
end

if not rosepine_moon_ok then
  rosepine_moon = nil
end
if rosepine_moon then
  rosepine_moon.setup({
    variant = "moon",
  })
  vim.cmd.colorscheme("rose-pine")
end

if not rosepine_dawn_ok then
  rosepine_dawn = nil
end
if rosepine_dawn then
  rosepine_dawn.setup({
    variant = "dawn",
  })
  vim.cmd.colorscheme("rose-pine")
end

if not monokai_ok then
  monokai = nil
end
if monokai then
  monokai.setup()
end

if not monokai_pro_ok then
  monokai_pro = nil
end
if monokai_pro then
  monokai_pro.setup({ palette = monokai_pro.pro })
end

if not monokai_soda_ok then
  monokai_soda = nil
end
if monokai_soda then
  monokai_soda.setup({ palette = monokai_soda.soda })
end

if not monokai_ristretto_ok then
  monokai_ristretto = nil
end
if monokai_ristretto then
  monokai_ristretto.setup({ palette = monokai_ristretto.ristretto })
end

if not onedark_dark_ok then
  onedark_dark = nil
end
if onedark_dark then
  onedark_dark.setup({ style = "dark" })
  onedark_dark.load()
end

if not onedark_darker_ok then
  onedark_darker = nil
end
if onedark_darker then
  onedark_darker.setup({ style = "darker" })
  onedark_darker.load()
end

if not onedark_cool_ok then
  onedark_cool = nil
end
if onedark_cool then
  onedark_cool.setup({ style = "cool" })
  onedark_cool.load()
end

if not onedark_deep_ok then
  onedark_deep = nil
end
if onedark_deep then
  onedark_deep.setup({ style = "deep" })
  onedark_deep.load()
end

if not onedark_warm_ok then
  onedark_warm = nil
end
if onedark_warm then
  onedark_warm.setup({ style = "warm" })
  onedark_warm.load()
end

if not onedark_warmer_ok then
  onedark_warmer = nil
end
if onedark_warmer then
  onedark_warmer.setup({ style = "warmer" })
  onedark_warmer.load()
end

if not onedark_light_ok then
  onedark_light = nil
end
if onedark_light then
  onedark_light.setup({ style = "light" })
  onedark_light.load()
end

if not catppuccin_mocha_ok then
  catppuccin_mocha = nil
end
if catppuccin_mocha then
  catppuccin_mocha.setup({ flavour = "mocha" })
  vim.cmd.colorscheme("catppuccin")
end

if not catppuccin_frappe_ok then
  catppuccin_frappe = nil
end
if catppuccin_frappe then
  catppuccin_frappe.setup({ flavour = "frappe" })
  vim.cmd.colorscheme("catppuccin")
end

if not catppuccin_macchiato_ok then
  catppuccin_macchiato = nil
end
if catppuccin_macchiato then
  catppuccin_macchiato.setup({ flavour = "macchiato" })
  vim.cmd.colorscheme("catppuccin")
end

if not catppuccin_latte_ok then
  catppuccin_latte = nil
end
if catppuccin_latte then
  catppuccin_latte.setup({ flavour = "latte" })
  vim.cmd.colorscheme("catppuccin")
end

if not gruvbox_ok then
  gruvbox = nil
end
if gruvbox then
  gruvbox.setup({})
  vim.cmd.colorscheme("gruvbox")
end

if not onenord_ok then
  onenord = nil
end
if onenord then
  onenord.setup()
end

if not nordic_ok then
	nordic = nil
end
if nordic then
	nordic.load()
end

if not kanagawa_wave_ok then
  kanagawa_wave = nil
end
if kanagawa_wave then
  vim.cmd.colorscheme("kanagawa-wave")
end

if not kanagawa_dragon_ok then
  kanagawa_dragon = nil
end
if kanagawa_dragon then
  vim.cmd.colorscheme("kanagawa-dragon")
end

if not kanagawa_lotus_ok then
  kanagawa_lotus = nil
end
if kanagawa_lotus then
  vim.cmd.colorscheme("kanagawa-lotus")
end

if not oxocarbon_ok then
	oxocarbon = nil
end
if oxocarbon then
	vim.cmd.colorscheme("oxocarbon")
end

if not everblush_ok then
	everblush = nil
end
if everblush then
	vim.cmd.colorscheme("everblush")
end

if not onedarker_ok then
	onedarker = nil
end
if onedarker then
	vim.cmd.colorscheme("onedarker")
end

if not nord_ok then
	nord = nil
end
if nord then
	vim.cmd.colorscheme("nord")
end

if not everforest_medium_ok then
  everforest_medium = nil
end
if everforest_medium then
  everforest_medium.setup({
    background = "medium",
  })
  vim.cmd.colorscheme("everforest")
end

if not everforest_soft_ok then
  everforest_soft = nil
end
if everforest_soft then
  everforest_soft.setup({
    background = "soft",
  })
  vim.cmd.colorscheme("everforest")
end

if not everforest_hard_ok then
  everforest_hard = nil
end
if everforest_hard then
  everforest_hard.setup({
    background = "hard",
  })
  vim.cmd.colorscheme("everforest")
end

if not eva01_ok then
  eva01 = nil
end
if eva01 then
  vim.cmd.colorscheme("eva01")
end

if not eva01_lcl_ok then
  eva01_lcl = nil
end
if eva01_lcl then
  vim.cmd.colorscheme("eva01-LCL")
end

if not astrotheme_ok then
	astrotheme = nil
end
if astrotheme then
	astrotheme.setup()
	vim.cmd.colorscheme("astrodark")
end

if not dracula_ok then
	dracula = nil
end
if dracula then
	vim.cmd.colorscheme("dracula")
end

if not dracula_soft_ok then
	dracula_soft = nil
end
if dracula_soft then
	vim.cmd.colorscheme "dracula-soft"
end

if not nightfox_nf_ok then
  nightfox_nf = nil
end
if nightfox_nf then
  vim.cmd.colorscheme("nightfox")
end

if not nightfox_cf_ok then
  nightfox_cf = nil
end
if nightfox_cf then
  vim.cmd.colorscheme("carbonfox")
end

if not nightfox_nord_ok then
  nightfox_nord = nil
end
if nightfox_nord then
  vim.cmd.colorscheme("nordfox")
end

if not nightfox_dusk_ok then
  nightfox_dusk = nil
end
if nightfox_dusk then
  vim.cmd.colorscheme("duskfox")
end

if not fluoromachine_ok then
	fluoromachine = nil
end
if fluoromachine then
	vim.cmd.colorscheme("fluoromachine")
end

if not tokyonight_night_ok then
  tokyonight_night = nil
end
if tokyonight_night then
  tokyonight_night.setup({
    style = "night",
  })
  vim.cmd.colorscheme("tokyonight")
end

if not tokyonight_storm_ok then
  tokyonight_storm = nil
end
if tokyonight_storm then
  tokyonight_storm.setup({
    style = "storm",
  })
  vim.cmd.colorscheme("tokyonight")
end

if not tokyonight_moon_ok then
  tokyonight_moon = nil
end
if tokyonight_moon then
  tokyonight_moon.setup({
    style = "moon",
  })
  vim.cmd.colorscheme("tokyonight")
end

if not tokyonight_day_ok then
  tokyonight_day = nil
end
if tokyonight_day then
  tokyonight_day.setup({
    style = "day",
  })
  vim.cmd.colorscheme("tokyonight")
end

if not embark_ok then
	embark = nil
end
if embark then
	vim.cmd.colorscheme("embark")
end
