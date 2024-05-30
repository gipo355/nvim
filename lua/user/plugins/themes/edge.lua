return {
    'sainnhe/edge',
    lazy = false,
    priority = 1000,
    enabled = function()
        return _G.user.theme() == 'edge'
    end,
    init = function()
        vim.g.edge_style = 'aura' -- default, aura, neon
        vim.g.edge_enable_italic = 1
        vim.g.edge_dim_foreground = 1
        vim.g.edge_dim_inactive_windows = 1

        _G.user.themes.edge = 'edge'
    end,
}
