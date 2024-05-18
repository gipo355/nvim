return {
    'mrcjkb/rustaceanvim',
    -- version = '^3', -- Recommended
    ft = { 'rust' },
    config = function()
        vim.g.rustaceanvim = {
            server = {
                on_attach = function(client, bufnr)
                    vim.lsp.inlay_hint.enable() -- uncomment to enable inlay hints for rust
                    -- vim.lsp.codelens.refresh()
                    -- vim.diagnostic.disable()
                end,
                default_settings = {
                    -- rust-analyzer language server configuration
                    ['rust-analyzer'] = {
                        imports = {
                            granularity = {
                                group = 'module',
                            },
                            prefix = 'self',
                        },
                        procMacro = {
                            enable = true,
                        },
                        cargo = {
                            allFeatures = true,
                            loadOutDirsFromCheck = true,
                            buildScripts = {
                                enable = true,
                            },
                        },
                        assist = {
                            importMergeBehavior = 'last',
                            importPrefix = 'by_self',
                        },
                        checkOnSave = {
                            allFeatures = true,
                            command = 'clippy',
                            -- extraArgs = {
                            --     "--",
                            --     "clippy",
                            --     "--no-deps",
                            --     "-Dclippy::correctness",
                            --     "-Dclippy::complexity",
                            --     "--message-format=json",
                            --     "-Wclippy::perf",
                            --     "-Wclippy::pedantic",
                            --     "--fix",
                            --     "--allow-dirty",
                            -- },
                        },
                        -- check = {
                        --     -- features = "all",
                        --     overrideCommand = {
                        --         "cargo",
                        --         "clippy",
                        --         "--fix",
                        --         "--workspace",
                        --         "--message-format=json",
                        --         "--all-targets",
                        --         "--allow-dirty",
                        --     },
                        -- },
                    },
                },
            },
        }
    end,
}
