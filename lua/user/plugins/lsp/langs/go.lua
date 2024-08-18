local set_desc = require('user.utils.functions').set_keymap_desc

return {
    {
        'ray-x/go.nvim',
        -- event = { 'CmdlineEnter' },
        ft = { 'go', 'gomod', 'gowork', 'tmpl', 'templ' },
        -- enabled = false,
        build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
        dependencies = {
            -- optional packages
            'ray-x/guihua.lua',
            'neovim/nvim-lspconfig',
            'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            require('go').setup({
                -- disable_defaults = true,
                -- go = 'go',

                -- goimports = 'gopls', -- if set to 'gopls' will use golsp format
                goimports = 'goimports-reviser', -- if set to 'gopls' will use golsp format
                comment_placeholder = '   ',
                -- gofmt = 'gopls', -- if set to gopls will use golsp format
                gofmt = 'gopls', -- if set to gopls will use golsp format
                lsp_cfg = false, -- buggy, disabled and copied directly into lspconfig. false = use your own lspconfig
                -- lsp_gofumpt = true, -- true = set default gofmt in gopls format to gofumpt, not needed if lsp_cfg = false
                lsp_on_attach = false, -- use on_attach from go.nvim
                dap_debug = true,

                -- using built in
                lsp_inlay_hints = {
                    enable = false, -- use built in
                    -- style = 'inlay',
                    -- only_current_line = false,
                    -- only_current_line_autocmd = 'CursorHold',
                },
                -- lsp_codelens = false,
                --
                -- dap_debug = true,
                -- dap_debug_keymap = true,
                -- dap_debug_vt = { enabled_commands = true, all_frames = true }, -- bool|table put your dap-virtual-text setup here set to false to disable
                --
                -- dap_port = 38697, -- can be set to a number, if set to -1 go.nvim will pick up a random port
                -- dap_timeout = 15, --  see dap option initialize_timeout_sec = 15,
                -- dap_retries = 20, -- see dap option max_retries
            })

            require('which-key').add({
                -- TODO: improve, must be only available for filetype go
                -- since i register the keymap in go plugin
                {
                    { '<leader>G', group = '[G]o' },
                    { '<leader>G_', hidden = true },
                },
            })

            --         c = { '<cmd>GoCmt<CR>', 'GoCmt' },
            --         a = { '<cmd>GoAddTag<CR>', 'GoAddTag' },
            --         r = { '<cmd>GoRmTag<CR>', 'GoRmTag' },
            --         t = { '<cmd>GoClearTag<CR>', 'GoClearTag' },
            --         s = { '<cmd>GoFillStruct<CR>', 'GoFillStruct' },
            --         w = { '<cmd>GoFillSwitch<CR>', 'GoFillSwitch' },
            --         i = { '<cmd>GoIfErr<CR>', 'GoIfErr' },
            --         f = { '<cmd>GoFixPlurals<CR>', 'GoFixPlurals' },
            --         m = { '<cmd>Gomvp<CR>', 'Gomvp' },

            vim.api.nvim_set_keymap(
                'n',
                '<leader>Gc',
                '<cmd>GoCmt<CR>',
                set_desc('GoCmt')
            )
            vim.api.nvim_set_keymap(
                'n',
                '<leader>Ga',
                '<cmd>GoAddTag<CR>',
                set_desc('GoAddTag')
            )
            vim.api.nvim_set_keymap(
                'n',
                '<leader>Gr',
                '<cmd>GoRmTag<CR>',
                set_desc('GoRmTag')
            )
            vim.api.nvim_set_keymap(
                'n',
                '<leader>Gt',
                '<cmd>GoClearTag<CR>',
                set_desc('GoClearTag')
            )
            vim.api.nvim_set_keymap(
                'n',
                '<leader>Gs',
                '<cmd>GoFillStruct<CR>',
                set_desc('GoFillStruct')
            )
            vim.api.nvim_set_keymap(
                'n',
                '<leader>Gw',
                '<cmd>GoFillSwitch<CR>',
                set_desc('GoFillSwitch')
            )
            vim.api.nvim_set_keymap(
                'n',
                '<leader>Gi',
                '<cmd>GoIfErr<CR>',
                set_desc('GoIfErr')
            )
            vim.api.nvim_set_keymap(
                'n',
                '<leader>Gf',
                '<cmd>GoFixPlurals<CR>',
                set_desc('GoFixPlurals')
            )
            vim.api.nvim_set_keymap(
                'n',
                '<leader>Gm',
                '<cmd>GoImpl<CR>',
                set_desc('GoImpl')
            )
            vim.api.nvim_set_keymap(
                'n',
                '<leader>Gg',
                '<cmd>GoGenReturn<CR>',
                set_desc('GoGenReturn')
            )
            vim.api.nvim_set_keymap(
                'n',
                '<leader>Gv',
                '<cmd>Gomvp<CR>',
                set_desc('Gomvp')
            )
        end,
    },

    -- golang templ
    -- "joerdav/templ.vim",
}
