local bundles = {
  vim.fn.glob(vim.fn.stdpath("config") .. "/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"),
}
vim.list_extend(bundles, vim.split(vim.fn.glob(vim.fn.stdpath("config") .. "/vscode-java-test/server/*.jar"), "\n"))

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
  end
}

return M
