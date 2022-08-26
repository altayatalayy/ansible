local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
	return
end

local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then
	return
end

require('mason-lspconfig').setup({automatic_installation = true})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
wk.register({
  ["<leader>l"] = {
    name = '+LSP',
    e = {':lua vim.diagnostic.open_float()<CR>', 'diagnostic open float'},
    p = {':lua vim.diagnostic.goto_prev()<CR>', 'diagnostic goto prev'},
    n = {':lua vim.diagnostic.goto_next()<CR>', 'diagnostic goto next'},
    s = {':lua vim.diagnostic.setloclist()<CR>', 'diagnostic setloclist'},
    x = {":TroubleToggle<CR>", 'TroubleToggle'},
    q = {":TroubleToggle quickfix<CR>", 'Trouble quickfix'},
    l = {":lua require('lsp_lines').toggle()<CR>", 'toggle lines'},
  }
  }, { mode = 'n', silent = true, noremap = true, })

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
  wk.register({
    ["<leader>l"] = {
      name = '+LSP',
      D = {':lua vim.lsp.buf.declaration()<CR>', 'declaration'},
      d = {':lua vim.lsp.buf.definition()<CR>', 'definition'},
      K = {':lua vim.lsp.buf.hover()<CR>', 'hover'},
      i = {':lua vim.lsp.buf.implementation()<CR>', 'implementation'},
      k = {':lua vim.lsp.buf.signature_help()<CR>', 'signature_help'},
      t = {':lua vim.lsp.buf.type_definition()<CR>', 'type_definition'},
      r = {':lua vim.lsp.buf.rename()<CR>', 'rename'},
      c = {':lua vim.lsp.buf.code_action()<CR>', 'code_action'},
      g = {':lua vim.lsp.buf.references()<CR>', 'references'},
      f = {':lua vim.lsp.buf.formatting()<CR>', 'formatting'},
      w = {
        name = '+Workspace',
        a = {':lua vim.lsp.buf.add_workspace_folder()<CR>', 'add_workspace_folder'},
        r = {':lua vim.lsp.buf.remove_workspace_folder()<CR>', 'remove_workspace_folder'},
        l = {':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'list_workspace_folders'},
      },
    }
    }, { mode = 'n', silent = true, noremap = true, buffer = bufnr})

    if client.name == 'pyright' then
      wk.register({
        ["<leader>d"] = {
          t = {":lua require('dap-python').test_method()<CR>", 'test method'},
        }
        }, { mode = 'n', silent = true, noremap = true, buffer = bufnr})
    end

    if client.name == 'jdtls' then
      wk.register({
        ["<leader>lj"] = {
          name = '+java',
          o =  {":lua require'jdtls'.organize_imports()<CR>", 'organize_imports'},
          v = {":lua require('jdtls').extract_variable()<CR>", 'extract_variable'},
          c = {":lua require('jdtls').extract_constant()<CR>", 'extract_constant'},
        }
        }, { mode = 'n', silent = true, noremap = true, buffer = bufnr})

      wk.register({
        ["<leader>lj"] = {
          name = '+java',
          v = {"<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", 'organize_imports'},
          c = {"<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", 'extract_constant'},
          m = {"<Esc><Cmd>lua require('jdtls').extract_method(true)<CR> ", 'extract_variable'},
        }
        }, { mode = 'v', silent = true, noremap = true, buffer = bufnr})

      wk.register({
        ["<leader>d"] = {
          t = {":lua require'jdtls'.test_class()<CR>", 'test class'},
          m = {":lua require'jdtls'.test_nearest_method()<CR>", 'test method'},
        }
        }, { mode = 'n', silent = true, noremap = true, buffer = bufnr})

      require('jdtls').start_or_attach(require('user.lsp.server-settings.jdtls'))
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

-- LSP Autocomplete
vim.opt.completeopt = {"menu", "menuone", "noselect"}

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

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
    'jdtls',
    'csharp_ls',
    'html',
    'cssls',
    'awk_ls',
    'eslint',
    'tsserver',
    'rust_analyzer',
    'sourcekit',
    'texlab',
    'yamlls',
    'marksman',
    'julials',
    'bashls',
    'ansiblels',
}

for _, lsp in ipairs(servers) do
  local server_config = {
      on_attach = on_attach,
      capabilities = capabilities,
  }

  local config = {}

  if lsp == 'sumneko_lua' then
    config = require('user.lsp.server-settings.sumneko_lua')
  end

  for k,v in pairs(config) do server_config[k] = v end

	lspconfig[lsp].setup(server_config)
end

require('user.lsp.null-ls')
