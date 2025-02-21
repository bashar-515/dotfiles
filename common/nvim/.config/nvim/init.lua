require("config")

vim.cmd([[
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
]])

if vim.fn.filereadable(vim.fn.expand("~/.vimrc")) == 1 then
  vim.cmd([[
    source ~/.vimrc
  ]])
end
