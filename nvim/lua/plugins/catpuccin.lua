return {
  { "xiyaowong/transparent.nvim",
    lazy = false
  },
  { "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin"
    end
  }
}
