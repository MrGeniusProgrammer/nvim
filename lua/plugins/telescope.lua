return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			"nvim-telescope/telescope-fzf-native.nvim",

			-- `build` is used to run some command when the plugin is installed/updated.
			-- This is only run then, not every time Neovim starts up.
			build = "make",

			-- `cond` is a condition used to determine whether this plugin should be
			-- installed and loaded.
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },

		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	cmd = "Telescope",
	event = "VimEnter",
	opts = {
		defaults = {
			prompt_prefix = "   ",
			selection_caret = " ",
			entry_prefix = " ",
			sorting_strategy = "descending",
			layout_strategy = "vertical",
			layout_config = {
				preview_height = 0.7,
				vertical = {
					size = {
						width = "95%",
						height = "95%",
					},
				},
			},
		},
		pickers = {
			find_files = {
				hidden = true,
				find_command = {
					"rg",
					"--files",
					"--color=never",
					"--no-heading",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob",
					"!{.git/*,.svelte-kit/*,target/*,node_modules/*}",
					"--path-separator",
					"/",
				},
			},
		},
		extensions_list = {},
		extensions = {},
	},
	config = function(_, opts)
		require("telescope").setup(opts)

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
	end,
	keys = {
		{
			"<leader>/",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end,
			mode = "n",
			desc = "[/] Fuzzily search in current buffer",
		},
		{
			"<leader>s/",
			function()
				require("telescope.builtin").live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end,
			mode = "n",
			desc = "[S]earch [/] in Open Files",
		},
		{
			"<leader>sn",
			function()
				require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
			end,
			mode = "n",
			desc = "[S]earch [N]eovim files",
		},
		{ "<leader>sh", require("telescope.builtin").help_tags, mode = "n", desc = "[S]earch [H]elp" },
		{ "<leader>sk", require("telescope.builtin").keymaps, mode = "n", desc = "[S]earch [K]eymaps" },
		{ "<leader>sf", require("telescope.builtin").find_files, mode = "n", desc = "[S]earch [F]iles" },
		{ "<leader>ss", require("telescope.builtin").builtin, mode = "n", desc = "[S]earch [S]elect Telescope" },
		{ "<leader>sw", require("telescope.builtin").grep_string, mode = "n", desc = "[S]earch current [W]ord" },
		{ "<leader>sg", require("telescope.builtin").live_grep, mode = "n", desc = "[S]earch by [G]rep" },
		{ "<leader>sd", require("telescope.builtin").diagnostics, mode = "n", desc = "[S]earch [D]iagnostics" },
		{ "<leader>sr", require("telescope.builtin").resume, mode = "n", desc = "[S]earch [R]esume" },
		{
			"<leader>s.",
			require("telescope.builtin").oldfiles,
			mode = "n",
			desc = '[S]earch Recent Files ("." for repeat)',
		},
		{ "<leader><leader>", require("telescope.builtin").buffers, mode = "n", desc = "[ ] Find existing buffers" },
	},
}
