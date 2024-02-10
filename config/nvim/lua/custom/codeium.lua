local ok, start = pcall(function ()
	vim.keymap.set("i", "<C-a>", function()
		return vim.fn["codeium#Accept"]()
	end, {
		expr = true,
		silent = true,
		desc = "Codeium accept",
	})
	vim.keymap.set("i", "<c-x>", function()
		return vim.fn["codeium#CycleCompletions"](1)
	end, {
		expr = true,
		silent = true,
		desc = "Codeium next",
	})
	vim.keymap.set("i", "<c-r>", function()
		return vim.fn["codeium#CycleCompletions"](-1)
	end, {
		expr = true,
		silent = true,
		desc = "Codeium previous",
	})
	vim.keymap.set("i", "<c-l>", function()
		return vim.fn["codeium#Clear"]()
	end, {
		expr = true,
		silent = true,
		desc = "Codeium clear",
	})
end)

if not ok then
	start = nil
end
if start then
  start()
end
