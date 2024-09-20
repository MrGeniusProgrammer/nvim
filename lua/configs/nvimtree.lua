local options = {
	filters = { dotfiles = false },
	disable_netrw = true,
	hijack_cursor = true,
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = false,
	},
	view = {
		width = 30,
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
      error = ""
		}
	},
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
}

return options
