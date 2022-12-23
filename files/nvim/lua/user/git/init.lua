local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then
    return
end

wk.register({
    ["<leader>g"] = {
        name = '+git',
        d = {
            name = '+Diffview',
            o = { ":DiffviewOpen<CR>", 'open' },
            c = { ":DiffviewClose<CR>", 'close' },
            f = { ":DiffviewFileHistory<CR>", 'history' },
        },
    },
}, { mode = 'n', silent = true, noremap = true, })

require('user.git.gitsigns')
