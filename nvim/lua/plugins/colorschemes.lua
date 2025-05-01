return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      style = "night",
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  {
    "tiagovla/tokyodark.nvim",
    config = function(_, opts)
      require("tokyodark").setup(opts)
      -- vim.cmd([[colorscheme tokyodark]])
    end,
    opts = {
      transparent_background = true,
    },
  },
}
