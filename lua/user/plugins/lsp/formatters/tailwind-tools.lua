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

return {
    'luckasRanarison/tailwind-tools.nvim',
    event = 'BufReadPre',
    enabled = _G.user.tailwindcss.tailwind_tools.enable,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
        document_color = {
            enabled = true, -- can be toggled by commands
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
        custom_filetypes = {
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
        },
        -- see the extension section to learn how it works
    }, -- your configuration
}
