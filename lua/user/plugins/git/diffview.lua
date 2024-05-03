local set_desc = require('user.utils.functions').set_keymap_desc
return {
    'sindrets/diffview.nvim',
    event = 'VeryLazy',
    config = function()
        require('diffview').setup({
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
                -- view_opened = function(view)
                --     print(
                --         ('A new %s was opened on tab page %d!'):format(
                --             view.class:name(),
                --             view.tabpage
                --         )
                --     )
                -- end,
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
        vim.keymap.set(
            'n',
            '<leader>gdf',
            '<cmd>DiffviewFileHistory<cr>',
            set_desc('DiffView File History')
        )
        vim.keymap.set(
            'n',
            '<leader>gdr',
            '<cmd>DiffviewRefresh<cr>',
            set_desc('Refresh DiffView')
        )
    end,
}
