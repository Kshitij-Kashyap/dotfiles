return {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function()    
      local configs = require("nvim-treesitter.configs")
      configs.setup({
          ensure_installed = { 
            "python",           -- Python
            "rust",             -- Rust
            "c",                -- C
            "cpp",              -- C++
            "javascript",       -- JavaScript
            "typescript",       -- TypeScript
            "tsx",              -- React/JSX (handles both TSX and JSX)
            "html",             -- HTML
            "css",              -- CSS
            "lua",              -- Lua
            "asm",              -- Assembly
            "json",             -- JSON
            "yaml",             -- YAML
            "toml",             -- TOML
            "markdown",         -- Markdown
          },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
  }
