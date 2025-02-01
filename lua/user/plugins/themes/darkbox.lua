return {
    "gipo355/darkbox.nvim",
    enabled = _G.user.theme() == 'darkbox',
    lazy = false,
    priority = 1000,
    config = function()
        require('darkbox').load()
        _G.user.themes.oldworld = 'darkbox'
    end
}
