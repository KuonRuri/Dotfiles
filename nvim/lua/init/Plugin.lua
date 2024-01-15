local api = vim.api

local dein_dir = vim.fn.expand('~/.cache/dein')
local dein_repo_dir = dein_dir..'/repos/github.com/Shougo/dein.vim'

vim.o.runtimepath = dein_repo_dir..','..vim.o.runtimepath

-- dein install check
if (vim.fn.isdirectory(dein_repo_dir) == 0) then
  os.execute('git clone https://github.com/Shougo/dein.vim '..dein_repo_dir)
end

-- begin settings
if (vim.fn['dein#load_state'](dein_dir) == 1) then
  local rc_dir = vim.fn.expand('~/.config/nvim')
  local toml_nomal = rc_dir..'/Plugins/dein.toml'
  local toml_lazy = rc_dir..'/Plugins/dein_lazy.toml'
  --vim.cmd('leg g:dein#inline_vimrcs = ["lua/init/Keymaps", "lua/init/Options"]')
  vim.cmd("let g:dein#inline_vimrcs = ['~/.config/nvim/lua/init/Options.lua', '~/.config/nvim/lua/init/Keymaps.lua']")
  vim.fn['dein#begin'](dein_dir)
  vim.fn['dein#load_toml'](toml_nomal, { lazy = 0 })
  vim.fn['dein#load_toml'](toml_lazy, { lazy = 1 })
  vim.fn['dein#end']()
  vim.fn['dein#save_state']()
end

-- plugin install check
-- if (vim.fn['dein#check_install']() ~= 0) then
--   vim.fn['dein#install']()
-- end

-- plugin remove check
-- local removed_plugins = vim.fn['dein#check_clean']()
-- if vim.fn.len(removed_plugins) > 0 then
--   vim.fn.map(removed_plugins, "delete(v:val, 'rf')")
--   vim.fn['dein#recache_runtimepath']()
-- end
