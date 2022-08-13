local vim = vim

-- Use a protected call
local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
	vim.notify('Couldn\'t load cmp')
	return
end

local snip_status_ok, luasnip = pcall(require, 'luasnip')
if not snip_status_ok then
	vim.notify('Couldn\'t load luasnip')
	return
end

local lspkind_status_ok, lspkind = pcall(require, 'lspkind')
if not lspkind_status_ok then
    return
end

require("luasnip.loaders.from_vscode").lazy_load()
require("cmp_git").setup()

cmp.setup({
	snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = {
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-y>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
      }),
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp_signature_help' },
        { name = 'cmp_git' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer', keyword_length = 3 },
        { name = 'path' },
	}),
    formatting = {
        format = lspkind.cmp_format {
            mode = 'symbol_text',
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                path = "[path]",
                luasnip = "[snip]",
                cmp_git = "[git]",
            }
        }
    }
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' },
        { name = 'nvim_lua' },
    })
})

-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--
-- local servers = {
--     'pyright',
--     'gopls',
--     'clangd',
--     'cmake',
--     'sumneko_lua',
--     'jdtls',
--     'csharp_ls',
--     'html',
--     'cssls',
--     'awk_ls',
--     'eslint',
--     'rust_analyzer',
--     'sourcekit',
--     'texlab',
--     'yamlls',
--     'marksman',
--     'julials'
-- }
--
-- for _, lsp in ipairs(servers) do
-- 	require('lspconfig')[lsp].setup {
-- 		capabilities = capabilities
-- 	}
-- end
