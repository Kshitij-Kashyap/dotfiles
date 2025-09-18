vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set numberwidth=2")

-- Line number configuration
vim.opt.number = true          -- Show absolute line numbers
vim.opt.relativenumber = true  -- Show relative line numbers (hybrid mode)
vim.opt.signcolumn = "yes"     -- Always show sign column
vim.opt.numberwidth = 4        -- Width of the number column

vim.g.mapleader = " "

-- Line number toggle keybinds
vim.keymap.set('n', '<leader>n', ':set rnu!<CR>', { desc = 'Toggle relative numbers' })
vim.keymap.set('n', '<leader>N', ':set nu!<CR>', { desc = 'Toggle absolute numbers' })
vim.keymap.set('n', '<leader>nn', function()
  if vim.opt.relativenumber:get() then
    vim.opt.relativenumber = false
    vim.opt.number = true
    print("Absolute numbers only")
  else
    vim.opt.relativenumber = true
    vim.opt.number = true
    print("Hybrid numbers (absolute + relative)")
  end
end, { desc = 'Toggle between absolute and hybrid numbers' })

-- Ctrl+S to save in all modes
vim.keymap.set('n', '<C-s>', ':w<CR>')           -- Normal mode
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a')     -- Insert mode (save and return to insert)
vim.keymap.set('v', '<C-s>', '<Esc>:w<CR>')      -- Visual mode
