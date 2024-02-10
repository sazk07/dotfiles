local leap_ok, leap = pcall(require, "leap")
local flit_ok, flit = pcall(require, "flit")

if not leap_ok then
  leap = nil
end

if not flit_ok then
  flit = nil
end

if leap then
	vim.keymap.set({ "n", "o" }, "S", "<Plug>(leap-backward)")
	vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
	vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")
end

if flit then
	flit.setup()
end
