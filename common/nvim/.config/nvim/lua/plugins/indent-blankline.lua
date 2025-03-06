-- add vertical lines denoting indents
-- TODO: fully configure, [q] figure colors
return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	opts = {},
}
