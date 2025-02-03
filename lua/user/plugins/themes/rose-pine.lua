-- TODO: highlight telescope grep search results, check gruvbox-material
-- chan_add('saturation', -15,  { filter = 'bg' })
-- chan_add('saturation', -3,  { filter = 'fg' })
-- chan_add('lightness', 4,  { filter = 'bg' })
-- chan_add('lightness', -5,  { filter = 'fg' })
-- chan_add('temperature', 10,  { filter = 'bg' })
return {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    enabled = _G.user.theme() == 'rose-pine',
    priority = 1000,
    config = function()
        require('rose-pine').setup({
            -- 'auto' | 'main'|'moon'|'dawn'
            variant = 'auto',
            -- 'main'|'moon'|'dawn'
            dark_variant = 'main',

            extend_background_behind_borders = false,
            dim_inactive_windows = false,

            -- ## possible deprecated
            -- bold_vert_split = false,
            -- disable_italics = true,
            -- dim_nc_background = false,
            -- disable_background = _G.user.transparent_bg,
            -- disable_float_background = false,

            enable = {
                terminal = true,
                legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                migrations = true, -- Handle deprecated options automatically
            },

            styles = {
                bold = true,
                italic = true,
                transparency = _G.user.transparent_background,
            },

            groups = {
                comment = 'muted',
                -- comment = '#171717',
                -- background = '#000000',
                -- background = '#171717',
                -- background_nc = '#171717',
                -- panel = '#171717',
                -- panel_nc = '#171717',
            },
            highlight_groups = {
                -- FloatBorder = { fg = 'rose' },
                -- LspInlayHint = { bg = "_experimental_nc", fg = "muted" },
                -- Comment = { fg = "#39364a" },
                Normal = { bg = '#000000' },
                NormalNC = { bg = '#000000' },
                Comment = { fg = '#3f3c52' },
                TelescopeMatching = {
                    -- fg = 'rose'
                    link = 'Search',
                },
                TelescopePreviewLine = {
                    -- fg = 'rose'
                    link = 'Search',
                },
            },
        })
        function ColorMyPencils(color)
            color = color or 'rose-pine'
            vim.cmd.colorscheme(color)

            vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
            vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

            -- vim.api.nvim_set_hl(0, 'TelescopeMatching', {
            --     link = 'Search',
            -- })
            -- vim.api.nvim_set_hl(0, 'TelescopePreviewLine', {
            --     link = 'Search',
            -- })
        end

        _G.user.themes.rose_pine = 'rose-pine'

        ColorMyPencils()
    end,
}
