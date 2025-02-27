-- automate the installation of LSP's using 'mason'
return {
  "williamboman/mason-lspconfig.nvim",

  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
      }
    })
  end
}
