return {
    'OlegGulevskyy/better-ts-errors.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    event = 'BufReadPre',
    enabled = _G.user.better_ts_errors,
    opts = {
        keymaps = {
            -- toggle = '<leader>vD', -- default '<leader>dd'
            toggle = 'gj', -- default '<leader>dd'
            go_to_definition = '<leader>vD', -- default '<leader>dx'
        },
    },
}
-- 'davidosomething/format-ts-errors.nvim',
