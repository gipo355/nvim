local set_desc = require('user.utils.functions').set_keymap_desc
return {
    'aaronik/treewalker.nvim',
    event = 'VeryLazy',
    -- opts = {
    --     highlight = true, -- default is false
    -- },
    config = function()
        require('treewalker').setup({
            -- highlight = true, -- default is false
        })
        vim.api.nvim_set_keymap(
            'n',
            '<C-n>',
            '<cmd>Treewalker Down<CR>',
            set_desc('treewalker down')
        )
        vim.api.nvim_set_keymap(
            'n',
            '<C-p>',
            '<cmd>Treewalker Up<CR>',
            set_desc('treewalker up')
        )
        -- vim.api.nvim_set_keymap(
        --     'n',
        --     '<C-h>',
        --     ':Treewalker Left<CR>',
        --     set_desc('treewalker left')
        -- )
        -- vim.api.nvim_set_keymap(
        --     'n',
        --     '<C-l>',
        --     ':Treewalker Right<CR>',
        --     set_desc('treewalker right')
        -- )
    end,
}
