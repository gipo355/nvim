local M = {}

M.load_servers = function(capabilities)
    return {
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`tsserver`) will work just fine
        -- tsserver = {},

        -- unocss = require(
        --     'user.plugins.lsp.lspconfig.configs.server-configs.unocss'
        -- ).setup(),

        cssls = require(
            'user.plugins.lsp.lspconfig.configs.server-configs.cssls'
        ).setup(capabilities),

        cssmodules_ls = require(
            'user.plugins.lsp.lspconfig.configs.server-configs.cssmodules'
        ).setup(),

        -- snyk_ls = require(
        --     'user.plugins.lsp.lspconfig.configs.server-configs.snyk_ls'
        -- ).setup(),

        -- omnisharp = require(
        --     'user.plugins.lsp.lspconfig.configs.server-configs.omnisharp'
        -- ).setup(capabilities),

        html = require(
            'user.plugins.lsp.lspconfig.configs.server-configs.html'
        ).setup(),

        emmet_language_server = require(
            'user.plugins.lsp.lspconfig.configs.server-configs.emmet_lsp'
        ).setup(),

        -- htmx = require('user.plugins.lsp.lspconfig.configs.server-configs.htmx').setup(),

        -- using go.nvim lsp config
        gopls = require(
            'user.plugins.lsp.lspconfig.configs.server-configs.gopls'
        ).setup(),

        -- golangci_lint_ls = require(
        --     'user.plugins.lsp.lspconfig.configs.server-configs.golangci_lint'
        -- ).setup(),

        -- intelephense = require(
        --     'user.plugins.lsp.lspconfig.configs.server-configs.intelephense'
        -- ).setup(),

        -- phpactor = require(
        --     'user.plugins.lsp.lspconfig.configs.server-configs.phpactor'
        -- ).setup(),

        eslint = require(
            'user.plugins.lsp.lspconfig.configs.server-configs.eslint'
        ).setup(capabilities),

        -- BUG: not always working, using nvim-lint
        biome = require(
            'user.plugins.lsp.lspconfig.configs.server-configs.biome'
        ).setup(capabilities),

        jsonls = require(
            'user.plugins.lsp.lspconfig.configs.server-configs.jsonls'
        ).setup(),

        yamlls = require(
            'user.plugins.lsp.lspconfig.configs.server-configs.yamlls'
        ).setup(),

        stylelint_lsp = require(
            'user.plugins.lsp.lspconfig.configs.server-configs.stylelint_lsp'
        ).setup(),

        -- kotlin
        -- kotlin_language_server = require(
        --     'user.plugins.lsp.lspconfig.configs.server-configs.kotlin_language_server'
        -- ).setup(),

        -- vuels = {
        --     root_dir = require('lspconfig').util.root_pattern('vue.config.js'),
        -- },
        -- ['vue-language-server'] = {},
        volar = {},
        -- volar = require(
        --     'user.plugins.lsp.lspconfig.configs.server-configs.volar'
        -- ).setup(),

        -- ltex = {
        --     filetypes = { 'tex', 'latex', 'markdown', 'mdx' },
        -- },

        -- ##### We use neodev by folke #####
        lua_ls = require(
            'user.plugins.lsp.lspconfig.configs.server-configs.lua_ls'
        ).setup(),

        angularls = require(
            'user.plugins.lsp.lspconfig.configs.server-configs.angularls'
        ).setup(),

        denols = require(
            'user.plugins.lsp.lspconfig.configs.server-configs.denols'
        ).setup(),

        -- using plugin tailwind-tools
        tailwindcss = require(
            'user.plugins.lsp.lspconfig.configs.server-configs.tailwindcss'
        ).setup(),

        helm_ls = {},
        stylua = {},
        bufls = {},
        -- groovyls = {},
        -- pylsp = {},
        -- gradle_ls = {},
        -- templ = {},
        svelte = {},
        rustywind = {},
        astro = {},
        vimls = {},
        bashls = {},
        -- tsserver = {},
        ts_ls = {}, -- new tsserver
        -- pyright = {},
        -- clangd = {},
        dockerls = {},
        dotls = {},
        terraformls = {},
        graphql = {},
        marksman = {}, -- markdown
        prismals = {},
        -- prosemd_lsp = {}, -- markdown
        -- sqlls = {},
        autotools_ls = {},

        -- not sure which one
        ['rust-analyzer'] = {},
        ['rust_analyzer'] = {},

        -- solidity = {},
        -- 'semgrep',
        -- "google-java-format",
        -- "sumneko_lua",
        -- 'grammarly',
        -- ['emmet_ls'] = {},
        -- "go",
        -- "markdown",
        -- "nginx",
        -- "openapi",
        -- "scss",
        -- "scala",
        -- 'typos_lsp',
        -- "vimscript",
        -- 'yamlls',
        -- "zsh"
        -- clangd = {},
        -- pyright = {},

        --[[ JAVA ]]
        -- "java_language_server",
        -- "java",

        lemminx = {}, -- xml
        ['sonarlint-language-server'] = {},

        -- jdtls = {}, -- manual require it at the end, no autoinstall (java plugin), in lspconfig.lua
    }
end

return M
