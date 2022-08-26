local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then
	return
end

-- Mappings.
wk.register({
  s = {":HopChar1<CR>", 'HopChar1'},
  sw = {":HopWord<CR>", 'HopWord'},
  ["<leader>g"] = {
    name = '+git',
    d = {
      name = '+Diffview',
      o = {":DiffviewOpen<CR>", 'open'},
      c = {":DiffviewClose<CR>", 'close'},
      f = {":DiffviewFileHistory<CR>", 'history'},
    },
  },

  ["<leader>n"] = {
    name = '+NvimTree',
    f = {":NvimTreeFocus<CR>", 'focus'},
    t = {":NvimTreeToggle<CR>", 'toggle'},
  },

  ['<leader>w'] = {
    name = '+Window',
    ['|'] = {':vs<CR>', 'vertical split'},
    ['-'] = {':sp<CR>', 'horizontal split'},
    tn = {':tabnew<CR>', 'tabnew'},
    tk = {':tabnext<CR>', 'tabnext'},
    tj = {':tabprev<CR>', 'tabprev'},
    to = {':tabo<CR>', 'tabo'},
    l = {'<C-W><C-L>', 'right'},
    h = {'<C-W><C-H>', 'left'},
    k = {'<C-W><C-K>', 'up'},
    j = {'<C-W><C-J>', 'down'},
  },

  ["<C-p>"] = {"<Plug>MarkdownPreviewToggle", 'MarkdownPreviewToggle'},
  ['<C-S>'] = {':%s/', ''},
  }, { mode = 'n', silent = true, noremap = true, })

wk.register({
["<Esc>"] = {"<C-\\><C-n>", ''},
  }, { mode = 't', silent = true, noremap = true, })
