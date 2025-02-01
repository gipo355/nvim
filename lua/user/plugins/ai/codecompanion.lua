local set_desc = require('user.utils.functions').set_keymap_desc

return {
    'olimorris/codecompanion.nvim',
    event = 'BufReadPre',
    enabled = _G.user.ai.codecompanion.enable,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    config = function()
        require('codecompanion').setup {}

        vim.keymap.set('n', '<leader>mss', '<cmd>CodeCompanion<CR>', set_desc('CodeCompanion'))
        vim.keymap.set('n', '<leader>msj', '<cmd>CodeCompanionChat<CR>', set_desc('CodeCompanion Chat'))
        vim.keymap.set('n', '<leader>msk', '<cmd>CodeCompanionActions<CR>', set_desc('CodeCompanion Actions'))

    end
}
