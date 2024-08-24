return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 999,
    config = function()
      vim.cmd.colorscheme "catppuccin"
    require("catppuccin").setup({
        transparent_background = true
      })
    end
  }
}
