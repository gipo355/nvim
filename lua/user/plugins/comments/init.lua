local set_desc = require('user.utils.functions').set_keymap_desc

return {
    { 'JoosepAlviste/nvim-ts-context-commentstring', event = 'BufReadPre' },

    {
        'numToStr/Comment.nvim',
        event = 'BufReadPre',
        opts = {},
        config = function()
            -- vim.keymap.set(
            --     'n',
            --     '<M-/>',
            --     "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
            --     opts
            -- )
            vim.keymap.set(
                { 'n', 'v' },
                '<leader>/',
                '<Plug>(comment_toggle_linewise_current)',
                set_desc('comment')
            )
            vim.keymap.set(
                { 'v' },
                '<leader>/',
                '<Plug>(comment_toggle_linewise_visual)',
                set_desc('comment')
            )
        end,
    },
}
