-- #######################################
-- # color themes
--#############################

return {

    {
        'myypo/borrowed.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('borrowed').setup({
                transparent = _G.user.transparent_bg,
            })
            _G.user.themes.borrowed_mayu = 'mayu'
            _G.user.themes.borrowed_shin = 'shin'
        end,
    },

    {
        'EdenEast/nightfox.nvim',
        config = function()
            _G.user.themes.nightfox = 'nightfox'
            _G.user.themes.carbonfox = 'carbonfox'
            _G.user.themes.nordfox = 'nordfox'
            _G.user.themes.terafox = 'terafox'
        end,
    },

    {
        'baliestri/aura-theme',
        lazy = false,
        priority = 1000,
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. '/packages/neovim')
            -- vim.cmd([[colorscheme aura-dark]])

            _G.user.themes.aura_dark = 'aura-dark'
        end,
    },

    {
        'sainnhe/edge',
        init = function()
            vim.g.edge_style = 'aura' -- default, aura, neon
            vim.g.edge_enable_italic = 1
            vim.g.edge_dim_foreground = 1
            vim.g.edge_dim_inactive_windows = 1

            _G.user.themes.edge = 'edge'
        end,
    },

    {
        'marko-cerovac/material.nvim',
        init = function()
            vim.g.material_style = 'darker' -- deep ocean, palenight, darker, lighter, oceanic

            _G.user.themes.material = 'material'
        end,
    },

    -- { "tanvirtin/monokai.nvim" },
}
