-- allows for a neovim pane (i.e., a split window/screen) to toggle between taking up the full screen and not
return {
    "szw/vim-maximizer",
    keys = {
        { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
    }
}
