-- search for files and strings throughout a directory
return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',                                        -- required dependency
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- improves performance and allows for better fuzzy find behavior
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },     -- required for 'find_string' and 'find_grep'
    "nvim-tree/nvim-web-devicons",
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
        hidden = true,
        file_ignore_patterns = { ".git/" }
      },
    })

    telescope.load_extension("fzf")

    local keymap = vim.keymap
    local builtin = require('telescope.builtin')

    keymap.set('n', '<leader>ff', "<cmd>Telescope find_files find_command=rg,--files,--hidden<cr>", {})
    keymap.set('n', '<leader>fg', builtin.live_grep, {})    -- requires 'ripgrep' on system to work (and also 'nvim-treesitter')
    keymap.set('n', '<leader>fs', builtin.grep_string, {})  -- requires 'ripgrep' on system to work (and also 'nvim-treesitter')
  end
}
