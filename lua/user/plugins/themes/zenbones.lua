local themes = {
    'zenbones',
    'neobones',
    'vimbones',
    'rosebones',
    'forestbones',
    'nordbones',
    'tokyobones',
    'seoulbones',
    'duckbones',
    'zenburned',
    'kanagawabones',
    'randombones',
}

local function value_in_table(value, tbl)
    for _, v in ipairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

return {
    'zenbones-theme/zenbones.nvim',
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = { 'rktjmp/lush.nvim' },
    priority = 1000,
    enabled = value_in_table(_G.user.theme(), themes),
    config = function()
        for _, theme in ipairs(themes) do
            _G.user.themes[theme] = theme
        end
    end,
}
