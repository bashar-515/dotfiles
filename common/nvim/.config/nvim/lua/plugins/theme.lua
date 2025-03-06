-- install and set theme
return {}

--[[ return {
	"sainnhe/gruvbox-material",
	priority = 1000,

	config = function()
		-- vim.cmd("let g:gruvbox_material_transparent_background = 1")
		vim.cmd("colorscheme gruvbox-material")
	end,
} ]]

--[[ return {
	"navarasu/onedark.nvim",
  priority = 1000,

	config = function()
		local onedark = require("onedark")

		onedark.setup({
			style = "darker",
			transparent = true,
		})

		onedark.load()
	end,
} ]]

--[[ return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,

	config = function()
		require("gruvbox").setup({
			transparent_mode = true,
		})

		vim.cmd("colorscheme gruvbox")
	end,
} ]]
