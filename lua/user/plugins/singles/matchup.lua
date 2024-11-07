-- # better % navigation - BUGGED for now treesitter 2024-03-08
return {
    'andymass/vim-matchup', -- improved % jumping, activate on treesitter
    event = 'BufReadPre',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    lazy = false,
    -- commit = '55e3330436784fb8ccc35a5cfeb13e48bab9dcd2',
    -- version = '0.7.2'
    config = function()
        vim.g.matchup_matchparen_offscreen = { method = 'popup' }
        -- vim.g.matchup_matchparen_offscreen = { method = 'popup', fullwidth = 1, syntax_hl = 1 }
    end,
}
