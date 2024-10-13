return {
	"tpope/vim-fugitive",
	keys = {
		{
			"<leader>g",
			vim.cmd.Git,
			mode = "n",
			desc = "Open [G]it",
		},
	},
}
