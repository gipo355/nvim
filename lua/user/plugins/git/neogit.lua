local set_desc = require('user.utils.functions').set_keymap_desc

return {
    'NeogitOrg/neogit',
    -- branch = 'master',
    event = 'VeryLazy',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'sindrets/diffview.nvim',

        -- Only one of these is needed, not both.
        'nvim-telescope/telescope.nvim',
        -- 'ibhagwan/fzf-lua',
    },
    -- opts = {
    --     integrations = {
    --         diffview = true,
    --         telescope = true,
    --         -- fzf_lua = true,
    --     },
    --     disable_line_numbers = false,
    --     graph_style = 'unicode',
    -- },
    -- keys = {
    --     {
    --         '<leader>gn',
    --         '<cmd>Neogit<cr>',
    --         'n',
    --         desc = '[N]eogit',
    --     },
    -- },
    -- config = true
    config = function()
        require('neogit').setup({
            integrations = {
                diffview = true,
                telescope = true,
                -- fzf_lua = true,
            },
            disable_line_numbers = false,
            -- graph_style = 'unicode',
            graph_style = 'kitty',
        })

        vim.keymap.set(
            'n',
            '<leader>gn',
            '<cmd>Neogit<cr>',
            set_desc('[g] [N]eogit')
        )
        vim.keymap.set('n', 'gn', '<cmd>Neogit<cr>', set_desc('[g] [N]eogit'))
    end,
}
