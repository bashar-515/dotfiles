-- essentially an LSP manager. Use to install LSP's (and formatters, linters, etc.)
return {
  "williamboman/mason.nvim",

  config = function()
    require("mason").setup()
  end
}
