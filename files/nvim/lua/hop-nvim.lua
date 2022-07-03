local vim = vim

-- Use a protected call
local status_ok, hop = pcall(require, 'hop')
if not status_ok then
	vim.notify('Couldn\'t load hop')
	return
end

hop.setup({
	multi_windows = true,
})
