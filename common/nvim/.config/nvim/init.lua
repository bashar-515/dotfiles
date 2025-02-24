require("config")

if vim.fn.filereadable(vim.fn.expand("~/.vimrc")) == 1 then
  vim.cmd([[
    source ~/.vimrc
  ]])
else
  require("core")
end
