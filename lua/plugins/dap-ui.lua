return {
	"rcarriga/nvim-dap-ui",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	keys = {
		{
			"<leader>d",
			function()
				require("dapui").toggle()
			end,
			desc = "Toggle [D]ebugger",
		},
	},
}
