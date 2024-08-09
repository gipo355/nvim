return {
    'sainnhe/everforest',
    lazy = false,
    enabled = _G.user.theme() == 'everforest',
    priority = 1000,
    config = function()
        local set_bg = function()
            if _G.user.transparent_background then
                return 1
            else
                return 0
            end
        end

        vim.g.everforest_background = 'soft'
        vim.g.everforest_enable_italic = 1
        -- vim.g.everforest_disable_italic_comment = 1
        vim.g.everforest_dim_inactive_windows = 0
        vim.g.everforest_sign_column_background = 'gray'
        vim.g.everforest_ui_contrast = 'high'
        vim.g.everforest_transparent_background = set_bg()
        vim.g.everforest_spell_foreground = 'colored'
        vim.g.everforest_diagnostic_text_highlight = 1
        vim.g.everforest_diagnostic_virtual_text = 'highlighted'

        _G.user.themes.everforest = 'everforest'
    end,
}
