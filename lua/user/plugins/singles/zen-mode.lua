return {
    'folke/zen-mode.nvim',
    keys = {
        {
            '<s-z>',
            '<cmd>ZenMode<cr>',
            { 'n', 'x', 'v' },
            desc = 'Zen mode',
        },
    },
    config = function()
        require('zen-mode').setup({
            window = {
                width = 100,
            },
            -- plugins = {
            --     tmux = { enabled = true },
            --     wezterm = {
            --         enabled = true,
            --         font = '17'
            --     }
            -- },
        })
        -- ######## zen mode plugin
        -- vim.keymap.set({ 'n', 'x', 'v' }, '<s-z>', '<cmd>ZenMode<cr>', opts) -- bbye plugin
    end,
}
