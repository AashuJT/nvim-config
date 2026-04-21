local options = {

  formatters_by_ft = {
    -- Core
    lua = { "stylua" },

    -- Python + Data
    python = { "ruff_format", "black" },

    -- Rust
    rust = { "rustfmt" },

    -- SQL
    sql = { "sqlfluff" },

    -- Web
    html = { "prettier" },
    css = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "jq" },
    yaml = { "yamlfmt" },

    -- Docs + Writing
    markdown = { "prettier" },
  },

  format_on_save = {
    timeout_ms = 3000,
    lsp_fallback = true,
  },
}

return options

