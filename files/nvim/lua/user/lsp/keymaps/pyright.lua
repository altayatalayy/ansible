local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then
    return
end

return function(bufnr)
    wk.register({
        ["<leader>d"] = {
            t = { ":lua require('dap-python').test_method()<CR>", 'test method' },
        }
    }, { mode = 'n', silent = true, noremap = true, buffer = bufnr })
end
