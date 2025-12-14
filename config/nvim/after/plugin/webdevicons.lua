local ok, web_dev_icons = pcall(require, "nvim-web-devicons")
if not ok then
	web_dev_icons = nil
end
if web_dev_icons then
	web_dev_icons.setup({
		color_icons = true,
		default = true,
	})
end
