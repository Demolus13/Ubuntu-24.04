-- Initial configurations
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Set leader key
vim.g.mapleader = " "

-- Load the package manager lazy.nvim
require("config.lazy")
