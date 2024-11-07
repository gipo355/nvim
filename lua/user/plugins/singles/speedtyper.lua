return {
    'NStefan002/speedtyper.nvim',
    enabled = _G.user.additional_plugins.speedtyper,
    keys = {
        {
            '<leader>hT',
            '<cmd>Speedtyper<cr>',
            'n',
        },
    },
    cmd = 'Speedtyper',
    opts = {
        -- your config
    },
}
