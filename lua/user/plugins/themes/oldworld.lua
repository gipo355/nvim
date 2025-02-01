return {
    "dgox16/oldworld.nvim",
    enabled = _G.user.theme() == 'oldworld',
    lazy = false,
    priority = 1000,
    init = function()
        _G.user.themes.oldworld = 'oldworld'
    end
}
