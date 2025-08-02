return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      --NOTE: Cấu hình cho các module
      bigfile = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = true },
      ---@type snacks.picker.Config
      picker = {
        formatters = {
          file = {
            filename_first = true,
          },
        },
      },
      --NOTE: Cấu hình cho module terminal
      terminal = {
        win = {
          border = "rounded",
          style = "float",
          width = 0.8,
          height = 0.8,
        },
      },
      --NOTE: Cấu hình cho module indent
      indent = {
        priority = 1,
        enabled = true, -- enable indent guides
        char = "│",
        only_scope = false, -- only show indent guides of the scope
        only_current = false, -- only show indent guides in the current window
        hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
        -- hl = {
        --   "SnacksIndent1",
        --   "SnacksIndent2",
        --   "SnacksIndent3",
        --   "SnacksIndent4",
        --   "SnacksIndent5",
        --   "SnacksIndent6",
        --   "SnacksIndent7",
        --   "SnacksIndent8",
        -- },
        animate = {
          enabled = vim.fn.has("nvim-0.10") == 1,
          style = "out",
          easing = "linear",
          duration = {
            step = 10, -- ms per step
            total = 200, -- maximum duration
          },
        },
        scope = {
          enabled = true, -- enable highlighting the current scope
          priority = 200,
          char = "│",
          underline = true, -- underline the start of the scope
          only_current = false, -- only show scope in the current window
          hl = "SnacksIndentScope", ---@type string|string[] hl group for scopes
        },
        blank = {
          -- char = " ",
          char = "·",
          hl = "SnacksIndentBlank", ---@type string|string[] hl group for blank spaces
        },
        filter = function(buf)
          return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == ""
        end,
      },

      statuscolumn = { enabled = true },

      words = { enabled = true },

      --NOTE: Cấu hình cho dashboard
      dashboard = {
        width = 80,
        row = nil,
        col = nil,
        pane_gap = 4,
        autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
        preset = {
          header = [[
████████╗██╗   ██╗██╗     ███████╗██████╗     ██╗     ██╗   ██╗██╗   ██╗
╚══██╔══╝╚██╗ ██╔╝██║     ██╔════╝██╔══██╗    ██║     ██║   ██║██║   ██║
   ██║    ╚████╔╝ ██║     █████╗  ██████╔╝    ██║     ██║   ██║██║   ██║
   ██║     ╚██╔╝  ██║     ██╔══╝  ██╔══██╗    ██║     ██║   ██║██║   ██║
   ██║      ██║   ███████╗███████╗██║  ██║    ███████╗╚██████╔╝╚██████╔╝
   ╚═╝      ╚═╝   ╚══════╝╚══════╝╚═╝  ╚═╝    ╚══════╝ ╚═════╝  ╚═════╝
          ]],
        },
      },
    },

    --NOTE: Cấu hình các phím tắt
    keys = {
      {
        "<leader>N",
        desc = "Neovim News",
        function()
          Snacks.win({
            file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
            width = 0.6,
            height = 0.6,
            border = "rounded",
            wo = {
              spell = false,
              wrap = false,
              signcolumn = "yes",
              statuscolumn = " ",
              conceallevel = 3,
            },
          })
        end,
      },
    },
  },
}
