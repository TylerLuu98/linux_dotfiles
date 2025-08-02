vim.api.nvim_set_hl(0, "copilotIcon", { fg = "#5dc71b", bold = true })

local icons = {
  "echasnovski/mini.icons",
  lazy = true,
  opts = function()
    require("mini.icons").mock_nvim_web_devicons()
    return {
      lsp = {
        copilot = { glyph = "", hl = "copilotIcon" },
      },
    }
  end,
}

return icons
