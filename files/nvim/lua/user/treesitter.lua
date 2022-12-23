-- Use a protected call
local status_ok, treesitter = pcall(require, 'nvim-treesitter')
if not status_ok then
	return
end

require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {
      'python',
      'lua',
      'julia',
      'c',
      'cpp',
      'c_sharp',
      'cmake',
      'ninja',
      'llvm',
      'cuda',
      'glsl',
      'gdscript',
      'rust',
      'java',
      'kotlin',
      'scala',
      'javascript',
      'typescript',
      'html',
      'http',
      'json',
      'json5',
      'css',
      'vue',
      'dart',
      'go',
      'gomod',
      'gowork',
      'make',
      'regex',
      'vim',
      'yaml',
      'toml',
      'rst',
      'markdown',
      'dockerfile',
      'bash',
      'fish',
      'comment',
      'norg',
      'help',
  },

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}
