-- highlight current indent block
-- TODO: fully configure
return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({
			chunk = {
				enable = true,
			},

			-- highlight line numbers of current indent block
			line_num = {
				enable = true,
			},
		})
	end,
}
