return {
  "folke/snacks.nvim",
  opts = {
    dashboard = { enabled = false },    -- Tắt màn hình chào (vào thẳng editor)
    -- indent = { enabled = false },       -- Tắt đường kẻ dọc thụt đầu dòng (đỡ rối mắt)
    input = { enabled = false },        -- Dùng input mặc định thay vì popup
    notifier = { enabled = false },     -- Tắt thông báo popup góc phải
    scroll = { enabled = false },       -- Tắt cuộn mượt (tiết kiệm GPU/CPU)
    animate = { enabled = false },      -- Tắt animation khác của Snacks (nếu có)
    statuscolumn = { enabled = false }, -- Tắt cột trạng thái bên trái (số dòng + git sign)

    -- GIỮ LẠI NHỮNG CÁI HỮU ÍCH:
    bigfile = { enabled = true },   -- Tự động tắt features khi mở file C++ > 1MB
    quickfile = { enabled = true }, -- Tăng tốc load file
    lazygit = { enabled = true },   -- Cần thiết
    terminal = { enabled = true },  -- Cần thiết
  },
}
