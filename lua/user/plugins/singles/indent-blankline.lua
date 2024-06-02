local icons = require('user.utils.icons')

return {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    enabled = _G.user.enable_indent_blankline,
    main = 'ibl',
    event = 'VeryLazy',

    config = function()
        local hooks = require('ibl.hooks')

        -- hide first indent level
        if _G.user.hide_first_indent_level then
            hooks.register(
                hooks.type.WHITESPACE,
                hooks.builtin.hide_first_space_indent_level
            )
            hooks.register(
                hooks.type.WHITESPACE,
                hooks.builtin.hide_first_tab_indent_level
            )
        end

        -- setup highlight colors
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            -- vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
            -- vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
            -- vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
            -- vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
            -- vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
            -- vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
            -- vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
            vim.api.nvim_set_hl(
                0,
                'IndentBlanklineIndent1',
                { fg = '#2d2d1f', bg = '#2d2d1f' }
            )
            vim.api.nvim_set_hl(
                0,
                'IndentBlanklineIndent2',
                { fg = '#2d242d', bg = '#2d242d' }
            )
            vim.api.nvim_set_hl(
                0,
                'IndentBlanklineIndent3',
                { fg = '#202c2c', bg = '#202c2c' }
            )
            vim.api.nvim_set_hl(
                0,
                'IndentBlanklineIndent4',
                { fg = '#242d24', bg = '#242d24' }
            )

            vim.api.nvim_set_hl(
                0,
                'IndentBlanklineIndentChar1',
                { fg = '#6c6c57' }
            )
            vim.api.nvim_set_hl(
                0,
                'IndentBlanklineIndentChar2',
                { fg = '#584658' }
            )
            vim.api.nvim_set_hl(
                0,
                'IndentBlanklineIndentChar3',
                { fg = '#405858' }
            )
            vim.api.nvim_set_hl(
                0,
                'IndentBlanklineIndentChar4',
                { fg = '#394239' }
            )
        end)

        -- prepare highlights for bg and char
        local highlight_bg = {
            'IndentBlanklineIndent1',
            'IndentBlanklineIndent2',
            'IndentBlanklineIndent3',
            'IndentBlanklineIndent4',
        }

        local highlight_char = {
            'IndentBlanklineIndentChar1',
            'IndentBlanklineIndentChar2',
            'IndentBlanklineIndentChar3',
            'IndentBlanklineIndentChar4',
        }

        local function set_highlight_bg()
            if
                _G.user.background ~= 'light'
                and _G.user.indent_blankline_color_bg
            then
                return highlight_bg
            else
                return nil
            end
        end

        local function set_highlight_char()
            -- if _G.user.indent_blankline_color_bg then
            --     return nil
            -- else
            return highlight_char
            -- end
        end

        require('ibl').setup({

            scope = {
                enabled = true,
                show_start = false, -- show first line underline
            },
            indent = {
                smart_indent_cap = true,
                highlight = set_highlight_char(),
                char = icons.ui.LineLeft,
                tab_char = icons.ui.LineLeft,
            },
            whitespace = {
                highlight = set_highlight_bg(),
                remove_blankline_trail = true,
            },
        })
    end,
}
