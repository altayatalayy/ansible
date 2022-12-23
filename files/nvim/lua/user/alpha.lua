local status_ok, alpha = pcall(require,'alpha')
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New File" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  > Find File", ":Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "w", "  > Find Word", ":Telescope live_grep<CR>"),
    dashboard.button( "b", "  > File Browser", ":Telescope file_browser<CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

local custom_header = {
  [[          ▀████▀▄▄              ▄█ ]],
  [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
  [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
  [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
  [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
  [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
  [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
  [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
  [[   █   █  █      ▄▄           ▄▀   ]],
}

dashboard.section.header.val = custom_header
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd('autocmd FileType alpha setlocal nofoldenable')
