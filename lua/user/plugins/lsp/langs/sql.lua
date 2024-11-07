return {
    -- SQL/db
    {
        'tpope/vim-dadbod',
        event = 'BufRead *.sql',
        enabled = _G.user.sql_dadbod_plugin,
        ft = 'sql',
        -- lazy = true,
        dependencies = {
            'kristijanhusak/vim-dadbod-completion',
            'kristijanhusak/vim-dadbod-ui',
        },
        config = function()
            vim.keymap.set(
                'n',
                '<leader>Do',
                '<cmd>DBUIToggle<cr>',
                { desc = '[D]b T[o]ggle DBUI' }
            )

            vim.keymap.set(
                'n',
                '<leader>Dc',
                '<cmd>DBUIAddConnection<cr>',
                { desc = '[D]b [C]onnection' }
            )

            vim.keymap.set(
                'n',
                '<leader>Df',
                '<cmd>DBUIFindBuffer<cr>',
                { desc = '[D]b [F]ind Buffer' }
            )

            vim.keymap.set(
                'n',
                '<leader>Dr',
                '<cmd>DBUIRenameBuffer<cr>',
                { desc = '[D]b [R]ename Buffer' }
            )

            vim.keymap.set(
                'n',
                '<leader>Dl',
                '<cmd>DBUILastQueryInfo<cr>',
                { desc = '[D]b [L]ast Query Info' }
            )
        end,
        cmd = {
            'DBUIToggle',
            'DBUI',
            'DBUIAddConnection',
            'DBUIFindBuffer',
            'DBUIRenameBuffer',
            'DBUILastQueryInfo',
        },
    },

    -- 'nanotee/sqls.nvim',
}
