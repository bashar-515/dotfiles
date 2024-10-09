vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- case-sensitive if search is mixed case

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be made light or dark will be made dark
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

 -- use system clipboard as default register
opt.clipboard:append("unnamedplus")

opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.scrolloff = 8
opt.wrap = false
opt.mouse = "a"
opt.undofile = true
