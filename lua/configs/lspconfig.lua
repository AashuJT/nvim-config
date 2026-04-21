-- Load NvChad defaults
require("nvchad.configs.lspconfig").defaults()

-- Enable LSP servers
local servers = {
  -- Web
  "html",
  "cssls",

  -- Python + Data
  "pyright",
  "ruff_lsp",

  -- Rust
  "rust_analyzer",

  -- SQL
  "sqlls",

  -- DevOps + Data Engineering
  "bashls",
  "jsonls",
  "yamlls",
  "dockerls",
  "terraformls",
}

vim.lsp.enable(servers)

-- Extra settings for Rust
vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
})

-- Extra settings for Python
vim.lsp.config("pyright", {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        typeCheckingMode = "basic",
      },
    },
  },
})

