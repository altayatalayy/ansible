local status_ok, zenmode = pcall(require, 'zen-mode')
if not status_ok then
  return
end

zenmode.setup {
  window = {
    backdrop = 0.95,
    options = {
      signcolumn = "no",
    }
  },
  plugins = {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    options = {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
    },
    twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false }, -- disables git signs
    tmux = { enabled = false },
  }
}

