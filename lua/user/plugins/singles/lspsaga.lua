local set_desc = require('user.utils.functions').set_keymap_desc
return {
    'nvimdev/lspsaga.nvim',
    enabled = _G.user.additional_plugins.lspsaga,
    event = 'BufReadPre',
    -- event = 'LspAttach',
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons', -- optional
    },
    config = function()
        require('lspsaga').setup({
            -- gutter signs
            lightbulb = {
                virtual_text = false,
                sign = true,
            },
            ui = {
                code_action = '󱐌',
            },
        })

        vim.keymap.set(
            'n',
            'gt',
            '<cmd>Lspsaga goto_type_definition<cr>',
            set_desc('Lsp code action')
        )

        vim.keymap.set(
            'n',
            '<leader>vr',
            '<cmd>Lspsaga rename<cr>',
            set_desc('Lsp rename')
        )

        vim.keymap.set(
            'n',
            '<leader>vf',
            '<cmd>Lspsaga finder<cr>',
            set_desc('Lspsaga finder')
        )

        vim.keymap.set(
            'n',
            '<leader>vO',
            '<cmd>Lspsaga outline<cr>',
            set_desc('Lsp outline')
        )

        vim.keymap.set(
            'n',
            '<leader>vd',
            '<cmd>Lspsaga peek_definition<cr>',
            set_desc('Lsp peek definition')
        )

        -- TODO: reduce the providers of type defs etc. telescope, fzf-lua, glance, lspsaga, builtin etc.
        vim.keymap.set(
            'n',
            '<leader>vt',
            '<cmd>Lspsaga peek_type_definition<cr>',
            set_desc('Lsp peek type def')
        )

        vim.keymap.set(
            'n',
            '<leader>vA',
            '<cmd>Lspsaga code_action<cr>',
            set_desc('Lsp code action')
        )

        vim.keymap.set(
            'n',
            '<leader>vh',
            '<cmd>Lspsaga hover_doc<cr>',
            set_desc('Lsp hover doc')
        )
    end,
}
