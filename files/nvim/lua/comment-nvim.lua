local vim = vim

-- Use a protected call
local status_ok, comment = pcall(require, 'Comment')
if not status_ok then
	vim.notify('Couldn\'t load Comment')
	return
end

comment.setup()
