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
                php = { 'prettier' },
                css = { 'prettier' },
                scss = { 'prettier' },
                html = { 'prettier' },
                ['angular.html'] = { 'prettier' },
                yaml = { 'prettier' },
                markdown = { 'prettier' },
                pug = { 'prettier' },
                json = { 'prettier' },
                jsonc = { 'prettier' },
                astro = { 'prettier' },
                javascript = { 'prettier' },
                javascriptreact = { 'prettier' },
                typescript = { 'prettier' },
                typescriptreact = { 'prettier' },
                svelte = { 'prettier' },
                vue = { 'prettier' },
                less = { 'prettier' },
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
            require('conform').setup({
                notify_on_error = false,
                format_on_save = {
                    timeout_ms = 1500,
                    lsp_fallback = true, -- true, false, 'always'
                },
                formatters_by_ft = formatters_by_ft,
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
            vim.api.nvim_create_autocmd('BufWritePre', {
                -- group = 'lsp_format_on_save',
                pattern = '*',
                callback = function(event)
                    -- don't format if no formatter is set
                    if formatters_by_ft[vim.bo.filetype] == nil then
                        return
                    end

                    if
                        #vim.lsp.get_clients({
                            name = 'eslint',
                        }) > 0
                    then
                        vim.cmd('EslintFixAll')
                    end

                    if
                        #vim.lsp.get_clients({
                            name = 'typescript-tools',
                        }) > 0
                    then
                        vim.cmd('TSToolsFixAll')
                    end

                    require('conform').format({
                        bufnr = event.buf,
                        lsp_fallback = true,
                    })
                end,
            })
        end,
    },
}
