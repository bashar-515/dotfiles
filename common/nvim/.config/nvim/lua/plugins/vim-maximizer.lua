-- toggle a neovim pane (i.e., a split window/screen) between full screen and not
return {
	"szw/vim-maximizer",
	keys = {
		{ "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
	},
}
