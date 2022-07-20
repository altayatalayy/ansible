local vim = vim

-- Use a protected call
local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
	vim.notify('Couldn\'t load lsp-installer')
	return
end


-- local servers = { 'pyright', 'gopls', 'clangd', 'cmake', 'sumneko_lua' }
lsp_installer.setup()
