return {
    'olimorris/codecompanion.nvim',
    event = 'BufReadPre',
    enabled = _G.user.ai.codecompanion.enable,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    config = true,
}
