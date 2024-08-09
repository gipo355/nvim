return {
    'loctvl842/monokai-pro.nvim',
    lazy = false,
    priority = 1000,
    enabled = _G.user.theme() == 'monokai-pro',

    config = function()
        _G.user.themes.monokai_pro = 'monokai-pro'

        local ok, monokai = pcall(require, 'monokai-pro')

        if not ok then
            return
        end

        -- require("monokai-pro").setup()
        monokai.setup({
            -- transparent_background = vim.g.transparent_bg,
            transparent_background = _G.user.transparent_background,
            devicons = true,
            filter = 'classic', -- classic | octagon | pro | machine | ristretto | spectrum
            -- filter = "octagon", -- classic | octagon | pro | machine | ristretto | spectrum
            -- filter = "machine", -- classic | octagon | pro | machine | ristretto | spectrum
            -- filter = 'ristretto', -- classic | octagon | pro | machine | ristretto | spectrum
            -- filter = 'pro', -- classic | octagon | pro | machine | ristretto | spectrum
            -- filter = 'spectrum', -- classic | octagon | pro | machine | ristretto | spectrum

            styles = {
                comment = { italic = true },
                keyword = { italic = true }, -- any other keyword
                type = { italic = true }, -- (preferred) int, long, char, etc
                storageclass = { italic = true }, -- static, register, volatile, etc
                structure = { italic = true }, -- struct, union, enum, etc
                parameter = { italic = true }, -- parameter pass in function
                annotation = { italic = true },
                tag_attribute = { italic = true }, -- attribute of tag in reactjs
            },

            day_night = {
                enable = false,
                day_filter = 'classic',
                night_filter = 'octagon',
            },
            inc_search = 'background', -- underline | background
            background_clear = {},
            plugins = {
                bufferline = {
                    underline_selected = true,
                    underline_visible = false,
                    bold = false,
                },
                indent_blankline = {
                    context_highlight = 'pro', -- default | pro
                    context_start_underline = true,
                },
            },
            override = function(c)
                return {
                    -- ColorColumn = { bg = c.base.dimmed3mmed3 },
                    -- Mine
                    DashboardRecent = { fg = c.base.magenta },
                    DashboardProject = { fg = c.base.blue },
                    DashboardConfiguration = { fg = c.base.white },
                    DashboardSession = { fg = c.base.green },
                    DashboardLazy = { fg = c.base.cyan },
                    DashboardServer = { fg = c.base.yellow },
                    DashboardQuit = { fg = c.base.red },
                    DiagnosticUnnecessary = { fg = c.base.dimmed3 }, -- unused vars
                    -- CursorColumn = { bg = '#31332b' }, -- unused vars
                    CursorColumn = { bg = '#2b2e1c' }, -- unused vars
                    -- ColorColumn = { bg = '#292b1f' }, -- unused vars
                    ColorColumn = { bg = '#292b1f' }, -- unused vars
                    -- ['@lsp.type.property.typescript'] = { fg = c.base.magenta },
                }
            end,
        })
        monokai.load()
    end,
}
