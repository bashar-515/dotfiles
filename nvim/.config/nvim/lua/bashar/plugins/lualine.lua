return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		lualine.setup({
			options = {
				theme = "dracula",
			},
            sections = {
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                    }
                }
            }
		})
	end,
}
