-- https://www.reddit.com/r/neovim/comments/1hlnv7x/blinkcmp_i_finally_have_a_configuration_that/?share_id=LcUXP-XVhzAKFhrQErdSs&utm_medium=android_app&utm_name=androidcss&utm_source=share&utm_term=3

return {
    'saghen/blink.cmp',
    enabled = _G.user.completion == 'blink',
    -- optional: provides snippets for the snippet source
    dependencies = {
        { 'rafamadriz/friendly-snippets' },
        { 'onsails/lspkind.nvim' },
        {
            'saghen/blink.compat',
            optional = true, -- make optional so it's only enabled if any extras need it
            opts = {},
            version = not vim.g.lazyvim_blink_main and '*',
        },
    },
    lazy = false,
    -- event = 'VeryLazy',
    -- use a release tag to download pre-built binaries
    version = '*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- see the "default configuration" section below for full documentation on how to define
        -- your own keymap.
        keymap = {
            preset = 'enter',
            ['<C-o>'] = { 'show', 'hide', 'fallback' },
            ['<C-j>'] = { 'select_next', 'fallback' }, -- snippets
            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-y>'] = { 'accept', 'fallback' },
            -- ['<Tab>'] = { 'accept', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },
        },

        appearance = {
            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
            -- Useful for when your theme doesn't support blink.cmp
            -- will be removed in a future release
            -- use_nvim_cmp_as_default = true,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono',
        },

        cmdline = {
            enabled = true,
            -- use 'inherit' to inherit mappings from top level `keymap` config
            -- keymap = { preset = 'cmdline' },
            keymap = { preset = 'inherit' },
            sources = function()
                local type = vim.fn.getcmdtype()
                -- Search forward and backward
                if type == '/' or type == '?' then
                    return { 'buffer' }
                end
                -- Commands
                if type == ':' or type == '@' then
                    return { 'cmdline' }
                end
                return {}
            end,
            completion = {
                trigger = {
                    show_on_blocked_trigger_characters = {},
                    show_on_x_blocked_trigger_characters = {},
                },
                list = {
                    selection = {
                        -- When `true`, will automatically select the first item in the completion list
                        preselect = true,
                        -- When `true`, inserts the completion item automatically when selecting it
                        auto_insert = true,
                    },
                },
                -- Whether to automatically show the window when new completion items are available
                menu = { auto_show = true },
                -- Displays a preview of the selected item on the current line
                ghost_text = { enabled = false },
            },
        },

        -- default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, via `opts_extend`
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer', 'codecompanion' },
            -- optionally disable cmdline completions
            -- cmdline = {},
            -- compat = {},
            providers = {
                -- lsp = {
                --     min_keyword_length = 2, -- Number of characters to trigger porvider
                --     score_offset = 0, -- Boost/penalize the score of the items
                -- },
                path = {
                    min_keyword_length = 1,
                    max_items = 4,
                },
                snippets = {
                    min_keyword_length = 2,
                    max_items = 4,
                },
                buffer = {
                    min_keyword_length = 2,
                    max_items = 4,
                },
            },
        },

        completion = {
            list = {
                selection = {
                    preselect = true,
                    auto_insert = false,
                },
            },
            -- list = {
            --     selection = function(ctx)
            --         return ctx.mode == 'cmdline' and 'auto_insert'
            --             or 'preselect'
            --     end,
            -- },
            accept = {
                -- disable if using cmp - in nvim autopairs
                auto_brackets = {
                    enabled = true,
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 0,
                treesitter_highlighting = true,
                window = { border = 'rounded' },
            },

            ghost_text = {
                enabled = false,
            },
            menu = {
                -- can use telescope https://www.reddit.com/r/neovim/comments/1hlnv7x/comment/m3q5din/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
                border = 'rounded',
                draw = {
                    -- columns = {
                    --     { 'label', 'label_description', gap = 1 },
                    --     { 'kind' },
                    -- },
                    treesitter = { 'lsp' },
                    columns = {
                        { 'kind_icon', 'label', gap = 1 },
                        { 'kind' },
                    },
                    components = {
                        kind_icon = {
                            text = function(item)
                                local kind = require('lspkind').symbol_map[item.kind]
                                    or ''
                                return kind .. ' '
                            end,
                            highlight = 'CmpItemKind',
                        },
                        label = {
                            text = function(item)
                                return item.label
                            end,
                            highlight = 'CmpItemAbbr',
                        },
                        kind = {
                            text = function(item)
                                return item.kind
                            end,
                            highlight = 'CmpItemKind',
                        },
                    },
                },
            },
        },

        -- experimental signature help support
        signature = {
            enabled = _G.user.lsp.function_signature.source == 'blink',
            window = { border = 'rounded' },
        },
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { 'sources.default' },
}
