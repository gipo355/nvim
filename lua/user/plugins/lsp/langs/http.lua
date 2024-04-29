local set_desc = require('user.utils.functions').set_keymap_desc
-- optionals: jq, tidy
return {
    {
        'vhyrro/luarocks.nvim',
        event = 'BufRead *.http',
        priority = 1000,
        config = true,
    },
    {
        'rest-nvim/rest.nvim',
        event = 'BufRead *.http',
        dependencies = {
            { 'luarocks.nvim' },
            { 'nvim-telescope/telescope.nvim' },
        },
        ft = 'http',
        -- keys = {},
        config = function()
            local rest = require('rest-nvim')
            require('telescope').load_extension('rest')
            rest.setup({
                skip_ssl_verification = true,
                result = {
                    split = {
                        horizontal = false,
                        in_place = false,
                        stay_in_current_window_after_split = true,
                    },
                },
            })
            vim.keymap.set(
                'n',
                '<leader>rr',
                '<cmd>Rest run<cr>',
                set_desc('[R]est [R]un')
            )
            vim.keymap.set(
                'n',
                '<leader>rl',
                '<cmd>Rest run last<cr>',
                set_desc('[R]est [L]ast query')
            )

            vim.keymap.set('n', '<leader>rt', function()
                require('telescope').extensions.select_env()
            end, set_desc('[R]est [T]elescope'))
        end,
    },
}
