local constants = require('user.utils.constants')
--[[
This file is for setting up none-ls, a plugin that provides formatters, linters, and code actions for languages that don't have a language server.

The whole setup contains three parts:
- None-ls
- Conform
- Nvim-lint

conform and nvim-lint should be preferred when possible.

they together cover the whole range of formatters, linters, and code actions for languages that don't have a language server.

In addition, elf can be used for custom lsps

]]
--

-- TODO: fix this none-ls, copy from lvim

return {
    'nvimtools/none-ls.nvim',

    event = 'BufEnter',

    config = function()
        -- ### prefer LSP if available ( have to insall null-ls formatters individually )

        local null_ls = require('null-ls')

        local sources = {
            -- ###
            -- FORMATTERS
            -- ###

            -- spelling
            --null_ls.builtins.formatting.codespell,

            -- css, scss
            -- null_ls.builtins.formatting.stylelint,

            -- shell
            null_ls.builtins.formatting.shfmt,

            -- protobuf
            null_ls.builtins.formatting.buf,

            -- markdown
            null_ls.builtins.formatting.markdownlint,

            -- go
            -- NOTE: possible conflicts with conform and go plugin?

            -- null_ls.builtins.formatting.gofmt.with({
            --     filetypes = { 'go', 'gomod', 'gowork', 'templ' },
            -- }), -- using gofumpt

            -- NOTE: this is builtin gopls (and go plugin)
            -- null_ls.builtins.formatting.gofumpt.with({
            --     filetypes = { 'go', 'gomod', 'gowork', 'templ' },
            -- }), -- in gopls

            -- null_ls.builtins.formatting.goimports.with({
            --     filetypes = { 'go', 'gomod', 'gowork', 'templ' },
            -- }), -- used in golines already

            -- NOTE: this may conflict with go plugin and gopls lsp
            null_ls.builtins.formatting.goimports_reviser.with({
                filetypes = { 'go', 'gomod', 'gowork', 'templ' },
            }),

            -- go
            null_ls.builtins.formatting.golines.with({
                filetypes = { 'go', 'gomod', 'gowork', 'templ' },
                -- extra_args = { '--base-formatter gofumpt' },
            }),

            -- lua
            -- null_ls.builtins.formatting.stylua, -- using conform

            -- csharp
            -- null_ls.builtins.formatting.csharpier, -- requires dotnet-csharpier

            -- ts,js
            -- null_ls.builtins.formatting.eslint_d,
            -- null_ls.builtins.formatting.prettierd.with({ -- using conform
            --     filetypes = {
            --         'pug',
            --         'markdown',
            --         'json',
            --         'jsonc',
            --         'html',
            --         'yaml',
            --         'css',
            --         'scss',
            --         'less',
            --         'javascript',
            --         'javascriptreact',
            --         'typescript',
            --         'typescriptreact',
            --         'vue',
            --         'astro',
            --         'svelte',
            --     },
            -- }), -- trying to format markdown, already set in lsp file
            -- null_ls.builtins.formatting.prettier.with({
            --     filetypes = {
            --         'pug',
            --         'markdown',
            --         'json',
            --         'jsonc',
            --         'html',
            --         'yaml',
            --         'css',
            --         'scss',
            --         'less',
            --         'javascript',
            --         'javascriptreact',
            --         'typescript',
            --         'typescriptreact',
            --         'vue',
            --         'astro',
            --         'svelte',
            --         'html',
            --         'json',
            --         'svelte',
            --         'markdown',
            --         'css',
            --         'javascript',
            --         'javascriptreact',
            --     },
            -- }), -- trying to format markdown

            -- sql
            -- null_ls.builtins.formatting.sqlfluff.with({
            --     extra_args = { '--dialect', 'postgres' },
            -- }),

            -- java
            -- null_ls.builtins.formatting.google_java_format, -- conform

            -- php
            -- null_ls.builtins.formatting.phpcsfixer, -- conform

            -- yaml -conform
            -- null_ls.builtins.formatting.yamlfmt,

            -- python
            -- null_ls.builtins.formatting.isort,
            -- null_ls.builtins.formatting.black,

            -- ###
            -- DIAGNOSTICS
            -- ###

            -- protobuf
            null_ls.builtins.diagnostics.buf,

            -- GO
            -- here or lspconfig or go plugin or nvim-lint
            -- only works here
            null_ls.builtins.diagnostics.golangci_lint.with({ -- lspconfig doesn't work
                filetypes = { 'go', 'gomod', 'gowork', 'templ', 'gotempl' },
            }),

            -- sql
            -- null_ls.builtins.diagnostics.sqlfluff.with({
            --     extra_args = { '--dialect', 'postgres' },
            -- }),

            -- git
            null_ls.builtins.diagnostics.commitlint,

            -- null_ls.builtins.diagnostics.eslint_d, // using lsp instead

            -- yaml
            null_ls.builtins.diagnostics.yamllint,

            -- shell
            null_ls.builtins.diagnostics.zsh.with({
                filetypes = { 'zsh', 'sh', 'bash' },
            }),

            -- markdown
            -- null_ls.builtins.diagnostics.proselint, -- markdown

            -- many
            null_ls.builtins.diagnostics.semgrep.with({
                extra_args = { '--config', 'auto' },
                method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
            }),

            -- python
            -- null_ls.builtins.diagnostics.pylint.with({
            --     diagnostics_postprocess = function(diagnostic)
            --         diagnostic.code = diagnostic.message_id
            --     end,
            -- }),

            -- php
            -- null_ls.builtins.diagnostics.phpcs,
            -- null_ls.builtins.diagnostics.phpstan,

            -- docker
            -- null_ls.builtins.diagnostics.hadolint, -- in nvim-lint

            -- java
            -- null_ls.builtins.diagnostics.checkstyle.with({
            --     extra_args = {
            --         '-c',
            --         -- '/home/wolf/checkstyle/intellij_google_style.xml',
            --         constants.USER_HOME .. '/checkstyle/google_checks.xml',
            --     }, -- or "/sun_checks.xml" or path to self written rules
            -- }),

            -- groovy gradle
            -- null_ls.builtins.formatting.npm_groovy_lint.with({
            --     filetypes = { 'groovy', 'gradle' },
            -- }),
            -- null_ls.builtins.diagnostics.npm_groovy_lint.with({
            --     filetypes = { 'groovy', 'gradle' },
            -- }),

            -- XML
            -- null_ls.builtins.formatting.tidy,
            null_ls.builtins.diagnostics.tidy,

            -- markdown
            null_ls.builtins.diagnostics.markdownlint,

            -- markdown
            -- null_ls.builtins.diagnostics.codespell.with({
            --     filetypes = { 'markdown', 'text' },
            -- }),

            -- markdown
            -- null_ls.builtins.diagnostics.write_good.with({
            --     filetypes = { 'markdown', 'text' },
            -- }),

            -- ###
            -- COMPLETION
            -- ###

            -- -- too noisy in cmp
            -- null_ls.builtins.completion.spell,
            null_ls.builtins.completion.tags,

            -- ###
            -- CODE ACTIONS
            -- ###

            -- markdown
            null_ls.builtins.code_actions.proselint,

            -- git
            null_ls.builtins.code_actions.gitsigns,
            null_ls.builtins.code_actions.gitrebase,

            -- go
            null_ls.builtins.code_actions.gomodifytags,
            null_ls.builtins.code_actions.impl,

            -- many
            null_ls.builtins.code_actions.refactoring,
        }

        -- Golang from go plugin
        local ok, gonull = pcall(require, 'go.null_ls')
        if ok then
            -- local golangci_lint = gonull.golangci_lint()
            local gotest = gonull.gotest()
            local gotest_codeaction = gonull.gotest_action()
            -- table.insert(sources, golangci_lint)
            table.insert(sources, gotest)
            table.insert(sources, gotest_codeaction)
        end

        null_ls.setup({
            sources = sources,
            debug = false,
            debounce = 1000,
            default_timeout = 5000,
        })

        ----
        --local code_actions = require "lvim.lsp.null-ls.code_actions"
        --
        --code_actions.setup {
        --    --{
        --    --    exe = "eslint",
        --    --    extra_args = { "--fix" },
        --    --    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
        --    --},
        --    {
        --        name = "eslint"
        --    }
        --}

        -- NOTE: we use conform to format, none-ls for diagnostics
        --
        -- local format_filter = require(
        --     'user.plugins.lsp.formatters.utils.formatting'
        -- ).format_filter
        -- local format =
        --     require('user.plugins.lsp.formatters.utils.formatting').format

        -- conform
        -- local eslint_languages = {
        --     ['javascript'] = true,
        --     ['typescript'] = true,
        --     ['javascriptreact'] = true,
        --     ['typescriptreact'] = true,
        --     ['astro'] = true,
        --     ['svelte'] = true,
        --     ['vue'] = true,
        --     ['html'] = true,
        --     ['angular.html'] = true,
        -- }

        -- TODO: fix overlapping double save with conform
        -- vim.api.nvim_create_autocmd('BufWritePre', {
        --     group = 'lsp_format_on_save',
        --     pattern = '*',
        --     callback = function()
        --         -- don't format for those filetypes, use conform
        --         if eslint_languages[vim.bo.filetype] then
        --             return
        --         end
        --
        --         if vim.bo.filetype == 'html' then
        --             return
        --         end
        --         if vim.bo.filetype == 'lua' then
        --             return
        --         end
        --
        --         if vim.bo.filetype == 'cs' then
        --             -- require('lvim.lsp.utils').format({
        --             --     timeout_ms = 2000,
        --             --     filter = require('lvim.lsp.utils').format_filter,
        --             -- })
        --             format({
        --                 timeout_ms = 2000,
        --                 filter = format_filter,
        --             })
        --             return
        --         end
        --
        --         -- conform
        --         -- if
        --         --     eslint_languages[vim.bo.filetype]
        --         --     and #vim.lsp.get_clients({ name = 'eslint' }) > 0
        --         -- then
        --         --     vim.cmd('EslintFixAll')
        --         --     vim.lsp.buf.format()
        --         --
        --         --     return
        --         -- end
        --
        --         vim.lsp.buf.format()
        --     end,
        -- })
    end,
}
