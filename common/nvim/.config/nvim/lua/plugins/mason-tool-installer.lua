return {
	"whoissethdaniel/mason-tool-installer.nvim",

	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- use for formatters and linters [and DAP's]

				-- formatters
				"stylua",
			},

			auto_update = true,

			integrations = {
				["mason-lsp-config"] = true,
			},
		})
	end,
}
