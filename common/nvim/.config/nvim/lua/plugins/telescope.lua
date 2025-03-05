-- search for files and strings throughout a directory
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required dependency
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- improves performance and allows for better fuzzy find behavior
		"nvim-treesitter/nvim-treesitter", -- required for `live_grep` and `find_string` to work
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		-- current behavior: ignore '.git' directory, show hidden files and do not respect '.gitignore'
		telescope.setup({
			pickers = {
				find_files = {
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--no-ignore",
						"--iglob",
						"!.git",
					},
				},
			},

			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never", -- required/default
					"--no-heading", -- required/default
					"--with-filename", -- required/default
					"--line-number", -- required/default
					"--column", -- required/default

					"--smart-case", -- default

					"--hidden",
					"--no-ignore",
					"--glob",
					"!{**/.git/*}",
				},

				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		local keymap = vim.keymap
		local builtin = require("telescope.builtin")

		keymap.set("n", "<leader>ff", builtin.find_files, {})
		keymap.set("n", "<leader>fg", builtin.live_grep, {}) -- requires 'ripgrep' on system to work (and also 'nvim-treesitter')
		keymap.set("n", "<leader>fs", builtin.grep_string, {}) -- requires 'ripgrep' on system to work (and also 'nvim-treesitter')
		keymap.set("n", "<leader>fb", builtin.buffers, {})
	end,
}
