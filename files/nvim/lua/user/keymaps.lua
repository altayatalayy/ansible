local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then
	return
end

-- Mappings.
wk.register({
  s = {":HopChar1<CR>", 'HopChar1'},
  sw = {":HopWord<CR>", 'HopWord'},

  ['<leader>w'] = {
    name = '+Window',
    ['|'] = {':vs<CR>', 'vertical split'},
    ['-'] = {':sp<CR>', 'horizontal split'},
    t = {':tabnew %<CR>', 'tabnew'},
    n = {':tabnext<CR>', 'tabnext'},
    p = {':tabprev<CR>', 'tabprev'},
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

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
