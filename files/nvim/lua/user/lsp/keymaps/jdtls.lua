local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then
    return
end

return function(bufnr)
    wk.register({
        ["<leader>lj"] = {
            name = '+java',
            o = { ":lua require'jdtls'.organize_imports()<CR>", 'organize_imports' },
            v = { ":lua require('jdtls').extract_variable()<CR>", 'extract_variable' },
            c = { ":lua require('jdtls').extract_constant()<CR>", 'extract_constant' },
        }
    }, { mode = 'n', silent = true, noremap = true, buffer = bufnr })

    wk.register({
        ["<leader>lj"] = {
            name = '+java',
            v = { "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", 'organize_imports' },
            c = { "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", 'extract_constant' },
            m = { "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR> ", 'extract_variable' },
        }
    }, { mode = 'v', silent = true, noremap = true, buffer = bufnr })

    wk.register({
        ["<leader>d"] = {
            t = { ":lua require'jdtls'.test_class()<CR>", 'test class' },
            m = { ":lua require'jdtls'.test_nearest_method()<CR>", 'test method' },
        }
    }, { mode = 'n', silent = true, noremap = true, buffer = bufnr })
end
