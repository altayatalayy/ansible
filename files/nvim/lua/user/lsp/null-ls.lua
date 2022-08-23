local vim = vim

-- Use a protected call
local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics


null_ls.setup({
    debug = false,
    sources = {
        -- Python
        formatting.black,
        diagnostics.flake8,
        diagnostics.pydocstyle, -- x
        -- JS
        formatting.eslint, -- x
        -- diagnostics.eslint,
        -- ansible
        diagnostics.ansiblelint, -- x
        -- yaml
        diagnostics.yamllint,
        -- lua
        formatting.stylua, -- x
        -- c/c++
        diagnostics.cppcheck, -- x
        -- shell
        diagnostics.shellcheck,
        -- rst
        diagnostics.rstcheck, -- x
        -- text
        diagnostics.codespell,
        -- git
        diagnostics.gitlint,
        -- docker
        diagnostics.hadolint,
    }
})
