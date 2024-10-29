return {
	"MeanderingProgrammer/render-markdown.nvim",
	events = {
		"BufReadPre *.md",
		"BufNewFile *.md",
	},
	opts = {
		-- Whether Markdown should be rendered by default or not
		enabled = true,
		-- Pre configured settings that will attempt to mimic various target
		-- user experiences. Any user provided settings will take precedence.
		--  obsidian: mimic Obsidian UI
		--  lazy:     will attempt to stay up to date with LazyVim configuration
		--  none:     does nothing
		preset = "obsidian",
		-- The level of logs to write to file: vim.fn.stdpath('state') .. '/render-markdown.log'
		-- Only intended to be used for plugin development / debugging
		log_level = "error",
		-- Filetypes this plugin will run on
		file_types = { "markdown", "vimtext" },
		-- Vim modes that will show a rendered view of the markdown file
		-- All other modes will be uneffected by this plugin
		render_modes = { "n", "v", "i", "c" },
		latex = {
			-- Whether LaTeX should be rendered, mainly used for health check
			enabled = false,
		},
		bullet = {
			-- Turn on / off list bullet rendering
			enabled = true,
			-- Replaces '-'|'+'|'*' of 'list_item'
			-- How deeply nested the list is determines the 'level'
			-- The 'level' is used to index into the list using a cycle
			-- If the item is a 'checkbox' a conceal is used to hide the bullet instead
			icons = { "●", "○", "◆", "◇" },
			-- Padding to add to the left of bullet point
			left_pad = 0,
			-- Padding to add to the right of bullet point
			right_pad = 0,
			-- Highlight for the bullet icon
			highlight = "RenderMarkdownBullet",
		},
		-- Checkboxes are a special instance of a 'list_item' that start with a 'shortcut_link'
		-- There are two special states for unchecked & checked defined in the markdown grammar
		checkbox = {
			-- Turn on / off checkbox state rendering
			enabled = true,
			-- Determines how icons fill the available space:
			--  inline:  underlying text is concealed resulting in a left aligned icon
			--  overlay: result is left padded with spaces to hide any additional text
			position = "inline",
			unchecked = {
				-- Replaces '[ ]' of 'task_list_marker_unchecked'
				icon = "󰄱 ",
				-- Highlight for the unchecked icon
				highlight = "RenderMarkdownUnchecked",
			},
			checked = {
				-- Replaces '[x]' of 'task_list_marker_checked'
				icon = " ",
				-- Highligh for the checked icon
				highlight = "RenderMarkdownChecked",
			},
			-- Define custom checkbox states, more involved as they are not part of the markdown grammar
			-- As a result this requires neovim >= 0.10.0 since it relies on 'inline' extmarks
			-- Can specify as many additional states as you like following the 'todo' pattern below
			--   The key in this case 'todo' is for healthcheck and to allow users to change its values
			--   'raw':       Matched against the raw text of a 'shortcut_link'
			--   'rendered':  Replaces the 'raw' value when rendering
			--   'highlight': Highlight for the 'rendered' icon
			custom = {
				followup = { raw = "[>]", rendered = " ", highlight = "ObsidianRightArrow" },
				cancelled = { raw = "[~]", rendered = "󰰱 ", highlight = "ObsidianTilde" },
				important = { raw = "[!]", rendered = " ", highlight = "ObsidianImportant" },
			},
		},
		link = {
			-- Turn on / off inline link icon rendering
			enabled = true,
			-- Inlined with 'image' elements
			image = "󰥶 ",
			-- Inlined with 'email_autolink' elements
			email = "󰀓 ",
			-- Fallback icon for 'inline_link' elements
			hyperlink = "",
			-- Applies to the fallback inlined icon
			highlight = "RenderMarkdownLink",
			-- Define custom destination patterns so icons can quickly inform you of what a link
			-- contains. Applies to 'inline_link' and wikilink nodes.
			-- Can specify as many additional values as you like following the 'web' pattern below
			--   The key in this case 'web' is for healthcheck and to allow users to change its values
			--   'pattern':   Matched against the destination text see :h lua-pattern
			--   'icon':      Gets inlined before the link text
			--   'highlight': Highlight for the 'icon'
			custom = {
				web = { pattern = "^http[s]?://", icon = "󰖟 ", highlight = "RenderMarkdownLink" },
			},
		},
		-- More granular configuration mechanism, allows different aspects of buffers
		-- to have their own behavior. Values default to the top level configuration
		-- if no override is provided. Supports the following fields:
		--   enabled, max_file_size, debounce, render_modes, anti_conceal, padding, heading, code,
		--   dash, bullet, checkbox, quote, pipe_table, callout, link, sign, indent, win_options
		overrides = {
			-- Overrides for different buftypes, see :h 'buftype'
			buftype = {
				nofile = {
					padding = { highlight = "NormalFloat" },
					sign = { enabled = false },
				},
			},
			-- Overrides for different filetypes, see :h 'filetype'
			filetype = {},
		},
		-- Mapping from treesitter language to user defined handlers
		-- See 'Custom Handlers' document for more info
		custom_handlers = {},
	},
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
}
