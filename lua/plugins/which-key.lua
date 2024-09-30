return {
	"folke/which-key.nvim",
	lazy = false,
	keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
	cmd = "WhichKey",
	config = function(_, opts)
		require("which-key").setup(opts)
	end,
}
