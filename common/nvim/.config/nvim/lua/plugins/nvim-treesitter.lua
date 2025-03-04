-- syntax highlighting
return {
  "nvim-treesitter/nvim-treesitter",
  -- TODO: [q] should I include this? event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",

  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      -- the listed parsers MUST always be installed
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

      -- install parsers synchronously/sequentially (only applied to `ensure_installed`)
      sync_install = false,

      -- do not install automatically detected missing parser
      auto_install = false,

      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
