return {
    'supermaven-inc/supermaven-nvim',
    event = 'BufReadPre',
    enabled = _G.user.ai.autocomplete == 'supermaven',
    config = function()
        require('supermaven-nvim').setup({
            keymaps = {
                -- accept_suggestion = '<Tab>',
                accept_suggestion = '<C-l>',
                clear_suggestion = '<C-]>',
                accept_word = '<C-j>',
            },
            -- ignore_filetypes = { cpp = true },
            -- color = {
            --     suggestion_color = '#ffffff',
            --     cterm = 244,
            -- },
            -- log_level = 'off', -- set to "off" to disable logging completely
            -- disable_inline_completion = false, -- disables inline completion for use with cmp
            -- disable_keymaps = false, -- disables built in keymaps for more manual control
        })
    end,
}
