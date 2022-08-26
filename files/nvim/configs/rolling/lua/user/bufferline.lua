local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
	return
end

local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then
	return
end

wk.register({
  ["<leader>b"] = {
      name = '+tabs',
      n = {":BufferLineCycleNext<CR>", 'BufferLineCycleNext'},
      p = {":BufferLineCyclePrev<CR>", 'BufferLineCyclePrev'},
      d = {":bdelete<CR>", 'bdelete'},
      mn = {":BufferLineMoveNext<CR>", 'BufferLineMoveNext'},
      mp = {":BufferLineMovePrev<CR>", 'BufferLineMovePrev'},
    }
  }, { mode = 'n', silent = true, noremap = true, })

bufferline.setup()
