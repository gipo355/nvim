return {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    enabled = _G.user.theme() == 'gruvbox-material',
    config = function()
        _G.user.themes.gruvbox_material = 'gruvbox-material'

        local ok, gruvbox_material = pcall(require, 'monokai-pro')

        if not ok then
            return
        end
        -- vim.api.set.nvim_set_hl(0, 'PurpleCustomGruvboxMaterial', { fg = '#b16286' })
        -- vim.api.nvim_set_hl(0, 'Normal', { fg = "#ffffff", bg = "#333333" })
        -- vim.api.nvim_set_hl(0, 'Comment', { fg = "#111111", bold = true })
        -- vim.api.nvim_set_hl(0, 'Error', { fg = "#ffffff", undercurl = true })
        -- vim.api.nvim_set_hl(0, 'Cursor', { reverse = true })

        -- ##### Customizing colors #####
        local grpid =
            vim.api.nvim_create_augroup('custom_highlights_gruvboxmaterial', {})
        vim.api.nvim_create_autocmd('ColorScheme', {
            group = grpid,
            pattern = 'gruvbox-material',
            callback = function()
                local function hl_lnk(src, trgt)
                    vim.api.nvim_set_hl(0, src, { link = trgt })
                end
                -- vim.api.nvim_set_hl(0, '@lsp.type.parameter.typescript', { fg = "#b16286" })
                -- vim.api.nvim_set_hl(0, '@lsp.type.parameter.typescript', { fg = "#8d62b1" })
                -- vim.api.nvim_set_hl(0, '@lsp.type.parameter.typescript', { link = 'Orange' })
                -- vim.api.nvim_set_hl(0, '@lsp.type.parameter.typescript', { fg = '#d65d0e' })
                vim.api.nvim_set_hl(
                    0,
                    '@lsp.type.parameter.typescript',
                    { fg = '#fe8019' }
                )
                -- vim.api.nvim_set_hl(0, '@lsp.type.function.typescript', { fg = '#98971a', bold = true })
                -- vim.api.nvim_set_hl(0, '@method.call.typescript', { fg = '#98971a', bold = true })
                vim.api.nvim_set_hl(
                    0,
                    '@method.call.typescript',
                    { fg = '#98821a', bold = true }
                )
                vim.api.nvim_set_hl(0, '@lsp.type.function.typescript', {
                    fg = '#b8bb26',
                    bold = true,
                })

                vim.api.nvim_set_hl(
                    0,
                    '@keyword.coroutine.typescript',
                    { fg = '#b16286', italic = true }
                )

                -- vim.api.nvim_set_hl(0, '@keyword.typescript', { link = 'Red', italic = true })

                vim.api.nvim_set_hl(0, '@operator.typescript', { link = 'Red' })

                -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.readonly.typescript', { fg = '#8d62b1' })
                -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.readonly.typescript', { fg = '#8f3f71' })
                -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.readonly.typescript', { fg = '#b877db' })
                -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.readonly.typescript', { fg = '#966fd6' })
                -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.readonly.typescript', { fg = '#b2a4ff' })
                -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.readonly.typescript', { fg = '#9376e0' })
                -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.readonly.typescript', { fg = '#458588' })
                vim.api.nvim_set_hl(0, '@lsp.type.variable.typescript', {})
                -- vim.api.nvim_set_hl(0, '@constant.typescript', { link = 'Purple' })

                -- hl_lnk('@lsp.mod.readyonly.typescript', 'Fg')
                -- hl_lnk('@lsp.mod.readyonly.typescript', 'Fg')
                -- hl_lnk('@lsp.typemod.variable.readonly.typescript', 'Purple')
                -- hl_lnk('@lsp.typemod.variable.declaration.typescript', 'Purple')
                -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.declaration.typescript', { fg = '#8d62b1' })
                -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.declaration.typescript', { fg = '#8f3f71' })
                -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.declaration.typescript', { fg = '#b877db' })
                -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.declaration.typescript', { fg = '#966fd6' })

                -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.declaration.typescript', { fg = '#b2a4ff' })
                vim.api.nvim_set_hl(
                    0,
                    '@lsp.typemod.variable.declaration.typescript',
                    { fg = '#a4a5ff' }
                )

                -- inlay hints
                if _G.user.background ~= 'light' then
                    vim.api.nvim_set_hl(
                        0,
                        'LspInlayHint',
                        -- { fg = "#665c54", bg = "#282828", italic = false }
                        -- { fg = "#665c54", bg = "#3c325c", italic = false }
                        -- { fg = "#665c54", bg = "#362d52", italic = false }
                        -- { fg = "#665c54", bg = "#2a2340", italic = false }
                        -- { fg = "#665c54", bg = "#21203a", italic = false }
                        -- { fg = "#665c54", bg = "#2f2134", italic = false }
                        -- { fg = "#665c54", bg = "#141414", italic = false }
                        -- { fg = '#665c54', bg = '#282828', italic = true }
                        { fg = '#665c54', bg = '#202020', italic = true }
                    )
                    vim.api.nvim_set_hl(0, 'Comment', {
                        fg = '#665c54',
                        -- bg = '#282828',
                        -- bg = '#282811',
                        -- bg = '#343434',
                        -- bg = '#2b2b2b',
                        bg = '#2d2d2d',
                        italic = true,
                    })
                    vim.api.nvim_set_hl(0, 'CursorColumn', {
                        -- fg = '#242424',
                        bg = '#242424',
                    })
                    vim.api.nvim_set_hl(0, 'ColorColumn', {
                        -- fg = '#242424',
                        bg = '#242424',
                    })
                end

                vim.api.nvim_set_hl(0, 'TelescopeMatching', {
                    -- fg = '#242424',
                    -- bg = '#665c54',
                    link = 'Search',
                })
                vim.api.nvim_set_hl(0, 'TelescopePreviewLine', {
                    -- fg = '#242424',
                    -- bg = '#665c54',
                    link = 'Search',
                })

                -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.declaration.typescript', { fg = '#7474b0' })
                -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.declaration.typescript', { fg = '#a1a1ce' })
                -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.declaration.typescript', { fg = '#9c8bff' })

                -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.declaration.typescript', { fg = '#9376e0' })
                -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.declaration.typescript', { fg = '#7a56d9' })

                -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.declaration.typescript', { fg = '#6f7cd6' })
                -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.declaration.typescript', { fg = '#7c6fd6' })
                -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.declaration.typescript', { fg = '#7180d2' })
                -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.declaration.typescript', { fg = '#8e7faa' })
                -- vim.api.nvim_set_hl(0, '@lsp.typemod.variable.declaration.typescript', { fg = '#458588' })
            end,
        })
        -- vim.api.nvim_create_autocmd("LspTokenUpdate", {
        --   group = grpid,
        --   pattern = 'gruvbox-material',
        --   callback = function(args)
        --     local token = args.data.token
        --     print(token)
        --     if token.modifiers.declaration and token.modifiers.readonly then
        --       vim.api.nvim_set_hl(0, '@lsp.typemod.variable.readonly.typescript', { link = 'Purple' })
        --       -- vim.lsp.semantic_tokens.highlight_token(
        --       --   token, args.buf, args.data.client_id, '@lsp.mod.builtin'
        --       -- )
        --     end
        --   end,
        -- })

        --########## theme and plugins customization
        -- vim.g.material_style = 'darker'
        local function setBackground()
            local time = tonumber(os.date('%H'))
            -- local function set_theme()
            if time >= 7 and time <= 19 then
                return 'mix'
            else
                return 'hard'
            end
            -- end
        end
        local function setForeground()
            local time = tonumber(os.date('%H'))
            -- local function set_theme()
            if time >= 7 and time <= 19 then
                return 'mix'
            else
                return 'material'
            end
            -- end
        end

        local function isTransparent()
            if _G.user.transparent_bg then
                return 1
            else
                return 0
            end
        end

        -- vim.g.gruvbox_material_background = 'soft'   -- soft, medium, hard
        vim.g.gruvbox_material_background = setBackground()
        -- vim.g.gruvbox_material_background = 'hard'
        -- vim.g.gruvbox_material_background = setBackground()
        -- vim.g.gruvbox_material_foreground = 'material' -- material, mix, original
        vim.g.gruvbox_material_foreground = setForeground()
        -- vim.g.gruvbox_material_foreground = 'mix' -- material, mix, original
        -- vim.g.gruvbox_material_foreground = "original" -- material, mix, original
        -- vim.g.gruvbox_material_foreground = setForeground() -- material, mix, original
        vim.g.gruvbox_material_enable_bold = 1
        vim.g.gruvbox_material_enable_italic = 1
        vim.g.gruvbox_material_transparent_background = isTransparent()
        vim.g.gruvbox_material_dim_inactive_windows = 0
        vim.g.gruvbox_material_diagnostic_text_highlight = 0
        vim.g.gruvbox_material_diagnostic_virtual_text = 'highlighted' -- options: 'colored', 'grey', 'highlighted'
        -- g:gruvbox_material_colors_override = {'bg0': ['#1d2021', '234'], 'bg2': ['#282828', '235']}
    end,
}
