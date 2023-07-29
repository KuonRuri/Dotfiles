local k = vim.keymap.set
k('i', 'jj', '<Esc>')
k('i', 'っｊ', '<Esc>')
k('n', 'sj', '<C-w>j')
k('n', 'sk', '<C-w>k')
k('n', 'sh', '<C-w>h')
k('n', 'sl', '<C-w>l')
k('n', '<C-n>', '<Cmd>new<CR>')
k('v', '<', '<gv')
k('v', '>', '>gv')
k('n', 'p', ']p')
k('n', 'P', ']P')
k('n', 'Y', 'y$')
k('n', '+', '<C-a>')
k('n', '-', '<C-x>')
k('n', '<Esc><Esc>', ':set hlsearch<CR>')
k('n', 'gk', '<Cmd>lua vim.lsp.buf.hover()<CR>')
k('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
k('n', 'gj', '<Cmd>lua vim.lsp.buf.format()<CR>')
k('n', 'gl', '<Cmd>lua vim.lsp.buf.references()<CR>')
k('n', 'gi', '<Cmd>lua vim.lsp.buf.rename()<CR>')
k('n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>')
k('n', 'gh', '<Cmd>lua vim.lsp.buf.signature_help()<CR>')
k('n', 'gs', '<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
k('n', '<C-k>', '<Cmd>Files<CR>')
k('n', '<C-b>', '<Cmd>Buffers<CR>')
k('t', '<C-t>', '<Cmd>close<CR>')
k('t', 'jj', '<C-\\><C-n>')
k('t', 'sj', '<C-w>j')
k('t', 'sk', '<C-w>k')
k('t', 'sh', '<C-w>h')
k('t', 'sl', '<C-w>l')
--k('c', '<Tab>', '<Cmd>call pum#map#insert_relative(+1)<CR>')
--k('c', '<S-Tab>', '<Cmd>call pum#map#insert_relative(-1)<CR>')
--k('c', '<C-n>', '<Cmd>call pum#map#insert_relative(+1)<CR>')
--k('c', '<C-p>', '<Cmd>call pum#map#insert_relative(-1)<CR>')
--k('c', '<C-y>', '<Cmd>call pum#map#confirm()<CR>')
--k('c', '<C-e>', '<Cmd>call pum#map#cancel()<CR>')
