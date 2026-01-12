-- lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        underline = true, -- Chỉ gạch chân lỗi
        virtual_text = false, -- TẮT: Không hiện chữ lỗi bên cạnh dòng code (Gọn + Nhanh)
        update_in_insert = false, -- TẮT: Không check lỗi khi đang gõ (đỡ lag)
        severity_sort = true,
      }, -- Enable this to enable the builtin LSP inlay hints on Neovim.
    },
  },
}
