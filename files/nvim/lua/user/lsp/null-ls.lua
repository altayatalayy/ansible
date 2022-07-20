local vim = vim

-- Use a protected call
local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
	vim.notify('Couldn\'t load null-ls')
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics


null_ls.setup({
    debug = false,
    sources = {
        -- Python
        formatting.black,
        diagnostics.flake8,
        -- JS
        formatting.eslint,
        diagnostics.eslint,
        -- ansible
        diagnostics.ansiblelint,
        -- yaml
        diagnostics.yamllint,
        -- lua
        formatting.stylua,
    }
})
