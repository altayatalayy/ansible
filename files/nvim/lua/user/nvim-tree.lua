local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then
    return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
    diagnostics = {
        enable = true,
        show_on_dirs = false,
    }
})

wk.register({
    ["<leader>n"] = {
        name = '+NvimTree',
        f = { ":NvimTreeFocus<CR>", 'focus' },
        t = { ":NvimTreeToggle<CR>", 'toggle' },
    },
}, { mode = 'n', silent = true, noremap = true, })
