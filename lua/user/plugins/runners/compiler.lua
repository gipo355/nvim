local set_desc = require('user.utils.functions').set_keymap_desc
-- Run code in nvim
-- The task runner we use, overseer + compiler.nvim
return {
    {
        'Zeioth/compiler.nvim',
        event = 'BufReadPre',
        cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
        dependencies = {
            {
                'stevearc/overseer.nvim',
                init = function()
                    require('overseer').setup()
                end,
            },
        },
        config = function()
            require('compiler').setup()

            vim.api.nvim_buf_set_keymap(
                0,
                'n',
                '<F6>',
                '<cmd>CompilerOpen<cr>',
                set_desc('open compiler')
            )

            vim.keymap.set(
                'n',
                '<leader>Mt',
                '<cmd>CompilerToggleResults<cr>',
                set_desc('toggle compiler results')
            )

            vim.keymap.set(
                'n',
                '<leader>Mo',
                '<cmd>CompilerOpen<cr>',
                set_desc('open compiler')
            )
            vim.keymap.set(
                'n',
                '<leader>Mr',
                '<cmd>CompilerRedo<cr>',
                set_desc('compiler redo')
            )

            vim.keymap.set(
                'n',
                '<leader>Mc',
                '<cmd>OverseerRun<cr>',
                set_desc('run overseer')
            )
        end,
    },
    {
        'stevearc/overseer.nvim',
        event = 'BufReadPre',
        commit = '6271cab7ccc4ca840faa93f54440ffae3a3918bd',
        cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
        opts = {
            task_list = {
                direction = 'bottom',
                min_height = 25,
                max_height = 25,
                default_detail = 1,
            },
        },
    },
}
