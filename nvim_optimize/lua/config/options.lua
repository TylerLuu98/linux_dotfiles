local opt = vim.opt
local global = vim.g
local diagnostic = vim.diagnostic

global.lazyvim_blink_main = false

vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

opt.wrap = true
opt.relativenumber = false

-- Add asterisks in block comments
opt.formatoptions:append({ "r" })
-- vim.opt.lazyredraw = true
opt.swapfile = false

opt.termguicolors = true
global.autoformat = false
