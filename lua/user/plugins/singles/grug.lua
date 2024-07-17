local set_desc = require('user.utils.functions').set_keymap_desc
return {
    'MagicDuck/grug-far.nvim',
    event = 'VeryLazy',
    config = function()
        require('grug-far').setup({
            keymaps = {
                close = '<C-q>',
            },
        })

        vim.keymap.set(
            'n',
            '<leader>Aa',
            '<cmd>GrugFar<cr>',
            set_desc('GrugFar')
        )
    end,
}
