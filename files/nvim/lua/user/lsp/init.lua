local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    return
end

local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then
    return
end

local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
    return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
    return
end

local status, saga = pcall(require, "lspsaga")
if (not status) then return end
saga.init_lsp_saga()



local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local status_ok, keymaps = pcall(require, 'user.lsp.keymaps.base')
    if status_ok then
        keymaps(bufnr)
    end

    local status_ok, keymaps = pcall(require, 'user.lsp.keymaps.' .. client.name)
    if status_ok then
        keymaps(bufnr)
    end
end

-- LSP diagnostics options
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    signs = true,
}
)

vim.diagnostic.config({
    virtual_text = false,
})

vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
--vim.cmd [[autocmd CursorHold,CursorHoldI * Lspsaga show_line_diagnostics]]

-- LSP Autocomplete
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Add additional capabilities supported by nvim-cmp
--local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- folding (ufo) settings
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

local servers = {
    'pyright',
    'gopls',
    'clangd',
    'cmake',
    'sumneko_lua',
    'html',
    'cssls',
    'awk_ls',
    'eslint',
    'tsserver',
    'rust_analyzer',
    'texlab',
    'yamlls',
    'marksman',
    'bashls',
    'ansiblels',
}

local all_mason = {}
--[[ for s in servers do table.insert(all_mason, s) end ]]
vim.list_extend(all_mason, servers)
vim.list_extend(all_mason, { 'jdtls' })

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
mason_lspconfig.setup({ ensure_installed = all_mason })

for _, lsp in ipairs(servers) do
    local server_config = {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    local config = {}

    if lsp == 'sumneko_lua' then
        config = require('user.lsp.server-settings.sumneko_lua')
    end

    for k, v in pairs(config) do server_config[k] = v end

    lspconfig[lsp].setup(server_config)
end

require('user.lsp.null-ls')
