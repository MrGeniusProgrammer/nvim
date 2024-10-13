return {
	"williamboman/mason.nvim",
	cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
	opts = {
		PATH = "skip",

		ui = {
			icons = {
				package_pending = " ",
				package_installed = " ",
				package_uninstalled = " ",
			},
		},

		max_concurrent_installers = 10,
	},
	config = function(_, opts)
		if opts.ensure_installed then
			vim.api.nvim_echo({
				{ "\n   ensure_installed has been removed! use M.mason.pkgs table in your chadrc.\n", "WarningMsg" },
				{ "   https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua#L85 \n\n", "FloatBorder" },
				{
					"   MasonInstallAll will automatically install all mason packages of tools configured in your plugins. \n",
					"healthSuccess",
				},
				{ "   Currently supported plugins are : lspconfig, nvim-lint, conform. \n", "Added" },
				{
					"   So dont add them in your chadrc as MasonInstallAll automatically installs them! \n",
					"Changed",
				},
			}, false, {})
		end

		require("mason").setup(opts)
	end,
}
