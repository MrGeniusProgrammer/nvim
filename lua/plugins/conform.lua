local prettier = { "prettierd", "prettier", stop_after_first = true }

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre", "BufNewFile" },
	cmd = { "ConformInfo" },
	opts = {
		notify_on_error = false,
		formatters_by_ft = {
			markdown = prettier,
			javascript = prettier,
			typescript = prettier,
			javascriptreact = prettier,
			typescriptreact = prettier,
			svelte = prettier,
			css = prettier,
			html = prettier,
			json = prettier,
			yaml = prettier,
			graphql = prettier,
			lua = { "stylua" },
			python = { "isort", "black" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			async = false,
			timeout_ms = 50000,
			lsp_fallback = true,
		},
	},
	keys = {
		{
			"<leader>fb",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat [B]uffer",
		},
		{
			"<leader>fi", -- Format Info
			"<cmd>ConformInfo<cr>",
			desc = "[F]ormat [I]nfo",
		},
	},
}
