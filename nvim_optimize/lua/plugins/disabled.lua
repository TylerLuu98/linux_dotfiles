-- ~/.config/nvim/lua/plugins/disabled.lua
return {
  -- Tắt giao diện thông báo/cmdline nặng nề (Noice)
  { "folke/noice.nvim",          enabled = false },

  -- Tắt thông báo popup góc phải (Notify) -> Dùng native message nhanh hơn
  { "rcarriga/nvim-notify",      enabled = false },

  -- Tắt nhảy nhanh Flash (nếu bạn không dùng)
  { "folke/flash.nvim",          enabled = false },

  -- Tắt màn hình Dashboard logo khởi động (Vào thẳng editor luôn)
  { "goolord/alpha-nvim",        enabled = false },

  -- Tắt thanh trạng thái dưới cùng (nếu muốn tối ưu cực đoan 10ms)
  { "nvim-lualine/lualine.nvim", enabled = false },

  -- Tắt hiển thị phím bấm (Which-key) nếu bạn đã thuộc phím (tăng tốc đáng kể)
  -- { "folke/which-key.nvim",    enabled = false },

  -- Tắt thanh Tab phía trên (Tiết kiệm ~3.65ms)
  -- C++ dev thường dùng Telescope (Leader ff) để chuyển file nhanh hơn là nhìn tab.
  -- { "akinsho/bufferline.nvim",   enabled = false },

  -- Tắt giao diện Command Line & Thông báo đẹp (Tiết kiệm ~0.9ms + CPU render)
  -- Quay về giao diện cmdline cổ điển nằm dưới cùng, không che code.
  { "folke/noice.nvim",          enabled = false },

  -- Tắt nhảy nhanh Flash (Tiết kiệm ~0.7ms)
  -- Nếu bạn chỉ dùng tìm kiếm `/` truyền thống thì cái này thừa.
  { "folke/flash.nvim",          enabled = false },

  -- [LỰA CHỌN] Tắt Icons (Tiết kiệm ~5.19ms - RẤT NHIỀU)
  -- Nếu bạn chấp nhận editor chỉ toàn chữ (không icon folder, file type), bỏ comment dòng dưới.
  { "nvim-mini/mini.icons",      enabled = false },

  -- Tắt plugin Web Dev không dùng cho C++
  { "windwp/nvim-ts-autotag",    enabled = false }, -- Tiết kiệm 1.33ms

  -- Tắt tô màu TODO comment
  -- { "folke/todo-comments.nvim",  enabled = false }, -- Tiết kiệm 1.36ms

  -- Tắt hỗ trợ comment nâng cao (dùng native neovim gcc là đủ)
  { "folke/ts-comments.nvim",    enabled = false }, -- Tiết kiệm 1.5ms

  -- Tắt lưu session tự động (nếu thích mở mới sạch sẽ)
  { "folke/persistence.nvim",    enabled = false }, -- Tiết kiệm 0.56ms
}
