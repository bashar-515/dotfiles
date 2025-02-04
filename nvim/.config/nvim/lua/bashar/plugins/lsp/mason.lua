return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },

    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "⧗",
                    package_uninstalled = "𝕏",
                },
            },
        })
        
        -- lsp servers
        mason_lspconfig.setup({
            ensure_installed = {
                "pyright",
                "gopls",
                "docker_compose_language_service",
                "dockerls",
                "ts_ls",
                "html",
                "cssls",
            },
        })

        -- misc. (formatters, linters, etc.)
        mason_tool_installer.setup({
            ensure_installed = {
                "isort", -- Python formatter
                "black", -- Python formatter
                "golines", -- shortens long lines in go if possible
                "gofumpt", -- strict gofmt formatter for go
                "prettierd",
            },
        })
    end,
}
