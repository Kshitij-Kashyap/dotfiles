require "nvchad.options"

-- add yours here!
local opt = vim.opt

-- Tab settings
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Line number configuration
opt.number = true          -- Show absolute line numbers
opt.relativenumber = true  -- Show relative line numbers (hybrid mode)
opt.signcolumn = "yes"     -- Always show sign column
opt.numberwidth = 4        -- Width of the number column

-- Cursor settings from original init.lua
opt.guicursor = "n-v-c:block"
vim.cmd("highlight Cursor guibg=#ffffff guifg=#000000")

-- System Clipboard support (works with win32yank on WSL)
opt.clipboard = "unnamedplus"

-- WSL Clipboard configuration
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ['+'] = 'clip.exe',
      ['*'] = 'clip.exe',
    },
    paste = {
      ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end
