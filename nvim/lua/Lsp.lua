-- Setup lsp
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
