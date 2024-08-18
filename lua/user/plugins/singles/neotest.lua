local set_desc = require('user.utils.functions').set_keymap_desc
return {
    'nvim-neotest/neotest',
    event = 'BufReadPre',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-neotest/nvim-nio',
        'nvim-treesitter/nvim-treesitter',
        'antoinemadec/FixCursorHold.nvim',
        'marilari88/neotest-vitest',
        'nvim-neotest/neotest-go',
        -- 'folke/neodev.nvim',
    },
    keys = {
        {
            '<leader>ts',
            '<cmd>Neotest summary toggle<cr>',
            'n',
            set_desc('Neotest summary'),
        },
        {
            '<leader>to',
            '<cmd>Neotest output-panel toggle<cr>',
            'n',
            set_desc('Neotest output'),
        },
        {
            '<leader>tr',
            '<cmd>Neotest run file<cr>',
            'n',
            set_desc('Neotest run file'),
        },
        {
            '<leader>tl',
            '<cmd>Neotest run last<cr>',
            'n',
            set_desc('Neotest run last'),
        },
        {
            '<leader>tx',
            '<cmd>Neotest stop<cr>',
            'n',
            set_desc('Neotest stop'),
        },
        {
            '<leader>ta',
            '<cmd>Neotest attach<cr>',
            'n',
            set_desc('Neotest attach'),
        },
    },
    config = function()
        require('neotest').setup({
            adapters = {
                require('neotest-vitest'),
                ['neotest-go'] = {
                    -- Here we can set options for neotest-go, e.g.
                    -- args = { "-tags=integration" }
                    recursive_run = true,
                },
            },
        })
        -- require('neodev').setup({
        --     library = { plugins = { 'neotest' }, types = true },
        -- })
    end,
}
