return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      auto_install = true,
      ensure_installed = {
        "lua_ls",           -- Lua
        "pyright",         -- Python
        "rust_analyzer",   -- Rust
        "clangd",          -- C/C++
        "ts_ls",           -- JavaScript/TypeScript/React
        "html",            -- HTML
        "cssls",           -- CSS
        "asm_lsp",         -- Assembly (if available)
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      
      -- JavaScript/TypeScript/React
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" }
      })
      
      -- Python
      lspconfig.pyright.setup({
        capabilities = capabilities
      })
      
      -- Rust
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
          },
        },
      })
      
      -- C/C++
      lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
        },
      })
      
      -- Assembly (using asm-lsp if available)
      lspconfig.asm_lsp.setup({
        capabilities = capabilities
      })
      
      -- HTML/CSS
      lspconfig.html.setup({
        capabilities = capabilities
      })
      
      lspconfig.cssls.setup({
        capabilities = capabilities
      })
      
      -- Ruby
      lspconfig.solargraph.setup({
        capabilities = capabilities
      })
      
      -- Lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
