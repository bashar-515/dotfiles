-- informational line at bottom of screen
return {
  "nvim-lualine/lualine.nvim",

  config = function()
    local lualine = require("lualine")

    lualine.setup({
      options = { theme = "dracula"}
    })
  end
}
