return {
    'ab-dx/ares.nvim',
    name = 'ares',
    priority = 1000,
    enabled = _G.user.theme() == 'ares',
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()
        _G.user.themes.ares = 'ares'
    end,
}
