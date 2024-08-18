--[[
This file is for setting up nvim-lint.

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
    'mfussenegger/nvim-lint',
    event = 'BufEnter',
    config = function()
        local lint = require('lint')

        -- TODO: add checkstyle for java
        -- snyk for everything

        -- NOTE: provide some things none ls does not

        lint.linters_by_ft = {
            -- markdown = { 'markdownlint' },
            -- go = { 'golangcilint' },
            -- javascript = { 'eslint_d' },
            -- javascriptreact = { 'eslint_d' },
            -- gitcommit = { 'commitlint' },
            html = {
                -- 'snyk_iac',
                'htmlhint',
                'biomejs',
            },

            ['angular.html'] = {
                -- 'snyk_iac',
                'htmlhint',
                'biomejs',
            },

            astro = { 'biomejs' },
            vue = { 'biomejs' },
            json = { 'biomejs' },
            jsonc = { 'biomejs' },
            css = { 'biomejs' },

            typescript = {
                -- 'snyk_iac',
                'biomejs',
            },
            javascript = { 'biomejs' },
            typescriptreact = { 'biomejs' },
            javascriptreact = { 'biomejs' },

            -- go = { 'snyk_iac' },
            --
            -- java = { 'snyk_iac' },
            --
            -- rust = { 'snyk_iac' },

            dockerfile = { 'hadolint' },
        }

        vim.api.nvim_create_autocmd('BufWritePost', {
            callback = function()
                require('lint').try_lint()
            end,
        })
    end,
}
