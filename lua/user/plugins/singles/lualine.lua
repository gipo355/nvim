local components = require('user.utils.lualine-components')
local icons = require('user.utils.icons')
return {
    'nvim-lualine/lualine.nvim',
    enabled = _G.user.enable_lualine,
    dependencies = {
        { 'nvim-tree/nvim-web-devicons' },
        { 'AndreM222/copilot-lualine' },
    },
    event = 'BufReadPre',
    opts = {
        options = {
            disabled_filetypes = { 'alpha', 'neo-tree' },
            globalstatus = true,
            component_separators = {
                left = icons.ui.DividerRight,
                right = icons.ui.DividerLeft,
            },
            section_separators = {
                left = icons.ui.BoldDividerRight,
                right = icons.ui.BoldDividerLeft,
            },
            icons_enabled = _G.user.have_nerd_font,
        },
        tabline = {},
        extensions = {},

        sections = {
            lualine_a = {
                components.mode,
            },
            lualine_b = {
                components.branch,
            },
            lualine_c = {
                {
                    'filename',
                    file_status = true, -- displays file status (readonly status, modified status)
                    path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
                },
                components.diff,
                components.python_env,
            },
            lualine_x = {
                components.diagnostics,
                components.lsp,
                {
                    'copilot',
                    show_colors = true,
                    show_loading = true,
                },
                components.spaces,
                components.filetype,
            },
            lualine_y = { components.location },
            lualine_z = {
                components.progress,
            },
        },
        inactive_sections = {
            lualine_a = {
                components.mode,
            },
            lualine_b = {
                components.branch,
            },
            lualine_c = {
                components.diff,
                components.python_env,
            },
            lualine_x = {
                components.diagnostics,
                components.lsp,
                components.spaces,
                components.filetype,
            },
            lualine_y = { components.location },
            lualine_z = {
                components.progress,
            },
        },

        -- sections = {
        --     lualine_a = { 'mode' },
        --     lualine_b = { 'branch' },
        --     lualine_c = { 'filename' },
        --     lualine_x = { 'encoding', 'fileformat', 'filetype' },
        --     lualine_y = { 'progress' },
        --     lualine_z = { 'location' },
        -- },
        -- inactive_sections = {
        --     lualine_a = {},
        --     lualine_b = {},
        --     lualine_c = { 'filename' },
        --     lualine_x = { 'location' },
        --     lualine_y = {},
        --     lualine_z = {},
        -- },

        -- sections = {
        --     lualine_a = { 'mode' },
        --     lualine_b = { 'branch', 'diff', python_env },
        --     lualine_c = { 'filename' },
        --     lualine_x = { clients_lsp, 'diagnostics' },
        --     lualine_y = { 'encoding', 'fileformat', 'filetype' },
        --     lualine_z = { 'progress', 'location' },
        -- },
        -- inactive_sections = {
        --     lualine_a = {},
        --     lualine_b = {},
        --     lualine_c = { 'filename' },
        --     lualine_x = { 'location' },
        --     lualine_y = {},
        --     lualine_z = {},
        -- },
    },
}
