-- automate the installation of LSP's using 'mason'
return {
	"williamboman/mason-lspconfig.nvim",

	config = function()
		require("mason-lspconfig").setup({})
	end,
}

--[[
`:MasonToolsInstall` - only installs tools that are missing or at the incorrect version
`:MasonToolsInstallSync` - execute `:MasonToolsInstall` in blocking manner. It's useful in Neovim headless mode.
`:MasonToolsUpdate` - install missing tools and update already installed tools
`:MasonToolsUpdateSync` - execute `:MasonToolsUpdate` in blocking manner. It's useful in Neovim headless mode.
`:MasonToolsClean` - remove installed packages that are not listed in `ensure_installed`
]]
