return {
    'sainnhe/sonokai',
    lazy = false,
    priority = 1000,
    config = function()
        local set_bg = function()
            if _G.user.transparent_bg then
                return 1
            else
                return 0
            end
        end
        vim.g.sonokai_style = 'shusia' -- default, andromeda, atlantis, shusia, maia, espresso
        vim.g.sonokai_enable_italic = 1
        vim.g.sonokai_diagnostic_virtual_text = 'colored'
        -- vim.g.sonokay_diagnostic_line_highlight = 1
        vim.g.sonokai_diagnostic_text_highlight = 1
        vim.g.sonokai_transparent_background = set_bg()
        vim.g.dim_inactive_windows = 1
        vim.g.sonokai_better_performance = 1
        -- vim.g.sonokai_disable_italic_comment = 1
        _G.user.themes.sonokai = 'sonokai'
    end,
}
