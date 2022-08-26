local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
	return
end

local cmp_git_status_ok, cmp_git = pcall(require, 'cmp_git')
if not cmp_git_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, 'luasnip')
if not snip_status_ok then
	return
end

local lspkind_status_ok, lspkind = pcall(require, 'lspkind')
if not lspkind_status_ok then
    return
end

require("luasnip.loaders.from_vscode").lazy_load()
cmp_git.setup()

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

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

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' },
  }, {
    { name = 'buffer' },
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
        { name = 'path' },
        { name = 'cmdline' },
        { name = 'nvim_lua' },
    })
})
