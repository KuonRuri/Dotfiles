local dein_dir = vim.env.HOME .. '/.cache/dein'
local dein_repo_dir = dein_dir .. '/repos/github.com/Shougo/dein.vim'

if not string.match(vim.o.runtimepath, '/dein.vim') then
	if vim.fn.isdirectory(dein_repo_dir) ~= 1 then
		--os.execute('git clone https://github.com/Shougo/dein.vim'..dein_repo_dir)
	end
	vim.o.runtimepath = dein_repo_dir .. ',' .. vim.o.runtimepath
end

-- 自動で dein#recache_runtimepath() する
--vim.api.nvim_set_var('dein#auto_recache', 1)
-- neovimのリモートプラグインを遅延読み込み
--vim.api.nvim_set_var('dein#lazy_rplugins', 1)
--vim.api.nvim_set_var('dein#enable_notification', 1)
--vim.api.nvim_set_var('dein#install_max_processes', 16)
--vim.api.nvim_set_var('dein#install_message_type', 'none')
--vim.api.nvim_set_var('dein#enable_notification', 1)

if vim.call('dein#load_state', dein_dir) == 1 then
	local dein_toml_dir = vim.env.HOME .. '/.config/nvim'
	local dein_toml = dein_toml_dir .. '/dein.toml'
	local dein_toml_lazy = dein_toml_dir .. '/dein_lazy.toml'

	vim.call('dein#begin', dein_dir, {vim.fn.expand('<sfile>'), dein_toml, dein_toml_lazy})

	vim.call('dein#load_toml', dein_toml, {lazy = 0})
	vim.call('dein#load_toml', dein_toml_lazy, {lazy = 1})
	vim.call('dein#end')
	vim.call('dein#save_state')
end

-- plugin install check
if (vim.fn['dein#check_install']() ~= 0) then
	vim.fn['dein#install']()
end

-- plugin remove check
local removed_plugins = vim.fn['dein#check_clean']()
if vim.fn.len(removed_plugins) > 0 then
	vim.fn.map(removed_plugins, "delete(v:val, 'rf')")
	vim.fn['dein#recache_runtimepath']()
end

local opt = vim.opt

-- エンコーディング
-- opt.encoding = 'utf-8'
-- opt.scriptencoding = 'utf-8'

opt.termguicolors = true

-- 不可視文字を表示
opt.list = true
opt.listchars = {tab = '>>-', trail = '-', nbsp = '+'}


-- 行番号を表示
opt.number = true
opt.relativenumber = true;

-- タブの大きさを変更
opt.autoindent = true
opt.shiftwidth = 4
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4

-- キーマップ
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('i', 'っｊ', '<Esc>')
vim.keymap.set('n', '<Down>', '<C-w>j')
vim.keymap.set('n', '<Up>', '<C-w>k')
vim.keymap.set('n', '<Left>', '<C-w>h')
vim.keymap.set('n', '<Right>', '<C-w>l')
vim.keymap.set('v', '<', '<gv');
vim.keymap.set('v', '>', '>gv');
vim.keymap.set('n', 'p', ']p');
vim.keymap.set('n', 'P', ']P');
vim.keymap.set('n', 'Y', 'y$');
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')

-- setup lsp
local mason = require('mason')
mason.setup({
	ui = {
		icons = {
			package_installed = "^",
			package_pending = "~",
			package_uninstalled = "|"
		}
	}
})
local nvim_lsp = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup_handlers({ function(server_name)
	local opts = {}
	opts.on_attach = function(_, bufnr)
	end
		nvim_lsp[server_name].setup(opts)
end })

-- カラースキーマを設定
-- syntax enable
-- vim.cmd(autocmd vimenter * ++nested colorscheme gruvbox)
-- vim.cmd([[colorscheme gruvbox]])
-- vim.o.background = "dark"
