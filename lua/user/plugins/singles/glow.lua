return {
    'ellisonleao/glow.nvim',
    event = 'BufReadPre',
    keys = {
        {
            '<leader>hg',
            '<cmd>Glow<cr>',
            'n',
            desc = 'Glow markdown',
        },
    },
    cmd = 'Glow',
    config = function()
        require('glow').setup({
            width_ratio = 0.9, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
            height_ratio = 0.9,
        })
    end,
}
