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
        require('codecompanion').setup({
            strategies = {
                chat = {
                    adapter = 'copilot',
                },
                inline = {
                    adapter = 'copilot',
                },
            },
        })
        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mfl',
            ':CodeCompanion<CR>',
            set_desc('CodeCompanion')
        )
        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mfj',
            ':CodeCompanionChat<CR>',
            set_desc('CodeCompanion Chat')
        )
        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mfk',
            ':CodeCompanionActions<CR>',
            set_desc('CodeCompanion Actions')
        )
    end,
}
