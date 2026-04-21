return {

  -- Formatter
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- GitHub Copilot
  {
    "github/copilot.vim",
    cmd = "Copilot",
    event = "InsertEnter",
  },

  -- Better search & replace
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    keys = {
      { "<leader>S", "<cmd>Spectre<CR>", desc = "Search & Replace" },
    },
  },

  -- File explorer like buffer
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    opts = {},
    keys = {
      { "-", "<cmd>Oil<CR>", desc = "Open parent dir" },
    },
  },

  -- Undo history visualizer
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Undo Tree" },
    },
  },

  -- Floating terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      direction = "float",
      open_mapping = [[<c-\>]],
    },
  },

  -- Modern UI (cmdline, messages, notifications)
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  -- Fast cursor jump (Migrated to Codeberg)
  {
    url = "https://codeberg.org/andyg/leap.nvim",
    name = "leap.nvim",
    keys = {
      { "s", "<Plug>(leap-forward)", desc = "Leap Forward" },
      { "S", "<Plug>(leap-backward)", desc = "Leap Backward" },
    },
    config = function()
      require('leap').add_default_mappings()
    end,
  },

  -- Treesitter context (code breadcrumb at top)
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
  },

  -- CMP (autocomplete)
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",       -- snippet engine
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          { name = "luasnip" },
        }),
      })
    end,
  },

  -- Optional: GitHub Copilot AI
  {
    "github/copilot.vim",
    event = "InsertEnter",
  },
}

