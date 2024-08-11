local set_desc = require('user.utils.functions').set_keymap_desc
return {
    -- bufferline
    'akinsho/bufferline.nvim',
    -- version = '*',
    event = 'BufReadPre',
    enabled = _G.user.bufferline.enable,
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require('bufferline').setup({
            options = {
                tab_size = 10,
                diagnostics = 'nvim_lsp', -- false | "nvim_lsp" | "coc"
                hover = {
                    enable = true,
                },
                show_close_icon = false,
                show_buffer_close_icons = false,
                indicator = {
                    style = 'underline',
                },
                separator_style = 'slant', -- "slant" | "thick" | "thin" | { 'any', 'any' }
            },
        })
        -- navigate bufferline buffers
        vim.keymap.set(
            'n',
            '<',
            '<cmd>bprevious<cr>',
            set_desc('bufferline previous')
        )

        vim.keymap.set('n', '>', '<cmd>bnext<cr>', set_desc('bufferline next'))
    end,
}
