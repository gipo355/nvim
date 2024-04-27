local set_desc = require('user.utils.functions').set_keymap_desc
return {
    'zane-/cder.nvim',
    event = 'VeryLazy',
    dependencies = 'nvim-telescope/telescope.nvim',
    config = function()
        require('telescope').load_extension('cder')
        vim.keymap.set(
            'n',
            '<leader>z',
            '<cmd>Telescope cder<cr>',
            set_desc('Telescope cder')
        )
    end,
}
