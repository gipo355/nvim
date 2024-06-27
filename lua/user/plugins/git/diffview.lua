local set_desc = require('user.utils.functions').set_keymap_desc
return {
    'sindrets/diffview.nvim',
    event = 'VeryLazy',
    config = function()
        require('diffview').setup({
            enhanced_diff_hl = true,
            view = {
                x = {
                    layout = 'diff3_mixed',
                },
            },
            hooks = {
                diff_buf_read = function(bufnr)
                    -- Change local options in diff buffers
                    vim.opt_local.wrap = false
                    vim.opt_local.list = false
                    vim.opt_local.colorcolumn = { 80 }
                    vim.keymap.set(
                        'n',
                        '<C-c>',
                        '<cmd>DiffviewClose<cr>',
                        set_desc('Close DiffView')
                    )
                    vim.keymap.set(
                        'n',
                        '<Esc>',
                        '<cmd>DiffviewClose<cr>',
                        set_desc('Close DiffView')
                    )
                end,
                view_opened = function(view)
                    print(
                        ('A new %s was opened on tab page %d!'):format(
                            view.class:name(),
                            view.tabpage
                        )
                    )
                    vim.opt_local.wrap = false
                    vim.opt_local.list = false
                    vim.opt_local.colorcolumn = { 80 }
                    vim.keymap.set(
                        'n',
                        '<C-c>',
                        '<cmd>DiffviewClose<cr>',
                        set_desc('Close DiffView')
                    )
                    vim.keymap.set(
                        'n',
                        '<Esc>',
                        '<cmd>DiffviewClose<cr>',
                        set_desc('Close DiffView')
                    )
                end,
            },
        })
        vim.keymap.set(
            'n',
            '<leader>gdc',
            '<cmd>DiffviewClose<cr>',
            set_desc('Close DiffView')
        )
        vim.keymap.set(
            'n',
            '<leader>gdo',
            '<cmd>DiffviewOpen<cr>',
            set_desc('Open DiffView')
        )
        vim.keymap.set('n', '<leader>gda', function()
            --  Examples:
            -- :DiffviewOpen
            -- :DiffviewOpen HEAD~2
            -- :DiffviewOpen HEAD~4..HEAD~2
            -- :DiffviewOpen d4a7b0d
            -- :DiffviewOpen d4a7b0d^!
            -- :DiffviewOpen d4a7b0d..519b30e
            -- :DiffviewOpen origin/main...HEAD
            -- :DiffviewOpen main..dev
            -- ask for input for initial commit value, displaying auto-completion suggestion
            local initial_commit =
                vim.fn.input('Starting point (branch or commit): ')

            -- ask for input for last commit value, displaying auto-completion suggestion
            local last_commit =
                vim.fn.input('Ending point (branch or commit): ')

            if last_commit == '' then
                return vim.cmd('DiffviewOpen ' .. initial_commit)
            end

            vim.cmd('DiffviewOpen ' .. initial_commit .. '..' .. last_commit)
        end, set_desc('Open DiffView For Range'))
        vim.keymap.set(
            { 'n', 'v' },
            '<leader>gdf',
            '<cmd>DiffviewFileHistory<cr>',
            set_desc('DiffView File History')
        )
        vim.keymap.set(
            { 'n', 'v' },
            '<leader>gdt',
            '<cmd>DiffviewToggleFiles<cr>',
            set_desc('Toggle DiffView Files panel')
        )
        vim.keymap.set(
            'n',
            '<leader>gdr',
            '<cmd>DiffviewRefresh<cr>',
            set_desc('Refresh DiffView')
        )
    end,
}
