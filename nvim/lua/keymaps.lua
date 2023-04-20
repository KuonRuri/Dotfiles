-- Keymap
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('i', 'っｊ', '<Esc>')
vim.keymap.set('n', '<Down>', '<C-w>j')
vim.keymap.set('n', '<Up>', '<C-w>k')
vim.keymap.set('n', '<Left>', '<C-w>h')
vim.keymap.set('n', '<Right>', '<C-w>l')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('n', 'p', ']p')
vim.keymap.set('n', 'P', ']P')
vim.keymap.set('n', 'Y', 'y$')
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')
vim.keymap.set('n', '<Esc><Esc>', ':set hlsearch<CR>')