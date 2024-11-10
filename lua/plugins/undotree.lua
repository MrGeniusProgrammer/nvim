return {
	"mbbill/undotree",
	cmd = "UndotreeToggle",
	event = { "BufReadPost", "BufNewFile" },
	keys = {
		{
			"<leader>u",
			vim.cmd.UndotreeToggle,
			desc = "Toggle [U]ndotree",
			mode = "n",
		},
	},
}
