return {
  -- Mason installer
  {
    "williamboman/mason.nvim",
    requires = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    -- NOTE: mason border setup
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      "mason.nvim",
      {
        "williamboman/mason-lspconfig.nvim",
        -- just call setup here; we'll pull the list of servers later
        config = function()
          require("mason-lspconfig").setup({})
        end,
      },
    },
    opts = function()
      ---@class PluginLspOpts
      local ret = {
        -- Diagnostic settings
        diagnostics = {
          underline = true,
          update_in_insert = false,
          virtual_text = false,
          float = { border = "rounded" },
          severity_sort = true,
          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
              [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
              [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
              [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
            },
          },
        },

        inlay_hints = {
          enabled = true,
          exclude = { "vue" },
        },

        codelens = { enabled = false },

        capabilities = {
          workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
          },
        },

        format = {
          formatting_options = nil,
          timeout_ms = nil,
        },

        ---@type lspconfig.options
        servers = {
          -- your hand-picked defaults
          eslint = {},
          clangd = {},
          cssls = {
            settings = {
              css = { validate = true, lint = { unknownAtRules = "ignore" } },
              scss = { validate = true, lint = { unknownAtRules = "ignore" } },
              less = { validate = true, lint = { unknownAtRules = "ignore" } },
            },
          },
          lua_ls = {
            settings = {
              Lua = {
                workspace = { checkThirdParty = false },
                codeLens = { enable = true },
                completion = { callSnippet = "Replace" },
                doc = { privateName = { "^_" } },
                hint = {
                  enable = true,
                  setType = false,
                  paramType = true,
                  paramName = "Disable",
                  semicolon = "Disable",
                  arrayIndex = "Disable",
                },
              },
            },
          },
        },

        -- custom per-server setup
        ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
        setup = {
          clangd = function(_, opts)
            opts.capabilities.offsetEncoding = { "utf-16" }
          end,
          eslint = function()
            require("lazyvim.util").lsp.on_attach(function(client)
              if client.name == "eslint" then
                client.server_capabilities.documentFormattingProvider = true
              elseif client.name == "tsserver" then
                client.server_capabilities.documentFormattingProvider = false
              end
            end)
          end,
          -- fallback example:
          -- ["*"] = function(server, opts) end,
        },
      }

      -- Automatically include *all* Mason-installed LSP servers
      local mlsc = require("mason-lspconfig")
      for _, server in ipairs(mlsc.get_installed_servers()) do
        ret.servers[server] = ret.servers[server] or {}
      end

      -- add or tweak keymaps if needed
      local Keys = require("lazyvim.plugins.lsp.keymaps").get()
      vim.list_extend(Keys, {
        { "gr", "<Nop>" },
        { "gI", "<Nop>" },
      })

      return ret
    end,
  },
}
