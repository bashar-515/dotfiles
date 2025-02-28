-- informational line at bottom of screen
return {
  "nvim-lualine/lualine.nvim",
  dependencies = 'nvim-tree/nvim-web-devicons',

  config = function()
    local lualine = require("lualine")

    lualine.setup({
      options = { theme = "dracula"}
    })
  end
}
