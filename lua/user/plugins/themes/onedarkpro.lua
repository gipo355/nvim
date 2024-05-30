return {
    'olimorris/onedarkpro.nvim',
    lazy = false,
    enabled = _G.user.theme() == 'onedarkpro',
    priority = 1000,
    config = function()
        _G.user.themes.onedarkpro = 'onedark'

        local ok, onedarkpro = pcall(require, 'onedarkpro')

        if not ok then
            return
        end

        onedarkpro.setup({
            -- caching = true,
            colors = {
                -- dark = {
                --     bg = '#1d1d1d',
                --     -- black = '#1d1d1d',
                -- },
                onedark = {
                    -- bg = '#1d1d1d',
                    bg = '#282828',
                    -- black = '#1d1d1d',
                },
            },
            styles = {
                -- choose from "bold,italic,underline"
                strings = 'italic', -- style that is applied to strings.
                comments = 'italic', -- style that is applied to comments
                keywords = 'italic', -- style that is applied to keywords
                functions = 'bold', -- style that is applied to functions
                -- variables = "bold", -- style that is applied to variables
                -- virtual_text = "none", -- style that is applied to virtual text
            },
            highlights = {
                -- ["@variable.builtin.typescript"] = { fg = '#078b80', style = 'italic' },
                -- ['@type.builtin.typescript'] = { fg = '#469c00', style = 'italic' },
                -- ['@variable.typescript'] = { fg = '#e4e4e7' },
                -- ['@number.typescript'] = { fg = '#948ae3' },
                -- ['@method.call.typescript'] = { fg = '#61afef', style = 'bold' },
                -- ['@method.typescript'] = { fg = '#61afef', style = 'bold' },
                -- ['@keyword.return.typescript'] = { fg = '#ff5350', style = 'italic' },
                -- ['@conditional.typescript'] = { fg = '#ff5350', style = 'italic' },
                -- ['@repeat.typescript'] = { fg = '#ff5350', style = 'italic' },
                -- ['@punctuation.special'] = { fg = '#ff5350', style = 'italic' }

                ['@variable.builtin.typescript'] = { fg = '#078b80' },
                ['@type.builtin.typescript'] = { fg = '#469c00' },
                ['@variable.typescript'] = { fg = '#e4e4e7' },
                ['@number.typescript'] = { fg = '#948ae3' },
                ['@method.call.typescript'] = { fg = '#61afef' },
                ['@method.typescript'] = { fg = '#61afef' },
                ['@keyword.return.typescript'] = { fg = '#ff5350' },
                ['@conditional.typescript'] = { fg = '#ff5350' },
                ['@repeat.typescript'] = { fg = '#ff5350' },
                ['@punctuation.special'] = { fg = '#ff5350' },

                CursorColumn = { bg = '#2d2d2d' },
                ColorColumn = { bg = '#2d2d2d' },

                -- ['@keyword.typescript'] = { style = 'NONE' }
                -- TSVariable = { fg = 'yellow' , style =}
                -- TSVariableBuiltin = { fg = '#078b80' }
            }, -- override default highlight groups
            options = {
                bold = true, -- use the colorscheme's opinionated bold styles?
                italic = true, -- use the colorscheme's opinionated italic styles?
                underline = true, -- use the colorscheme's opinionated underline styles?
                undercurl = true, -- use the colorscheme's opinionated undercurl styles?
                cursorline = true, -- use cursorline highlighting?
                transparency = _G.user.transparent_bg, -- use a transparent background?
                terminal_colors = true, -- use the colorscheme's colors for neovim's :terminal?
                window_unfocused_color = false, -- when the window is out of focus, change the normal background?
            },
        })
    end,
}
