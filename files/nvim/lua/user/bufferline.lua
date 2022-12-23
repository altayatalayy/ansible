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
        name = '+buffers',
        n = { ":BufferLineCycleNext<CR>", 'BufferLineCycleNext' },
        p = { ":BufferLineCyclePrev<CR>", 'BufferLineCyclePrev' },
        d = { ":bdelete<CR>", 'bdelete' },
        l = { ":BufferLineMoveNext<CR>", 'BufferLineMoveNext' },
        h = { ":BufferLineMovePrev<CR>", 'BufferLineMovePrev' },
    }
}, { mode = 'n', silent = true, noremap = true, })

bufferline.setup({
    options = {
        --[[ mode = "taabs", ]]
        separator_style = 'slant',
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true
    },
})
