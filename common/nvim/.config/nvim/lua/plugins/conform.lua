-- formatting
return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				sh = { "shfmt" },

				angular = { "prettierd" },
				css = { "prettierd" },
				flow = { "prettierd" },
				graphql = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				jsx = { "prettierd" },
				javascript = { "prettierd" },
				less = { "prettierd" },
				markdown = { "prettierd" },
				scss = { "prettierd" },
				typescript = { "prettierd" },
				vue = { "prettierd" },
				yaml = { "prettierd" },
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
