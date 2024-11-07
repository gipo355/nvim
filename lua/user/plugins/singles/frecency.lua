-- list in telescope for prioritizing behavioral items with sqlite
-- bug treesitter 2024-03-08 13:40
return {
    'nvim-telescope/telescope-frecency.nvim',
    enabled = _G.user.additional_plugins.telescope_frecency,
    opts = {
        db_safe_mode = false,
    },
    keys = {
        {
            '<leader>K',
            '<cmd>Telescope frecency initial_mode=normal<cr>',
            'n',
            desc = 'Telescope Frecency',
        },
    },
    config = function()
        require('telescope').load_extension('frecency')
        -- lvim.builtin.which_key.mappings["K"] = { "<cmd>Telescope frecency<cr>", "Frecency" }
        -- lvim.builtin.which_key.mappings["K"] = { "<cmd>Telescope frecency workspace=CWD<cr>", "Frecency" }
    end,
    -- dependencies = { "kkharji/sqlite.lua" },
}
