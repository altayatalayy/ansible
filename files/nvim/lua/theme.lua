-- Use a protected call
local status_ok, onedark = pcall(require, 'onedark')
if not status_ok then
	vim.notify('Couldn\'t load onedark')
	return
end

onedark.setup {
    style = 'darker'
}

onedark.load()
