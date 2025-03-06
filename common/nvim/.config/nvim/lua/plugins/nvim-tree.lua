-- file tree explorer
return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",

	config = function()
		local nvimtree = require("nvim-tree")

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			-- current behavior: ignore '.git' directory, show hidden files and do not respect '.gitignore'
			view = {
				relativenumber = true,

				-- dynamically adjust width of tree pane
				adaptive_size = true,
			},

			-- do _not_ respect '.gitignore' when showing files by default
			git = { ignore = false },

			-- open file in nvim pane from which tree was opened
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},

			filters = {
				-- TODO: this is correctly causing '.git' to be ignore, but it's also unexpecedly causing '.gitconfig' in 'git'
				-- to not show up. This might be a bug. '.gitignore' does also show up
				custom = { ".git/" },
			},
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		keymap.set(
			"n",
			"<leader>ef",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" }
		)
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
	end,
}
