return {
  {
    "NvChad/nvterm",
    config = function()
      require("nvterm").setup()

      local terminal = require("nvterm.terminal")

      local ft_cmds = {
      }
      local toggle_modes = { 'n', 't' }
      local mappings = {
        { 'n',          '<C-l>', function() require("nvterm.terminal").send(ft_cmds[vim.bo.filetype]) end },
        { toggle_modes, '<A-h>', function() require("nvterm.terminal").toggle('horizontal') end },
        { toggle_modes, '<A-v>', function() require("nvterm.terminal").toggle('vertical') end },
        { toggle_modes, '<A-i>', function() require("nvterm.terminal").toggle('float') end },
      }
      local opts = { noremap = true, silent = true }
      for _, mapping in ipairs(mappings) do
        vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
      end
    end,
  },
}
