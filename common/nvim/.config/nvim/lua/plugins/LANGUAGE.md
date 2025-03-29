### How to Add Support for a Language

1. Add relevant LSP's to `ensure_installed` field in 'lsp/mason-lspconfig.lua'
2. Add formatters to `ensure_installed` in 'mason-tool-installer.lua' before specifying formatters by file in
   'conform.lua'
3. Similarly, add linters to `ensure_installed` in 'mason-tool-installer.lua' before specifying linters by
   file in 'nvim-lint.lua'
4. Include language in `ensure_installed` in 'nvim-treesitter.nvim'

Formatters, Linters, and LSP's can be removed manually through Mason

### Languages _Fully_ Supported
- Lua
- Bash {TODO: configure LSP to recognize 'vim' as a global}
