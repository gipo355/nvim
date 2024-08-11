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
        {
            '<leader>vo',
            '<cmd>Trouble lsp_document_symbols toggle pinned=true win.relative=win win.position=right multiline=false<cr>',
            desc = 'Symbols (Trouble)',
        },
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
