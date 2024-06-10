return {
    'folke/trouble.nvim',
    event = 'BufReadPre',
    -- branch = 'dev', -- for beta v3
    opts = {},
    keys = {
        {
            '<leader>vE',
            '<cmd>Trouble<cr>',
            'n',
            desc = 'Trouble',
        },
        {
            -- '<S-e>',
            '<leader>ve',
            '<cmd>Trouble diagnostics toggle<cr>',
            'n',
            desc = 'Toggle diagnostics',
        },
    },
}
