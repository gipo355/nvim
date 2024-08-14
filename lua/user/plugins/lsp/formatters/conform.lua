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
        config = function()
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
                typescriptreact = { 'prettierd' },

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

            require('conform').setup({
                notify_on_error = false,
                -- format_on_save = {
                --     timeout_ms = 1500,
                --     lsp_fallback = true, -- true, false, 'always'
                -- },
                formatters_by_ft = formatters_by_ft,

                -- NOTE: this will automatically set autocmd bufwritepre
                -- This snippet will automatically detect which formatters take too long to run synchronously and will run them async on save instead.
                format_on_save = function(bufnr)
                    if
                        #vim.lsp.get_clients({
                            name = 'typescript-tools',
                        }) > 0
                    then
                        vim.cmd('TSToolsFixAll')
                    end

                    if slow_format_filetypes[vim.bo[bufnr].filetype] then
                        return
                    end
                    local function on_format(err)
                        if err and err:match('timeout$') then
                            slow_format_filetypes[vim.bo[bufnr].filetype] = true
                        end
                    end

                    -- return { timeout_ms = 500, lsp_format = 'fallback' },
                    --     on_format
                    return {
                        timeout_ms = 200,
                        lsp_format = 'first',
                        -- async = true,
                        filter = format_filter,
                        stop_after_first = false,
                    },
                        on_format
                end,

                -- NOTE: this will automatically set autocmd bufwritepost
                format_after_save = function(bufnr)
                    if not slow_format_filetypes[vim.bo[bufnr].filetype] then
                        return
                    end
                    return {
                        lsp_format = 'first',
                        async = true,
                        filter = format_filter,
                        stop_after_first = false,
                    }
                    -- return { lsp_format = 'first' }
                end,
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

            -- TODO: fix overlapping double save with none-ls
            -- create a shared array for eslint langs
            -- for conform langs and none-ls langs
            -- use those for patterns
            -- conform auto format on save
            -- local lsp_format_on_save_group = vim.api.nvim_create_augroup(
            --     'lsp_format_on_save',
            --     -- The `clear` option in `vim.api.nvim_create_augroup` is used to clear any existing autocmds in the group before creating the new group. This ensures that the group starts fresh without any previously defined autocmds.
            --     -- - `clear = true`: Clears any existing autocmds in the group before creating the new group.
            --     -- - `clear = false` (or omitted): Keeps any existing autocmds in the group.
            --     -- This is useful to avoid conflicts or unintended behavior from previously defined autocmds in the same group.
            --     { clear = false }
            -- )

            -- local function on_format(err)
            --     print('on_format')
            --     -- if err and err:match('timeout$') then
            --     --     slow_format_filetypes[vim.bo[bufnr].filetype] = true
            --     -- end
            -- end

            -- vim.api.nvim_create_autocmd('BufWritePre', {
            --     group = lsp_format_on_save_group,
            --     pattern = '*',
            --     callback = function(event)
            --         -- don't format if no formatter is set
            --         -- if formatters_by_ft[vim.bo.filetype] == nil then
            --         --     return
            --         -- end
            --
            --         -- if
            --         --     #vim.lsp.get_clients({
            --         --         name = 'eslint',
            --         --     }) > 0
            --         -- then
            --         --         NOTE: this is not in vim.lsp.buf.format()
            --         --     vim.cmd('EslintFixAll')
            --         -- end
            --
            --         if
            --             #vim.lsp.get_clients({
            --                 name = 'typescript-tools',
            --             }) > 0
            --         then
            --             vim.cmd('TSToolsFixAll')
            --         end
            --
            --         require('conform').format(
            --             {
            --                 bufnr = event.buf,
            --                 -- async = true,
            --                 lsp_format = 'first',
            --                 stop_after_first = false,
            --                 -- id
            --                 -- name
            --                 filter = format_filter,
            --                 -- undojoin
            --                 -- lsp_fallback = true,
            --             }
            --             -- , function(err) end
            --         )
            --     end,
            -- })
        end,
    },
}
