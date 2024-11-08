local set_desc = require('user.utils.functions').set_keymap_desc

return {
    'ThePrimeagen/refactoring.nvim',
    event = 'BufReadPre',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-treesitter/nvim-treesitter' },
    },
    config = function()
        vim.keymap.set(
            { 'v', 'n' },
            '<M-c>',
            ':lua require("refactoring").select_refactor()<cr>',
            set_desc('Primeagen refactor')
        )
        require('refactoring').setup()
    end,
}
