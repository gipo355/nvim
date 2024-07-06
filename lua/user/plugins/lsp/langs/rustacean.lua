return {
    'mrcjkb/rustaceanvim',
    -- version = '^3', -- Recommended
    ft = { 'rust' },
    config = function()
        vim.g.rustaceanvim = {
            server = {
                on_attach = function(client, bufnr)
                    vim.keymap.set(
                        { 'n', 'v' },
                        '<C-c>',
                        -- ':Lspsaga code_action<cr>',
                        vim.lsp.buf.code_action,
                        { buffer = bufnr, desc = 'lsp code action' }
                    )

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
                            -- command = 'cargo',
                            -- extraArgs = {
                            -- 'clippy',
                            -- '--fix',
                            -- '--',
                            --     "clippy",
                            --     "--no-deps",
                            -- '-D clippy::correctness',
                            -- '-D clippy::complexity',
                            -- '-W clippy::nursery',
                            -- '-W clippy::unwrap_used',
                            -- '-W clippy::expect_used',
                            -- '-W clippy::perf',
                            -- '-W clippy::pedantic',
                            -- '--fix',
                            -- '--message-format=json',
                            -- '--allow-dirty',
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
