require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Original Keybinds
-- Toggle relative/absolute/hybrid numbers
map("n", "<leader>n", ":set rnu!<CR>", { desc = "Toggle relative numbers" })
map("n", "<leader>N", ":set nu!<CR>", { desc = "Toggle absolute numbers" })
map("n", "<leader>nn", function()
  if vim.opt.relativenumber:get() then
    vim.opt.relativenumber = false
    vim.opt.number = true
    print("Absolute numbers only")
  else
    vim.opt.relativenumber = true
    vim.opt.number = true
    print("Hybrid numbers (absolute + relative)")
  end
end, { desc = "Toggle between absolute and hybrid numbers" })

-- Ctrl+S to save in all modes
map("n", "<C-s>", ":w<CR>", { desc = "Save file" })
map("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save file" })
map("v", "<C-s>", "<Esc>:w<CR>", { desc = "Save file" })

-- New File mapping
map("n", "<leader>nv", "<cmd>ene | startinsert<cr>", { desc = "New File" })
