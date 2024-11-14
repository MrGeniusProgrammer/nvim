return {
	"nvim-tree/nvim-tree.lua",
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	event = "VimEnter",
	priority = 150,
	opts = {
		filters = { dotfiles = false },
		disable_netrw = true,
		hijack_cursor = true,
		sync_root_with_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = false,
		},
		view = {
			width = {
				min = 50,
				max = -1,
			},
			preserve_window_proportions = true,
			side = "right",
			number = true,
			relativenumber = true,
		},
		diagnostics = {
			enable = true,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		on_attach = function(bufnr)
			local api = require("nvim-tree.api")
			local opts = { buffer = bufnr }

			api.config.mappings.default_on_attach(bufnr)
			-- function for left to assign to keybindings
			local lefty = function()
				local node_at_cursor = api.tree.get_node_under_cursor()
				-- if it's a node and it's open, close
				if node_at_cursor.nodes and node_at_cursor.open then
					api.node.open.edit()
				-- else left jumps up to parent
				else
					api.node.navigate.parent()
				end
			end
			-- function for right to assign to keybindings
			local righty = function()
				local node_at_cursor = api.tree.get_node_under_cursor()
				-- if it's a closed node, open it
				if node_at_cursor.nodes and not node_at_cursor.open then
					api.node.open.edit()
				end
			end
			vim.keymap.set("n", "h", lefty, opts)
			vim.keymap.set("n", "<Left>", lefty, opts)
			vim.keymap.set("n", "<Right>", righty, opts)
			vim.keymap.set("n", "l", righty, opts)

			vim.api.nvim_create_autocmd("BufDelete", {
				callback = function(state)
					vim.opt.shada:append(state.file)
				end,
			})
		end,
		renderer = {
			root_folder_label = false,
			highlight_git = true,
			highlight_opened_files = "name",
			indent_markers = { enable = true },
			icons = {
				glyphs = {
					default = "󰈚",
					folder = {
						default = "",
						empty = "",
						empty_open = "",
						open = "",
						symlink = "",
					},
					git = {
						unstaged = "✗",
						staged = "✓",
						unmerged = "",
						renamed = "➜",
						untracked = "★",
						deleted = "",
						ignored = "◌",
					},
				},
			},
		},
	},
	keys = {
		{
			"<Cmd>bwipeout<CR>",
			function()
				local name = vim.api.nvim_buf_get_name(0)
				if
					name:find(".git/", 7, true)
					-- or name:match 'node_modules'
					or name:match("NvimTree_[0-9]+$")
					or not vim.loop.fs_stat(name)
				then
					vim.cmd.bwipeout()
				else
					vim.cmd.bdelete()
				end
			end,
			desc = "Tree close",
		},
		{
			"<leader>e",
			function()
				local nvimTree = require("nvim-tree.api")
				local currentBuf = vim.api.nvim_get_current_buf()
				local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
				if currentBufFt == "NvimTree" then
					nvimTree.tree.toggle()
				else
					nvimTree.tree.focus()
				end
			end,
			mode = "n",
			desc = "Focus on [E]xplorer",
		},
	},
}
