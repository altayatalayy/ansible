local vim = vim

-- Use a protected call
local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
	vim.notify('Couldn\'t load lualine')
	return
end

lualine.setup({theme = 'tokyonight'})
