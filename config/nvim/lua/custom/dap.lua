local ok, start = pcall(function()
	require("mason-nvim-dap").setup()
	require("nvim-dap-virtual-text").setup()
	local dap = require("dap")
	local dapui = require("dapui")
	local widgets = require("dap.ui.widgets")
	local py_path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
	local dappy = require("dap-python")
	local dapgo = require("dap-go")

	-- C++ configs
	dap.adapters.codelldb = {
		type = "server",
		port = "${port}",
		executable = {
			-- CHANGE THIS to your path!
			command = "/home/sazk/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb",
			args = { "--port", "${port}" },

			-- On windows you may have to uncomment this:
			-- detached = false,
		},
	}
	dap.configurations.cpp = {
		{
			name = "Launch file",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
		},
	}

	-- JS configs
	dap.adapters["pwa-node"] = {
		type = "server",
		host = "localhost",
		port = "${port}",
		executable = {
			command = "js-debug-adapter",
			-- 💀 Make sure to update this path to point to your installation
			args = {
				"/home/sazk/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
				"${port}",
			},
		},
	}

	for _, language in ipairs({ "typescript", "javascript" }) do
		dap.configurations[language] = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
				runtimeExecutable = "node",
			},
		}
	end

	-- Python setup
	dappy.setup(py_path)

	-- Go setup
	dapgo.setup()

	-- UI setup
	dapui.setup({
		icons = { expanded = "", collapsed = "", current_frame = "" },
		mappings = {
			-- Use a table to apply multiple mappings
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			edit = "e",
			repl = "r",
			toggle = "t",
		},
		-- Use this to override mappings for specific elements
		element_mappings = {
			-- Example:
			--[[ stacks = {
			  open = "<CR>",
			  expand = "o",
			} ]]
		},
		-- Expand lines larger than the window
		-- Requires >= 0.7
		expand_lines = vim.fn.has("nvim-0.7") == 1,
		-- Layouts define sections of the screen to place windows.
		-- The position can be "left", "right", "top" or "bottom".
		-- The size specifies the height/width depending on position. It can be an Int
		-- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
		-- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
		-- Elements are the elements shown in the layout (in order).
		-- Layouts are opened in order so that earlier layouts take priority in window sizing.
		layouts = {
			{
				elements = {
					-- Elements can be strings or table with id and size keys.
					{ id = "scopes", size = 0.25 },
					"breakpoints",
					"stacks",
					"watches",
				},
				size = 40, -- 40 columns
				position = "left",
			},
			{
				elements = {
					"repl",
					"console",
				},
				size = 0.25, -- 25% of total lines
				position = "bottom",
			},
		},
		controls = {
			-- Requires Neovim nightly (or 0.8 when released)
			enabled = true,
			-- Display controls in this element
			element = "repl",
			icons = {
				pause = "",
				play = "",
				step_into = "",
				step_over = "",
				step_out = "",
				step_back = "",
				run_last = "",
				terminate = "",
			},
		},
		floating = {
			max_height = nil, -- These can be integers or a float between 0 and 1.
			max_width = nil, -- Floats will be treated as percentage of your screen.
			border = "single", -- Border style. Can be "single", "double" or "rounded"
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
		windows = { indent = 1 },
		render = {
			max_type_length = nil, -- Can be integer or nil.
			max_value_lines = 100, -- Can be integer or nil.
		},
	})

	-- Dap hotkeys
	vim.keymap.set("n", "<F5>", function()
		dap.continue()
	end, {
		desc = "start debugger",
	})
	vim.keymap.set("n", "<F9>", function()
		dap.step_into()
	end, {
		desc = "step into",
	})
	vim.keymap.set("n", "<F10>", function()
		dap.step_over()
	end, {
		desc = "step over",
	})
	vim.keymap.set("n", "<F12>", function()
		dap.step_out()
	end, {
		desc = "step out",
	})
	vim.keymap.set("n", "<leader>b", function()
		dap.toggle_breakpoint()
	end, {
		desc = "toggle breakpoint",
	})
	vim.keymap.set("n", "<leader>B", function()
		dap.set_breakpoint()
	end, {
		desc = "set breakpoint",
	})
	vim.keymap.set("n", "<leader>lp", function()
		dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
	end, {
		desc = "log point message",
	})
	vim.keymap.set("n", "<leader><leader>do", function()
		dap.repl.open()
	end, {
		desc = "repl open",
	})
	vim.keymap.set("n", "<leader><leader>dl", function()
		dap.run_last()
	end, {
		desc = "debugger run last",
	})
	vim.keymap.set({ "n", "v" }, "<leader><leader>wh", function()
		widgets.hover()
	end, {
		desc = "hover dap ui widgets",
	})
	vim.keymap.set({ "n", "v" }, "<leader><leader>wp", function()
		widgets.preview()
	end, {
		desc = "preview dap ui widgets",
	})
	vim.keymap.set("n", "<leader><leader>wf", function()
		widgets.centered_float(widgets.frames)
	end, {
		desc = "center widget frames",
	})
	vim.keymap.set("n", "<leader><leader>ws", function()
		widgets.centered_float(widgets.scopes)
	end, {
		desc = "center widget scopes",
	})
	vim.keymap.set("n", "<leader><leader>sc", function()
		widgets.sidebar(widgets.scopes).open()
	end, {
		desc = "open sidebar widget scopes",
	})
	vim.keymap.set("n", "<leader><leader>pt", function()
		dappy.test_method()
	end, {
		desc = "dap python test",
	})
	vim.keymap.set("n", "<leader><leader>gt", function()
		dapgo.debug_test()
	end, {
		desc = "Debug Go test",
	})
	vim.keymap.set("n", "<leader><leader>gl", function()
		dapgo.debug_last()
	end, {
		desc = "Debug last Go test",
	})
	vim.keymap.set("n", "<leader><leader>gj", "<cmd> GoTagAdd json<CR>", {
		desc = "Add json struct tags",
	})
	vim.keymap.set("n", "<leader><leader>gy", "<cmd> GoTagAdd yaml<CR>", {
		desc = "Add yaml struct tags",
	})

	-- Dap UI
	dap.listeners.before.attach.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.launch.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close()
	end
	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close()
	end
end)

if not ok then
	start = nil
end
if start then
	start()
end
