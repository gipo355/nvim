return {
    'cbochs/portal.nvim',
    keys = {
        {
            '<leader>o',
            '<cmd>Portal jumplist backward<cr>',
            'n',
            desc = 'Portal jumplist backward',
        },
        {
            '<leader>i',
            '<cmd>Portal jumplist forward<cr>',
            'n',
            desc = 'Portal jumplist forward',
        },
    },
    -- Optional dependencies
    dependencies = { 'cbochs/grapple.nvim' },
    opts = {},
}
