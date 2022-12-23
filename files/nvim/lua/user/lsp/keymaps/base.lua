local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then
    return
end

return function(bufnr)
    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    wk.register({
        ["<leader>l"] = {
            name = '+LSP',
            p = { ':lua vim.diagnostic.goto_prev()<CR>', 'diagnostic goto prev' },
            n = { ':lua vim.diagnostic.goto_next()<CR>', 'diagnostic goto next' },
            s = { ':lua vim.diagnostic.setloclist()<CR>', 'diagnostic setloclist' },
            x = { ":TroubleToggle<CR>", 'TroubleToggle' },
            q = { ":TroubleToggle quickfix<CR>", 'Trouble quickfix' },
        }
    }, { mode = 'n', silent = true, noremap = true, })

    wk.register({
        ["<leader>l"] = {
            name = '+LSP',
            --[[ D = { ':lua vim.lsp.buf.declaration()<CR>', 'declaration' }, ]]
            --[[ d = { ':lua vim.lsp.buf.definition()<CR>', 'definition' }, ]]
            --[[ g = { ':lua vim.lsp.buf.references()<CR>', 'references' }, ]]
            --[[ i = { ':lua vim.lsp.buf.implementation()<CR>', 'implementation' }, ]]
            d = { ':Lspsaga lsp_finder<CR>', 'lsp finder' },
            h = { ':Lspsaga hover_doc<CR>', 'hover' },
            k = { ':lua vim.lsp.buf.signature_help()<CR>', 'signature_help' },
            t = { ':lua vim.lsp.buf.type_definition()<CR>', 'type_definition' },
            r = { ':lua vim.lsp.buf.rename()<CR>', 'rename' },
            c = { ':lua vim.lsp.buf.code_action()<CR>', 'code_action' },
            f = { ':lua vim.lsp.buf.format({async = true})<CR>', 'formatting' },
            w = {
                name = '+Workspace',
                a = { ':lua vim.lsp.buf.add_workspace_folder()<CR>', 'add_workspace_folder' },
                r = { ':lua vim.lsp.buf.remove_workspace_folder()<CR>', 'remove_workspace_folder' },
                l = { ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'list_workspace_folders' },
            },
        }
    }, { mode = 'n', silent = true, noremap = true, buffer = bufnr })
end
