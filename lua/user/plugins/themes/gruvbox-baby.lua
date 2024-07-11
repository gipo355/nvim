return {
    'luisiacc/gruvbox-baby',
    lazy = false,
    priority = 1000,
    enabled = _G.user.theme() == 'gruvbox-baby',
    init = function()
        local setBg = function()
            if not _G.user.transparent_bg then
                -- if vim.g.transparent_bg then
                return 1
            else
                return 0
            end
        end
        -- gruvbox-baby
        -- vim.g.gruvbox_baby_use_original_palette = true
        vim.g.gruvbox_baby_background_color = 'medium' -- 'dark' 'medium'
        -- vim.g.gruvbox_baby_transparent_mode = setBg()
        vim.g.gruvbox_baby_transparent_mode = _G.user.transparent_bg
        -- vim.g.gruvbox_baby_function_style = 'NONE'
        -- vim.g.gruvbox_baby_keyword_style = 'NONE'
        vim.g.gruvbox_baby_highlights = {
            -- https://github.com/luisiacc/gruvbox-baby/issues/70
            IncSearch = { bg = '#ff9e64', fg = 'White' },
            CurSearch = { link = 'IncSearch' },
            Cursor = { bg = 'gray' },

            -- TSVariableBuiltin = { fg = '#078b80', style = 'italic' },

            -- TSFunction = { fg = '#d6aa2f', style = 'bold' },
            -- TSFunctionBuiltin = { fg = '#be972a' },
            -- TSMethod = { fg = '#d6aa2f', style = 'bold' },
            ['@function'] = { fg = '#b8bb26', style = 'bold' },
            ['@function.method'] = { fg = '#b8bb26', style = 'bold' },
            ['@function.method.call'] = { fg = '#b8bb26', style = 'bold' },
            ['@lsp.type.function'] = { fg = '#b8bb26', style = 'bold' },

            -- #b8bb26
            -- #b0b846

            -- TSTypeBuiltin = { fg = '#4e9951', style = 'italic' },
            -- TSOperator = { fg = '#fb4934', style = 'italic' },
            -- TSPunctSpecial = { fg = '#fb4934', style = 'italic' },
            -- -- TSType = { fg = '#994e70' },
            -- -- TSConstructor = { fg = '#994e70', style = 'italic' },
            -- TSPunctDelimiter = { fg = '#80817c' },
            -- -- TSVariable = { fg = '#d6d3d1' }
            -- TSType = { fg = '#994e70' },
            -- TSConstructor = { fg = '#994e70' },
            -- TSVariable = { fg = '#d6d3d1' }

            -- TSVariableBuiltin = { fg = '#078b80' },
            -- TSFunction = { fg = '#d6aa2f', style = 'bold' },
            -- TSFunctionBuiltin = { fg = '#be972a' },
            -- TSMethod = { fg = '#d6aa2f', style = 'bold' },
            -- TSTypeBuiltin = { fg = '#4e9951' },
            -- TSOperator = { fg = '#fb4934' },
            -- TSPunctSpecial = { fg = '#fb4934' },
            -- TSPunctDelimiter = { fg = '#80817c' },

            WinSeparator = { fg = '#3c3836' },
            EndOfBuffer = { fg = '#3c3836' },

            ['@variable.builtin.typescript'] = {
                fg = '#d3869b',
                style = 'italic',
            },
            ['@lsp.type.parameter.typescript'] = {
                fg = '#e78a4e',
                style = 'italic',
            },
            ['@lsp.mod.readonly.typescript'] = {
                style = 'bold',
            },
        }

        _G.user.themes.gruvbox_baby = 'gruvbox-baby'
    end,
}
