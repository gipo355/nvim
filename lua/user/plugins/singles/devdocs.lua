local set_desc = require('user.utils.functions').set_keymap_desc
return {
    'luckasRanarison/nvim-devdocs',
    enabled = _G.user.additional_plugins.devdocs,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'ellisonleao/glow.nvim',
        'nvim-telescope/telescope.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    -- opts = {},
    keys = {
        {
            '<leader>hi',
            '<cmd>DevdocsFetch<cr>',
            'n',
            set_desc('devdocs fetch'),
        },
        {
            '<leader>hI',
            '<cmd>DevdocsInstall<cr>',
            'n',
            set_desc('devdocs install'),
        },
        {
            '<leader>ho',
            '<cmd>DevdocsOpen<cr>',
            'n',
            set_desc('devdocs open'),
        },
        {
            '<leader>hf',
            '<cmd>DevdocsOpenFloat<cr>',
            'n',
            set_desc('devdocs open float'),
        },
        {
            '<leader>hu',
            '<cmd>DevdocsUpdateAll<cr>',
            'n',
            set_desc('devdocs update all'),
        },
    },
    config = function()
        require('nvim-devdocs').setup({
            wrap = true, -- text wrap, only applies to floating window
            previewer_cmd = vim.fn.executable('glow') == 1 and 'glow' or nil,
            cmd_args = { '-s', 'dark', '-w', '80' },
            picker_cmd = true,
            picker_cmd_args = { '-s', 'dark', '-w', '50' },
            float_win = { -- passed to nvim_open_win(), see :h api-floatwin
                relative = 'editor',
                height = 35,
                width = 125,
                border = 'rounded',
            },
            after_open = function()
                vim.api.nvim_feedkeys(
                    vim.api.nvim_replace_termcodes(
                        '<C-\\><C-n>',
                        true,
                        false,
                        true
                    ),
                    'n',
                    true
                )
            end,

            -- previewer_cmd = "glow",
            -- cmd_args = { "-s", "dark", "-w", "80" },

            -- picker_cmd = "glow",
            -- picker_cmd_args = { "-s", "dark", "-w", "50" }, -- example using glow: { "-s", "dark", "-w", "50" }
            -- after_open = function(bufnr) end,               -- callback that runs after the Devdocs window is opened. Devdocs buffer ID will be passed in
        })

        -- vim.keymap.set(
        --     'n',
        --     '<leader>hi',
        --     '<cmd>DevdocsFetch<cr>',
        --     set_desc('devdocs fetch')
        -- )
        --
        -- vim.keymap.set(
        --     'n',
        --     '<leader>hI',
        --     '<cmd>DevdocsInstall<cr>',
        --     set_desc('devdocs install')
        -- )
        --
        -- vim.keymap.set(
        --     'n',
        --     '<leader>ho',
        --     '<cmd>DevdocsOpen<cr>',
        --     set_desc('devdocs open')
        -- )
        --
        -- vim.keymap.set(
        --     'n',
        --     '<leader>hf',
        --     '<cmd>DevdocsOpenFloat<cr>',
        --     set_desc('devdocs open float')
        -- )
        --
        -- vim.keymap.set(
        --     'n',
        --     '<leader>hu',
        --     '<cmd>DevdocsUpdateAll<cr>',
        --     set_desc('devdocs update all')
        -- )
    end,
}
