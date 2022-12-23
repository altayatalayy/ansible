local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then
	return
end

local bundles = {
  vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
}
vim.list_extend(bundles, vim.split(vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/java-test/extension/server/*.jar"), "\n"))

local os_type = 'linux'
if vim.loop.os_uname().sysname == 'Darwin' then
  os_type = 'mac'
end

local M = {
  -- The command that starts the language server
  cmd = {
    'java',

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    '-jar', vim.fn.glob(vim.fn.stdpath("data") .. '/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
    '-configuration', vim.fn.stdpath("data") .. '/mason/packages/jdtls/config_' .. os_type,
    '-data', 'workspaces/'
  },

  init_options = {
    bundles = bundles
  },

  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle'}),

  on_attach = function (client, bufnr)
    require('jdtls.setup').add_commands()
    require('jdtls').setup_dap({ hotcodereplace = 'auto' })
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
}

return M
