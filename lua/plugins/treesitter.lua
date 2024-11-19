return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc", "javascript", "java", "json", "markdown_inline", "gitcommit", "git_rebase", "git_config", "gitignore", "markdown", "toml", "yaml", "svelte", "css", "html", "typescript", "python", "rust", "cpp", "c", "cmake" },
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
