local format_filter =
    require('user.plugins.lsp.formatters.utils.formatting').format_filter

--[[
This file is for setting up conform.

The whole setup contains three parts:
- None-ls
- Conform
- Nvim-lint

conform and nvim-lint should be preferred when possible.

they together cover the whole range of formatters, linters, and code actions for languages that don't have a language server.

In addition, elf can be used for custom lsps

]]
--

return {
    -- TODO: prepare auto formats for none-ls, eslint, stylelint etc
    -- - svelte
    -- - typescript
    -- - go
    -- - rust
    -- - bash
    -- - lua
    -- - markdown
    -- - cs
    -- - java
    -- - html
    -- - css
    -- - scss

    -- TODO: add google-java-format for java
    -- templ for golang

    -- Autoformat
    {
        'stevearc/conform.nvim',
        event = 'BufEnter',
        -- opts = {},
        init = function()
            -- If you want the formatexpr, here is the place to set it
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        end,
        config = function()
            local conform = require('conform')
            local formatters_by_ft = {
                --         -- Conform can also run multiple formatters sequentially
                --         -- python = { "isort", "black" },
                --         --
                --         -- You can use a sub-list to tell conform to run *until* a formatter
                --         -- is found.
                --
                lua = { 'stylua' },

                -- php = { 'php_cs_fixer', 'prettier' },
                -- php = { 'prettierd','biome' },

                -- go = {
                --     -- 'gofumpt', -- already in gopls
                --     'goimports-reviser',
                -- },
                -- gomod = { 'gofumpt', 'goimports-reviser' },
                -- gowork = { 'gofumpt', 'goimports-reviser' },
                -- templ = { 'gofumpt', 'goimports-reviser' },

                markdown = { 'prettierd' },
                css = { 'prettierd' },
                scss = { 'prettierd' },
                html = { 'prettierd' },
                ['angular.html'] = { 'prettierd' },
                yaml = { 'prettierd' },
                pug = { 'prettierd' },
                astro = { 'prettierd' },
                svelte = { 'prettierd' },
                vue = { 'prettierd' },
                less = { 'prettierd' },
                json = { 'prettierd' },
                jsonc = { 'prettierd' },
                javascript = { 'prettierd' },
                javascriptreact = { 'prettierd' },
                typescript = { 'prettierd' },
                typescriptreact = {
                    'prettierd',
                    -- stop_after_first = false
                },

                -- markdown = { { 'prettierd', 'prettier' } },
                -- php = { { 'prettierd', 'prettier' } },
                -- css = { { 'prettierd', 'prettier' } },
                -- scss = { { 'prettierd', 'prettier' } },
                -- html = { { 'prettierd', 'prettier' } },
                -- ['angular.html'] = { { 'prettierd', 'prettier' } },
                -- yaml = { { 'prettierd', 'prettier' } },
                -- pug = { { 'prettierd', 'prettier' } },
                -- astro = { { 'prettierd', 'prettier' } },
                -- svelte = { { 'prettierd', 'prettier' } },
                -- vue = { { 'prettierd', 'prettier' } },
                -- less = { { 'prettierd', 'prettier' } },
                -- json = { { 'prettierd', 'prettier' } },
                -- jsonc = { { 'prettierd', 'prettier' } },
                -- javascript = { { 'prettierd', 'prettier' } },
                -- javascriptreact = { { 'prettierd', 'prettier' } },
                -- typescript = { { 'prettierd', 'prettier' } },
                -- typescriptreact = { { 'prettierd', 'prettier' } },

                -- markdown = { 'prettier' },
                -- php = { 'prettier' },
                -- css = { 'prettier' },
                -- scss = { 'prettier' },
                -- html = { 'prettier' },
                -- ['angular.html'] = { 'prettier' },
                -- yaml = { 'prettier' },
                -- pug = { 'prettier' },
                -- astro = { 'prettier' },
                -- svelte = { 'prettier' },
                -- vue = { 'prettier' },
                -- less = { 'prettier' },
                -- json = { 'prettier' },
                -- jsonc = { 'prettier' },
                -- javascript = { 'prettier' },
                -- javascriptreact = { 'prettier' },
                -- typescript = { 'prettier' },
                -- typescriptreact = { 'prettier' },

                -- these should be formatted by lsp biome
                -- json = { 'biome' },
                -- jsonc = { 'biome' },
                -- javascript = { 'biome' },
                -- javascriptreact = { 'biome' },
                -- typescript = { 'biome' },
                -- typescriptreact = { 'biome' },

                java = { 'google-java-format' },
                --         go = {
                --             {
                --                 'gofumpt',
                --                 'goimports',
                --                 'golines',
                --             },
                --         },
                --         templ = {
                --             {
                --                 -- 'gofumpt',
                --                 'gofmt',
                --             },
                --             'goimports',
                --         },
                --         bash = { 'shfmt' },
                --         rust = { 'rustfmt' },
                --         md = {
                --             'markdownlint',
                --             {
                --                 'prettierd',
                --                 -- 'prettier',
                --             },
                --         },
            }
            -- NOTE: at the moment we use only none-ls
            local slow_format_filetypes = {}

            conform.setup({
                notify_on_error = false,
                -- format_on_save = {
                --     timeout_ms = 1500,
                --     lsp_fallback = true, -- true, false, 'always'
                -- },
                formatters_by_ft = formatters_by_ft,
                -- default_format_opts = {
                --     lsp_format = 'first',
                -- },

                -- NOTE: this will automatically set autocmd bufwritepre
                -- This snippet will automatically detect which formatters take too long to run synchronously and will run them async on save instead.
                -- format_on_save = function(bufnr)
                --     -- inside the format filter
                --     -- if
                --     --     #vim.lsp.get_clients({
                --     --         name = 'typescript-tools',
                --     --     }) > 0
                --     -- then
                --     --     vim.cmd('TSToolsFixAll')
                --     -- end
                --
                --     -- if slow_format_filetypes[vim.bo[bufnr].filetype] then
                --     --     return
                --     -- end
                --
                --     -- local function on_format(err)
                --     --     if err and err:match('timeout$') then
                --     --         print(
                --     --             'conform timeout for ' .. vim.bo[bufnr].filetype
                --     --         )
                --     --         -- slow_format_filetypes[vim.bo[bufnr].filetype] = true
                --     --     end
                --     -- end
                --
                --     -- return { timeout_ms = 500, lsp_format = 'fallback' },
                --     --     on_format
                --     return {
                --         timeout_ms = 500,
                --         lsp_format = 'first',
                --         -- bufnr = bufnr,
                --         -- typescript tools fix all here
                --         -- can prevent specific lsps from formatting here
                --         filter = format_filter,
                --         stop_after_first = false,
                --     }
                --     -- },
                --     --     on_format
                -- end,

                -- NOTE: this will automatically set autocmd bufwritepost
                -- format_after_save = function(bufnr)
                --     if not slow_format_filetypes[vim.bo[bufnr].filetype] then
                --         return
                --     end
                --     return {
                --         lsp_format = 'first',
                --         async = true,
                --         filter = format_filter,
                --         stop_after_first = false,
                --     }
                --     -- return { lsp_format = 'first' }
                -- end,
            })

            -- better than eslint_d
            -- vim.api.nvim_create_autocmd('BufWritePre', {
            --     pattern = '*.vue,*.ts,*.js,*.svelte,*.tsx,*.jsx,*.astro,*.html',
            --     callback = function(event)
            --         -- vim.cmd('EslintFixAll')
            --         if
            --             -- eslint_languages[vim.bo.filetype]
            --             #vim.lsp.get_clients({
            --                 name = 'eslint',
            --                 bufnr = event.buf,
            --             }) > 0
            --         then
            --             vim.cmd('EslintFixAll')
            --             -- vim.lsp.buf.format()
            --             return
            --         end
            --     end,
            -- })

            local lsp_format_on_save_group = vim.api.nvim_create_augroup(
                'lsp_format_on_save',
                -- The `clear` option in `vim.api.nvim_create_augroup` is used to clear any existing autocmds in the group before creating the new group. This ensures that the group starts fresh without any previously defined autocmds.
                -- - `clear = true`: Clears any existing autocmds in the group before creating the new group.
                -- - `clear = false` (or omitted): Keeps any existing autocmds in the group.
                -- This is useful to avoid conflicts or unintended behavior from previously defined autocmds in the same group.
                { clear = false }
            )

            -- local exec_lsp_callback = {
            --     ['typescript-tools'] = function()
            --         vim.cmd('TSToolsFixAll')
            --     end,
            -- }
            --
            -- local print_table = require('user.utils.functions').print_table

            if _G.user.lsp.format_on_save then
                local lsp_callbacks = _G.user.lsp.lsp_callbacks

                vim.api.nvim_create_autocmd('BufWritePre', {
                    group = lsp_format_on_save_group,
                    pattern = '*',
                    callback = function(event)
                        -- local filetype = vim.bo.filetype

                        -- don't format if no formatter is set
                        -- if formatters_by_ft[vim.bo.filetype] == nil then
                        --     return
                        -- end

                        -- if
                        --     #vim.lsp.get_clients({
                        --         name = 'eslint',
                        --     }) > 0
                        -- then
                        --         NOTE: this is not in vim.lsp.buf.format()
                        --     vim.cmd('EslintFixAll')
                        -- end

                        local clients = vim.lsp.get_clients({
                            bufnr = event.buf,
                        })

                        -- for _, client in pairs(clients) do
                        --     if _G.user.lsp.lsp_callbacks[client.name] then
                        --         _G.user.lsp.lsp_callbacks[client.name]()
                        --     end
                        -- end

                        -- if
                        --     #vim.lsp.get_clients({
                        --         name = 'typescript-tools',
                        --     }) > 0
                        -- then
                        --     vim.cmd('TSToolsFixAll')
                        -- end

                        -- NOTE: chatgpt performance improvement
                        for i = 1, #clients do
                            local client = clients[i]
                            local callback = lsp_callbacks[client.name]
                            if callback then
                                callback()
                            end
                        end

                        -- vim.lsp.buf.format({
                        --     bufnr = event.buf,
                        --     -- this filter skips typescript-tools (conflicts with eslint)
                        --     filter = format_filter,
                        -- })

                        conform.format(
                            {
                                bufnr = event.buf,
                                -- async = true,
                                -- lsp_format = 'never',
                                lsp_format = 'first',
                                stop_after_first = false,
                                -- this filter skips typescript-tools (conflicts with eslint)
                                filter = format_filter,
                                -- id
                                -- name
                                -- undojoin
                                -- lsp_fallback = true,
                            }
                            -- , function(err) end
                        )
                    end,
                })
            end
        end,
    },
}
