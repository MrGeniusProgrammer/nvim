return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc" },
		auto_install = true,

		highlight = {
			enable = true,
			use_languagetree = true,
		},

		indent = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
