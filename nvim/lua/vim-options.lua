vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set numberwidth=2")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

vim.g.mapleader = " "
vim.keymap.set('n', '<leader>n', ':set rnu<CR>')
vim.keymap.set('n', '<C-s>', ':w<CR>')
