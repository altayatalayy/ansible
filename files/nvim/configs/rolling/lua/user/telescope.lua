local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
	return
end

local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then
	return
end

wk.register({
  ["<leader>t"] = {
    name = '+Telescope',
    f = {':Telescope find_files<CR>', 'find files'},
    r = {':Telescope file_browser<CR>', 'file browser'},
    g = {':Telescope git_files<CR>', 'git files'},
    l = {':Telescope live_grep<CR>', 'live grep'},
    k = {':Telescope keymaps<CR>', 'keymaps'},
    b = {':Telescope buffers<CR>', 'buffers'},
    c = {':Telescope neoclip<CR>', 'neoclip'},
    d = {':Telescope diagnostics<CR>', 'diagnostics'},
  }
  }, { mode = 'n', silent = true, noremap = true, })

telescope.load_extension('fzf')
telescope.load_extension('file_browser')
telescope.load_extension('tmux')
telescope.load_extension('neoclip')
telescope.load_extension('media_files')
telescope.load_extension('dap')
telescope.load_extension("notify")
telescope.load_extension("ui-select")
