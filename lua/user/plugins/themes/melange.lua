return {
    'savq/melange-nvim',
    lazy = false,
    priority = 1000,
    enabled = function()
        return _G.user.theme() == 'melange'
    end,
    config = function()
        _G.user.themes.melange = 'melange'
    end,
}
