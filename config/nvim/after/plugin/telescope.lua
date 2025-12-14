local ok, start = pcall(function()
	local telescope = require("telescope")
	local builtin = require("telescope.builtin")
	local telescopeConfig = require("telescope.config")

	-- Clone the default Telescope configuration
	local vimgrep_args = { unpack(telescopeConfig.values.vimgrep_arguments) }
	-- I want to search in hidden/dot files.
	table.insert(vimgrep_args, "--hidden")
	-- I don't want to search in the `.git` directory.
	table.insert(vimgrep_args, "--glob")
	table.insert(vimgrep_args, "!**/.git/*")

	telescope.setup({
		defaults = {
			vimgrep_arguments = vimgrep_args,
			preview = {
				filesize_limit = 0.1,
			},
		},
		pickers = {
			find_files = {
				find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	})

	telescope.load_extension("fzf")
	vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find files" })
	vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "live grep" })
	vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "find commands" })
	vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "find marks" })
	vim.keymap.set("n", "<leader>gdv", builtin.git_status, { desc = "git view" })
	vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "find help" })
	telescope.load_extension("http")
  telescope.load_extension("dap")
end)

if not ok then
	start = nil
end
if start then
	start()
end
