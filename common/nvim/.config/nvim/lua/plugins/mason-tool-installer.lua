-- automate the installation of linters and formatters through Mason
return {
	"whoissethdaniel/mason-tool-installer.nvim",

	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- use for formatters and linters [and DAP's]

				-- formatters
				-- lua, luau
				"stylua",

				-- bash
				"shfmt",

				-- angular, css, flow, graphql, html, json, jsx, javascript, less, markdown, scss, typescript, vue, yaml
				"prettierd",

				-- linters
				-- lua
				"luacheck",

				-- bash
				"shellcheck",

				-- typescript, javascript
				"eslint_d",
			},

			auto_update = true,

			integrations = {
				["mason-lsp-config"] = true,
			},
		})
	end,
}
