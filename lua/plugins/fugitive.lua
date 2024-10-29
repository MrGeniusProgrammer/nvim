return {
	"tpope/vim-fugitive",
	cmd = { "G", "Git" },
	keys = {
		{
			"<leader>g",
			vim.cmd.Git,
			mode = "n",
			desc = "Open [G]it",
		},
	},
}
