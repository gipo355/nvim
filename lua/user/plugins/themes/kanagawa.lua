return {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    enabled = function()
        return _G.user.theme() == 'kanagawa-wave'
            or _G.user.theme() == 'kanagawa-lotus'
            or _G.user.theme() == 'kanagawa-dragon'
            or _G.user.theme() == 'kanagawa'
    end,
    config = function()
        _G.user.themes.kanagawa_wave = 'kanagawa'
        _G.user.themes.kanagawa_wave = 'kanagawa-wave'
        _G.user.themes.kanagawa_lotus = 'kanagawa-lotus'
        _G.user.themes.kanagawa_dragon = 'kanagawa-dragon'

        local ok, kanagawa = pcall(require, 'kanagawa')

        if not ok then
            return
        end

        vim.opt.cursorline = false

        kanagawa.setup({
            compile = true,
            undercurl = true, -- enable undercurls
            commentStyle = { italic = true },
            -- functionStyle = {},
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            -- typeStyle = {},
            variablebuiltinStyle = { italic = true },
            specialReturn = true, -- special highlight for the return keyword
            specialException = true, -- special highlight for exception handling keywords
            -- transparent = true,      -- do not set background color
            -- dimInactive = true,      -- dim inactive window `:h hl-NormalNC`
            -- globalStatus = false, -- adjust window separators highlight for laststatus=3
            terminalColors = true, -- define vim.g.terminal_color_{0,17}
            colors = {
                -- add/modify theme and palette colors
                theme = {
                    all = {
                        ui = {
                            bg_gutter = 'none',
                        },
                    },
                },
                --     palette = {},
                --     theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            },
            -- overrides = function(colors) -- add/modify highlights
            --     -- local theme = colors.theme
            --     return {
            --         -- NvimTreeOpenedFolder = { fg = 'yellow', bg = 'yellow' },
            --         ColorColumn = { bg = '#3d3d3d', fg = 'none' },
            --         CursorColumn = { bg = '#3d3d3d', fg = 'none' },
            --     }
            -- end,
            -- theme = 'default', -- Load "default" theme or the experimental "light" theme
            theme = 'wave', -- Load "default" theme or the experimental "light" theme
            -- theme = "lotus",
            -- theme = 'dragon', -- Load "default" theme or the experimental "light" theme
            background = {
                --     -- map the value of 'background' option to a theme
                --     -- dark = "dragon", -- try "dragon" ! or "lotus"
                dark = 'dragon', -- try "dragon" ! or "lotus"
                light = 'lotus',
            },
        })
    end,
}
