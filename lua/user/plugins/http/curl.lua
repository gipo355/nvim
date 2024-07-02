return {
    'oysandvik94/curl.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        require('curl').setup({})
    end,
}
