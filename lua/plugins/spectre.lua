return {
	"nvim-pack/nvim-spectre",
	cmd = { "Spectre" },
	event = { "BufReadPost", "BufNewFile" },
	opts = {},
	keys = {
		{
			"<leader>S",
			function()
				require("spectre").toggle()
			end,
			desc = "Toggle [S]pectre",
		},
		{
			"<leader>sw",
			function()
				require("spectre").open_visual({ select_word = true })
			end,
			desc = "Search current word",
		},
		{
			"<leader>sw",
			function()
				require("spectre").open_visual()
			end,
			desc = "Search current word",
			mode = "v",
		},
		{
			"<leader>sp",
			function()
				require("spectre").open_file_search({ select_word = true })
			end,
			desc = "Search on current file",
		},
	},
}