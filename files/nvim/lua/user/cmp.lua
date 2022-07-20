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

require("luasnip.loaders.from_vscode").lazy_load()

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
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
	})
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
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
    'pyright',
    'gopls',
    'clangd',
    'cmake',
    'sumneko_lua',
    'jdtls',
    'csharp_ls',
    'html',
    'cssls',
    'awk_ls',
    'eslint',
    'rust_analyzer',
    'sourcekit',
    'texlab',
    'yamlls',
    'marksman',
    'julials'
}

for _, lsp in ipairs(servers) do
	require('lspconfig')[lsp].setup {
		capabilities = capabilities
	}
end
