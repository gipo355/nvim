return {
    'folke/trouble.nvim',
    enabled = _G.user.trouble.enable,
    event = 'BufReadPre',
    -- branch = 'dev', -- for beta v3
    opts = {},
    -- 'Trouble symbols toggle pinned=true win.relative=win win.position=right'
    keys = {
        -- {
        --     '<leader>vO',
        --     '<cmd>Trouble symbols toggle focus=false<cr>',
        --     desc = 'Symbols (Trouble)',
        -- },
        -- {
        --     '<leader>vo',
        --     '<cmd>Trouble lsp_document_symbols toggle pinned=true win.relative=win win.position=right multiline=false<cr>',
        --     desc = 'Symbols (Trouble)',
        -- },
        -- {
        --     '<leader>vE',
        --     '<cmd>Trouble<cr>',
        --     'n',
        --     desc = 'Trouble',
        -- },
        -- {
        --     '<S-e>',
        --     '<leader>ve',
        --     '<cmd>Trouble diagnostics toggle<cr>',
        --     'n',
        --     desc = 'Toggle diagnostics',
        -- },
        {
            '<leader>xl',
            '<cmd>Trouble<cr>',
            'n',
            desc = 'Trouble',
        },
        {
            '<leader>xx',
            '<cmd>Trouble diagnostics toggle<cr>',
            desc = 'Diagnostics (Trouble)',
        },
        {
            '<leader>xX',
            '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
            desc = 'Buffer Diagnostics (Trouble)',
        },
        {
            '<leader>xS',
            '<cmd>Trouble symbols toggle focus=false<cr>',
            desc = 'Symbols (Trouble)',
        },
        {
            '<leader>xs',
            '<cmd>Trouble lsp_document_symbols toggle pinned=true win.relative=win win.position=right multiline=false<cr>',
            desc = 'Symbols (Trouble)',
        },
        {
            '<leader>xf',
            '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
            desc = 'LSP Definitions / references / ... (Trouble)',
        },
        {
            '<leader>xL',
            '<cmd>Trouble loclist toggle<cr>',
            desc = 'Location List (Trouble)',
        },
        {
            '<leader>xQ',
            '<cmd>Trouble qflist toggle<cr>',
            desc = 'Quickfix List (Trouble)',
        },
    },
    config = function()
        require('trouble').setup()

        -- if _G.user.trouble.show_symbols then
        --     vim.api.nvim_create_autocmd('BufReadPre', {
        --         pattern = '*',
        --         callback = function()
        -- vim.cmd(
        --     'Trouble lsp_document_symbols pinned=true win.relative=win win.position=right'
        -- )
        --         end,
        --     })
        -- end
    end,
}
