return {
  {
    "williamboman/mason.nvim",
    requires = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    --NOTE: mason border setup
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
  -- NOTE: nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    opts = function()
      ---@class PluginLspOpts
      local ret = {
        -- options for vim.diagnostic.config()
        ---@type vim.diagnostic.Opts
        ---
        diagnostics = {
          underline = true,
          update_in_insert = false,
          virtual_text = false,
          -- virtual_text = {
          --   spacing = 4,
          --   source = "if_many",
          --   prefix = "●",
          -- },
          float = {
            border = "rounded",
          },
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
          exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
        },
        codelens = {
          enabled = false,
        },
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
        -- LSP Server Settings
        ---@type lspconfig.options
        servers = {
          eslint = {},
          clangd = {},
          cssls = {
            settings = {
              css = { validate = true, lint = {
                unknownAtRules = "ignore",
              } },
              scss = { validate = true, lint = {
                unknownAtRules = "ignore",
              } },
              less = { validate = true, lint = {
                unknownAtRules = "ignore",
              } },
            },
          },
          lua_ls = {
            settings = {
              Lua = {
                workspace = {
                  checkThirdParty = false,
                },
                codeLens = {
                  enable = true,
                },
                completion = {
                  callSnippet = "Replace",
                },
                doc = {
                  privateName = { "^_" },
                },
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
        -- you can do any additional lsp server setup here
        -- return true if you don't want this server to be setup with lspconfig
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
          -- example to setup with typescript.nvim
          -- tsserver = function(_, opts)
          --   require("typescript").setup({ server = opts })
          --   return true
          -- end,
          -- Specify * to use this function as a fallback for any server
          -- ["*"] = function(server, opts) end,
        },
      }

      local Keys = require("lazyvim.plugins.lsp.keymaps").get()

      vim.list_extend(Keys, {
        { "gr", "<Nop>" },
        { "gI", "<Nop>" },
      })
      return ret
    end,
  },
}
