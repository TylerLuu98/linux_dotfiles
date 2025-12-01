return {
  -- {
  --   "tiagovla/tokyodark.nvim",
  --   config = function(_, opts)
  --     require("tokyodark").setup(opts)
  --     -- vim.cmd([[colorscheme tokyodark]])
  --   end,
  --   opts = {
  --     transparent_background = true,
  --   },
  -- },

  -- add theme
  -- { "tiagovla/tokyodark.nvim" },
  -- { "folke/tokyonight.nvim" },
  -- { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
      transparent_background = true,
    },
  },
}
