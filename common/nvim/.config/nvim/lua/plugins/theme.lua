-- install and set theme

-- return {
-- 	"navarasu/onedark.nvim",
--
-- 	config = function()
-- 		local onedark = require("onedark")
--
-- 		onedark.setup({
-- 			style = "darker",
-- 			transparent = true,
-- 		})
--
-- 		onedark.load()
-- 	end,
-- }

return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,

	config = function()
		require("gruvbox").setup({
			transparent_mode = true,
		})

		vim.cmd("colorscheme gruvbox")
	end,
}
