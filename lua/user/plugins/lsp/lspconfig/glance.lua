local set_desc = require('user.utils.functions').set_keymap_desc
return {
    'dnlhc/glance.nvim', -- substitute lspsaga finder
    event = 'BufReadPre',
    -- keys = {
    -- },
    config = function()
        require('glance').setup({
            border = {
                enable = true,
            },
        })
        vim.keymap.set(
            'n',
            'gD',
            '<CMD>Glance definitions<CR>',
            set_desc('Glance definitions')
        )
        vim.keymap.set(
            'n',
            'gR',
            '<CMD>Glance references<CR>',
            set_desc('Glance references')
        )
        vim.keymap.set(
            'n',
            'gT',
            '<CMD>Glance type_definitions<CR>',
            set_desc('Glance type_definitions')
        )
        vim.keymap.set(
            'n',
            'gI',
            '<CMD>Glance implementations<CR>',
            set_desc('Glance implementations')
        )
    end,
}
