return {
    -- incremental selection with cr and backspace, can also use flash.nvim S
    'sustech-data/wildfire.nvim',
    event = 'VeryLazy',
    -- dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require('wildfire').setup()
    end,
}
