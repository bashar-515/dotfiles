-- search for files and strings throughout a directory
-- TODO: stop respecting '.gitignore' files
return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',                                        -- required dependency
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- improves performance and allows for better fuzzy find behavior
    "nvim-treesitter/nvim-treesitter",                              -- required for `live_grep` and `find_string` to work
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

        -- allow hidden (dot) files to show up when searching for strings
        -- [for some reason this seems to only affect `live_grep` and `grep_string` (i.e., not searching for files),
        -- hence the use of '--hidden' with `find_files`]
        hidden = true,

        -- this option needs to be set for files in a '.git' directory to _not_ show up when using `find_files`. It
        -- already applies when using `live_grep` and `grep_string`
        file_ignore_patterns = { ".git/" }

        -- right now, all functions (`find_files`, `live_grep`, and `grep_string`) respect a '.gitignore' file
      },
    })

    telescope.load_extension("fzf")

    local keymap = vim.keymap
    local builtin = require('telescope.builtin')

    -- current behavior: shows hidden files, ignores anything in '.git' and respects '.gitignore'
    keymap.set('n', '<leader>ff', "<cmd>Telescope find_files find_command=rg,--files,--hidden<cr>", {})

    keymap.set('n', '<leader>fg', builtin.live_grep, {})    -- requires 'ripgrep' on system to work (and also 'nvim-treesitter')
    keymap.set('n', '<leader>fs', builtin.grep_string, {})  -- requires 'ripgrep' on system to work (and also 'nvim-treesitter')
  end
}
