local icons = require('user.utils.icons')

if _G.user.indent_blankline_color_bg then
    vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = '*',
        callback = function()
            vim.cmd(
                [[highlight IndentBlanklineIndent1 guifg=#2d2d1f guibg=#2d2d1f gui=nocombine]]
            )
            vim.cmd(
                [[highlight IndentBlanklineIndent2 guifg=#242d24 guibg=#242d24 gui=nocombine]]
            )
            vim.cmd(
                [[highlight IndentBlanklineIndent3 guifg=#2d242d guibg=#2d242d gui=nocombine]]
            )
            vim.cmd(
                [[highlight IndentBlanklineIndent4 guifg=#202c2c guibg=#202c2c gui=nocombine]]
            )
            vim.cmd(
                [[highlight IndentBlanklineIndentChar1 guifg=#2d2d1f  gui=nocombine]]
            )
            vim.cmd(
                [[highlight IndentBlanklineIndentChar2 guifg=#242d24  gui=nocombine]]
            )
            vim.cmd(
                [[highlight IndentBlanklineIndentChar3 guifg=#2d242d  gui=nocombine]]
            )
            vim.cmd(
                [[highlight IndentBlanklineIndentChar4 guifg=#202c2c  gui=nocombine]]
            )

            -- vim.cmd(
            --     [[highlight IndentBlanklineIndentChar1 guifg=#4b5563 guibg=#2d2d1f gui=nocombine]]
            -- )
            -- vim.cmd(
            --     [[highlight IndentBlanklineIndentChar2 guifg=#4b5563 guibg=#242d24 gui=nocombine]]
            -- )
            -- vim.cmd(
            --     [[highlight IndentBlanklineIndentChar3 guifg=#4b5563 guibg=#2d242d gui=nocombine]]
            -- )
            -- vim.cmd(
            --     [[highlight IndentBlanklineIndentChar4 guifg=#4b5563 guibg=#202c2c gui=nocombine]]
            -- )
            --
            -- vim.cmd(
            --     [[highlight IndentBlanklineIndentContext guifg=blue guibg='none' gui=nocombine]]
            -- )
        end,
    })
end

local blankline_config = {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    enabled = _G.user.enable_indent_blankline,
    main = 'ibl',
    event = 'BufReadPre',
    opts = {
        scope = {
            enabled = true,
        },
        indent = {
            smart_indent_cap = true,
            -- highlight = {
            --     'IndentBlanklineIndent1',
            --     'IndentBlanklineIndent2',
            --     'IndentBlanklineIndent3',
            --     'IndentBlanklineIndent4',
            -- },
            char = icons.ui.LineLeft,
        },
    },
}

-- disable highlight colors if light theme
if _G.user.background ~= 'light' and _G.user.indent_blankline_color_bg then
    local highlight = {
        'IndentBlanklineIndent1',
        'IndentBlanklineIndent2',
        'IndentBlanklineIndent3',
        'IndentBlanklineIndent4',
    }

    blankline_config.opts.whitespace = {
        highlight = highlight,
        remove_blankline_trail = true,
    }
end

return blankline_config
