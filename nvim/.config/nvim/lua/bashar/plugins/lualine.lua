return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status")

        -- Colors pulled from Falcon theme
        local colors = {
            primary = {
                bg = "0x020221",
                fg = "0xb4b4b9",
            },
            cursor = {
                text = "0x020221",
                cursor = "0xffe8c0",
            },
            normal = {
                black = "0x000004",
                red = "0xff3600",
                green = "0xff3600",
                yellow = "0xffc552",
                blue = "0x635196",
                magenta = "0xff761a",
                cyan = "0x34bfa4",
                white = "0xb4b4b9",
            },
            bright = {
                black = "0x020221",
                red = "0xff8e78",
                green = "0xb2bc55",
                yellow = "0xffd392",
                blue = "0x99a4bc",
                magenta = "0xffb07b",
                cyan = "0x8bccbf",
                white = "0xf8f8ff",
            },
        }

        local my_lualine_theme = {
            normal = {
                a = { bg = colors.bright.blue, fg = colors.primary.bg, gui = "bold" },
                b = { bg = colors.primary.bg, fg = colors.primary.fg },
                c = { bg = colors.primary.bg, fg = colors.primary.fg },
            },
            insert = {
                a = { bg = colors.bright.green, fg = colors.primary.bg, gui = "bold" },
                b = { bg = colors.primary.bg, fg = colors.primary.fg },
                c = { bg = colors.primary.bg, fg = colors.primary.fg },
            },
            visual = {
                a = { bg = colors.bright.magenta, fg = colors.primary.bg, gui = "bold" },
                b = { bg = colors.primary.bg, fg = colors.primary.fg },
                c = { bg = colors.primary.bg, fg = colors.primary.fg },
            },
            command = {
                a = { bg = colors.normal.yellow, fg = colors.primary.bg, gui = "bold" },
                b = { bg = colors.primary.bg, fg = colors.primary.fg },
                c = { bg = colors.primary.bg, fg = colors.primary.fg }, 
            },
            replace = {
                a = { bg = colors.normal.red, fg = colors.primary.bg, gui = "bold" },
                b = { bg = colors.primary.bg, fg = colors.primary.fg },
                c = { bg = colors.primary.bg, fg = colors.primary.fg },
            },
            inactive = {
                a = { bg = colors.bright.black, fg = colors.normal.white, gui = "bold" },
                b = { bg = colors.bright.black, fg = colors.normal.white },
                c = { bg = colors.bright.black, fg = colors.normal.white },
            },
        }

        -- configure lualine with modified theme
        lualine.setup({
            options = {
                theme = my_lualine_theme,
            },
            sections = {
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#ff9e64" },
                    },
                    { "encoding" },
                    { "fileformat" },
                    { "filetype" },
                },
            },
        })

    end,
}
