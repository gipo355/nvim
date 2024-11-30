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
                'tidy',
                -- 'biomejs',
            },
            xml = { 'tidy' },

            markdown = { 'markdownlint' },

            yaml = { 'yamllint' },

            gitcommit = { 'commitlint' },

            proto = { 'buf_lint' },

            ['angular.html'] = {
                -- 'snyk_iac',
                'htmlhint',
                'tidy',
                -- 'biomejs',
            },

            -- groovy = { 'npm-groovy-lint' },

            -- astro = { 'biomejs' },
            -- json = { 'biomejs' },
            -- vue = { 'biomejs' },
            -- jsonc = { 'biomejs' },
            -- css = { 'biomejs' },

            -- typescript = {
            --     -- 'snyk_iac',
            --     'biomejs',
            -- },
            -- javascript = { 'biomejs' },
            -- typescriptreact = { 'biomejs' },
            -- javascriptreact = { 'biomejs' },

            zsh = { 'shellcheck', 'zsh' },
            sh = { 'shellcheck', 'zsh' },
            bash = { 'shellcheck', 'zsh' },

            -- go = { 'snyk_iac' },

            -- here or nonels?
            -- java = {
            --     -- 'snyk_iac',
            --     'checkstyle',
            -- },
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
