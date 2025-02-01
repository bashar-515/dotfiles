return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				python = { "isort", "black" },
                angular = { "prettierd" },
                css = { "prettierd" },
                flow = { "prettierd" },
                graphql = { "prettierd" },
                html = { "prettierd" },
                hson = { "prettierd" },
                jsx = { "prettierd" },
                javascript = { "prettierd" },
                less = { "prettierd" },
                markdown = { "prettierd" },
                scss = { "prettierd" },
                typescript = { "prettierd" },
                vue = { "prettierd" },
                yaml = { "prettierd" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set(
            { "n", "v" },
            "<leader>mp",
            function()
			    conform.format({
				    lsp_fallback = true,
				    async = false,
				    timeout_ms = 1000,
			    })
		    end,
            { desc = "Format file or range (in visual mode)" }
        )
	end,
}
