return {
  {
    "saghen/blink.cmp",

    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {

        ["<C-`>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide" },
        ["<C-y>"] = { "select_and_accept" },

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
        ["<C-n>"] = { "select_next", "fallback_to_mappings" },

        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },

        -- ["<Tab>"] = { "snippet_forward", "fallback" },
        -- ["<S-Tab>"] = { "snippet_backward", "fallback" },

        ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },

      completion = {
        ghost_text = { enabled = false },
        menu = {
          auto_show = function(ctx)
            return ctx.mode ~= "cmdline" or not vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype())
          end,

          border = "rounded",
          draw = {
            columns = {
              { "label",     "label_description", gap = 1 },
              { "kind_icon", "kind",              gap = 1 },
            },

            -- components = {
            --   kind_icon = {
            --     ellipsis = false,
            --     text = function(ctx)
            --       local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
            --       return kind_icon
            --     end,
            --     -- Optionally, you may also use the highlights from mini.icons
            --     highlight = function(ctx)
            --       local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
            --       return hl
            --     end,
            --   },
            -- },
          },
        },

        list = {
          selection = {
            preselect = function(ctx)
              return ctx.mode ~= "cmdline"
            end,
            auto_insert = function(ctx)
              return ctx.mode ~= "cmdline"
            end,
          },
        },
        trigger = {
          show_on_keyword = true,
          show_on_trigger_character = true,
        },

        documentation = {
          auto_show = true,
          auto_show_delay_ms = 100,
          window = {
            border = "rounded",
          },
        },
      },

      signature = {
        window = {
          show_documentation = false,
          border = "rounded",
        },
      },
    },
  },
}
