-- formatting
return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				bash = { "shfmt" },
			},

			default_format_opts = {
				lsp_format = "fallback",
				timeout_ms = 1000,
			},

			format_on_save = {},

			vim.keymap.set({ "n", "v" }, "<leader>f", conform.format),
		})
	end,
}
