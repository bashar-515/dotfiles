-- actually use LSP's installed by Mason in Neovim
return {
  "neovim/nvim-lspconfig",

  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    local keymap = vim.keymap

    keymap.set("n", "K", vim.lsp.buf.hover, {})

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({})
      end,
    })
  end
}
