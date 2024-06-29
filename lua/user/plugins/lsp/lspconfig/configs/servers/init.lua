local M = {}

M.load_servers = function(capabilities)
    return {
        -- clangd = {},
        -- pyright = {},
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`tsserver`) will work just fine
        -- tsserver = {},
        --

        unocss = require('user.plugins.lsp.lspconfig.configs.servers.unocss').setup(),

        cssls = require('user.plugins.lsp.lspconfig.configs.servers.cssls').setup(
            capabilities
        ),

        cssmodules_ls = require(
            'user.plugins.lsp.lspconfig.configs.servers.cssmodules'
        ).setup(),

        snyk_ls = require('user.plugins.lsp.lspconfig.configs.servers.snyk_ls').setup(),

        omnisharp = require(
            'user.plugins.lsp.lspconfig.configs.servers.omnisharp'
        ).setup(capabilities),

        html = require('user.plugins.lsp.lspconfig.configs.servers.html').setup(),

        emmet_language_server = require(
            'user.plugins.lsp.lspconfig.configs.servers.emmet_lsp'
        ).setup(),

        -- htmx = require('user.plugins.lsp.lspconfig.configs.servers.htmx').setup(),

        -- using go.nvim lsp config
        gopls = require('user.plugins.lsp.lspconfig.configs.servers.gopls').setup(),

        -- golangci_lint_ls = require('user.plugins.lsp.lspconfig.configs.servers.golangci_lint_ls').setup(),

        intelephense = require(
            'user.plugins.lsp.lspconfig.configs.servers.intelephense'
        ).setup(),

        phpactor = require(
            'user.plugins.lsp.lspconfig.configs.servers.phpactor'
        ).setup(),

        eslint = require('user.plugins.lsp.lspconfig.configs.servers.eslint').setup(
            capabilities
        ),

        jsonls = require('user.plugins.lsp.lspconfig.configs.servers.jsonls').setup(),

        yamlls = require('user.plugins.lsp.lspconfig.configs.servers.yamlls').setup(),

        stylelint_lsp = require(
            'user.plugins.lsp.lspconfig.configs.servers.stylelint_lsp'
        ).setup(),

        -- kotlin
        kotlin_language_server = require(
            'user.plugins.lsp.lspconfig.configs.servers.kotlin_language_server'
        ).setup(),

        vuels = {
            root_dir = require('lspconfig').util.root_pattern('vue.config.js'),
        },

        volar = require('user.plugins.lsp.lspconfig.configs.servers.volar').setup(),

        ltex = {
            filetypes = { 'tex', 'latex', 'markdown', 'mdx' },
        },

        -- ##### We use neodev by folke #####
        lua_ls = require('user.plugins.lsp.lspconfig.configs.servers.lua_ls').setup(),

        angularls = require(
            'user.plugins.lsp.lspconfig.configs.servers.angularls'
        ).setup(),

        denols = require('user.plugins.lsp.lspconfig.configs.servers.denols').setup(),

        -- using plugin tailwind-tools
        tailwindcss = require(
            'user.plugins.lsp.lspconfig.configs.servers.tailwindcss'
        ).setup(),

        helm_ls = {},
        stylua = {},
        bufls = {},
        groovyls = {},
        pylsp = {},
        gradle_ls = {},
        templ = {},
        svelte = {},
        ['sonarlint-language-server'] = {},
        rustywind = {},
        astro = {},
        vimls = {},
        bashls = {},
        ['rust-analyzer'] = {},
        tsserver = {},
        pyright = {},
        clangd = {},
        dockerls = {},
        dotls = {},
        terraformls = {},
        graphql = {},
        marksman = {},
        prismals = {},
        prosemd_lsp = {},
        sqlls = {},
        autotools_ls = {},
        -- solidity = {},
        -- 'rust_analyzer',
        -- 'semgrep',
        -- "google-java-format",
        -- "sumneko_lua",
        -- 'grammarly',
        -- 'emmet_ls',
        -- "go",
        -- "java",
        -- "markdown",
        -- "nginx",
        -- "openapi",
        -- "scss",
        -- "scala",
        -- 'typos_lsp',
        -- "vimscript",
        -- 'yamlls',
        -- "zsh"
        -- "java_language_server",
        -- 'jdtls', -- manual require it at the end, no autoinstall (java plugin)
    }
end

return M
