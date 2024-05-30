return {
    'marko-cerovac/material.nvim',
    lazy = false,
    priority = 1000,
    enabled = function()
        return _G.user.theme() == 'material'
    end,
    init = function()
        vim.g.material_style = 'darker' -- deep ocean, palenight, darker, lighter, oceanic

        _G.user.themes.material = 'material'
    end,
}
