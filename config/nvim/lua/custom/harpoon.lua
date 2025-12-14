local ok, start = pcall(function()
  local mark = require("harpoon.mark")
  local ui = require("harpoon.ui")
  vim.keymap.set("n", "<leader>a", mark.add_file)
  vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
  vim.keymap.set("n", "<leader>p!", function() ui.nav_file(1) end)
  vim.keymap.set("n", "<leader>p@", function() ui.nav_file(2) end)
  vim.keymap.set("n", "<leader>p#", function() ui.nav_file(3) end)
  vim.keymap.set("n", "<leader>p-", function() ui.nav_file(4) end)
end)
if not ok then start = nil end
if start then
  start()
end
--------------------------------------------------------------------------
