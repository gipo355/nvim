local set_desc = require('user.utils.functions').set_keymap_desc
return {
    {
        'ramilito/kubectl.nvim',
        enabled = _G.user.additional_plugins.kubectl,
        event = 'VeryLazy',
        config = function()
            require('kubectl').setup()
            vim.keymap.set(
                'n',
                '<leader>Dk',
                '<cmd>lua require("kubectl").toggle()<cr>',
                set_desc('kubectl')
            )
        end,
    },
}
