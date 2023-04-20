local opt = vim.opt

-- Encording
-- opt.encoding = 'utf-8'
-- opt.scriptencoding = 'utf-8'

-- Use 24-bit colors
opt.termguicolors = true

-- Show indent
opt.list = true
opt.listchars = {tab = '>>-', trail = '-', nbsp = '+'}

-- Show number
opt.number = true
opt.relativenumber = true;

-- Change indent width
opt.autoindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.shiftwidth = 4

-- Disable swap file
opt.swapfile = false

-- Disable mouse
opt.mouse = ""

-- Float transparent
opt.winblend = 5
