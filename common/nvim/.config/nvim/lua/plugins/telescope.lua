-- search for files and strings throughout a directory
return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
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
    local builtin = require('telescope.builtin')

    keymap.set('n', '<leader>ff', builtin.find_files, {})
    keymap.set('n', '<leader>fs', builtin.live_grep, {})
  end
}
