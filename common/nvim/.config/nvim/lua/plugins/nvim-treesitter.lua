-- syntax highlighting
-- TODO: syntax highlighting isn't working
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    local nvimtreesitter = require("nvim-treesitter.configs")

    nvimtreesitter.setup({
      ensure_installed = { "lua" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
