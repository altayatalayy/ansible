local vim = vim
local status_ok, trouble = pcall(require,"trouble")
if not status_ok then
  return
end

trouble.setup()


local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
