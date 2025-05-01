local keymap = vim.keymap.set
local delkeymap = vim.api.nvim_del_keymap
local opts = { noremap = true, silent = true }

-- Do things without affecting the register
keymap("n", "x", '"_x', opts)
local leader_mappings = {
  p = '"52p',
  P = '"52P',
  c = '"_c',
  C = '"_C',
  -- d = '"_d',
  -- D = '"_D',
}
for key, cmd in pairs(leader_mappings) do
  keymap({ "n", "v" }, "<Leader>" .. key, cmd, opts)
end

local keys_to_delete = {
  { "n", "gc" },
  { "n", "<Space>c" },
  { "x", "<Space>c" },
  { "s", "<Space>c" },
  { "o", "a" },
  { "o", "i" },
  { "x", "a" },
  { "x", "i" },
}

for _, key in ipairs(keys_to_delete) do
  delkeymap(key[1], key[2])
end
