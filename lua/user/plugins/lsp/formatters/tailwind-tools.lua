-- requires tailwindcss lsp installed

-- available cmds
-- TailwindConcealEnable: enables conceal for all buffers.
-- TailwindConcealDisable: disables conceal.
-- TailwindConcealToggle: toggles conceal.
-- TailwindColorEnable: enables color hints for all buffers.
-- TailwindColorDisable: disables color hints.
-- TailwindColorToggle: toggles color hints.
-- TailwindSort: sorts all classes in the current buffer.
-- TailwindSortSelection: sorts selected classes in visual mode.

local set_desc = require('user.utils.functions').set_keymap_desc

local custom_filetypes = {
    'html',
    'css',
    'scss',
    'javascript',
    'typescript',
    'javascriptreact',
    'typescriptreact',
    'svelte',
    'vue',
    'markdown',
    'javascript.jsx',
    'typescript.tsx',
    'javascriptreact',
    'typescriptreact',
    'angular.html',
    'templ',
}

return {
    'luckasRanarison/tailwind-tools.nvim',
    ft = custom_filetypes,
    enabled = _G.user.tailwindcss.tailwind_tools.enable,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
        document_color = {
            enabled = _G.user.tailwindcss.tailwind_tools.enable_colors, -- can be toggled by commands
            kind = 'inline', -- "inline" | "foreground" | "background"
            inline_symbol = '󰝤 ', -- only used in inline mode
            debounce = 200, -- in milliseconds, only applied in insert mode
        },
        conceal = {
            enabled = _G.user.tailwindcss.tailwind_tools.enable_conceal, -- can be toggled by commands
            symbol = '󱏿', -- only a single character is allowed
            highlight = { -- extmark highlight options, see :h 'highlight'
                fg = '#38BDF8',
            },
        },
        custom_filetypes = custom_filetypes,
        -- see the extension section to learn how it works
    }, -- your configuration
    config = function(opts)
        -- local function printTable(t, indent)
        --     if not indent then
        --         indent = 0
        --     end
        --     for k, v in pairs(t) do
        --         local formatting = string.rep('  ', indent) .. k .. ': '
        --         if type(v) == 'table' then
        --             print(formatting)
        --             printTable(v, indent + 1)
        --         else
        --             print(formatting .. tostring(v))
        --         end
        --     end
        -- end
        --
        -- -- Print the opts table
        -- printTable(opts)

        require('tailwind-tools').setup({
            document_color = {
                enabled = _G.user.tailwindcss.tailwind_tools.enable_colors, -- can be toggled by commands
                kind = 'inline', -- "inline" | "foreground" | "background"
                inline_symbol = '󰝤 ', -- only used in inline mode
                debounce = 200, -- in milliseconds, only applied in insert mode
            },
            conceal = {
                enabled = _G.user.tailwindcss.tailwind_tools.enable_conceal, -- can be toggled by commands
                symbol = '󱏿', -- only a single character is allowed
                highlight = { -- extmark highlight options, see :h 'highlight'
                    fg = '#38BDF8',
                },
            },
            custom_filetypes = custom_filetypes,
            -- see the extension section to learn how it works
        })
        vim.keymap.set(
            'n',
            '<leader>vj',
            '<cmd>TailwindConcealToggle<cr>',
            set_desc('Toggle TailwindConceal')
        )
    end,
}
