-- install and set theme
return {
	"rose-pine/neovim",
	name = "rose-pine",

	config = function()
		require("rose-pine").setup({
			variant = "moon",

			styles = {
				transparency = true,
			},
		})

		vim.cmd("colorscheme rose-pine")
	end,
}
