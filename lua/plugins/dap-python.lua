return {
	"mfussenegger/nvim-dap-python",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function(_, opts)
		require("dap-python").setup()
		table.insert(require("dap").configurations.python, {
			type = "python",
			request = "launch",
			name = "My custom launch configuration",
			program = "${file}",
		})
	end,
}
