-- actually use LSP's installed by Mason in Neovim
return {
  "neovim/nvim-lspconfig",

  -- lazy load
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    local keymap = vim.keymap

    -- set up language servers
    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({})
      end,
    })

    -- global mappings
    local diagnostic = vim.diagnostic

    keymap.set("n", "<leader>d", diagnostic.open_float)
    keymap.set("n", "[d", diagnostic.goto_prev)
    keymap.set("n", "]d", diagnostic.goto_next)

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }

        -- TODO: not sure if this should be here or in the global mappings. The confusion stems from wheterh the value
        -- of `opts` matters
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        local buf = vim.lsp.buf

        keymap.set("n", "gD", buf.declaration, opts)
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        keymap.set("n", "K", buf.hover, opts)
        keymap.set("n", "gi", buf.implementation, opts)
        keymap.set("n", "gI", "<cmd>Telescope lsp_implementations<CR>", opts)
        keymap.set("n", "<C-k>", buf.signature_help, opts)
        keymap.set("n", "gt", buf.type_definition, opts)
        keymap.set("n", "gT", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        keymap.set("n", "<leader>rn", buf.rename, opts)
        keymap.set({ 'n', 'v' }, "<leader>ca", buf.code_action, opts)
        keymap.set("n", "gr", buf.references, opts)
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
      end
    })
  end
}
