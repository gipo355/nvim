return {
    'nvim-java/nvim-java',
    enabled = _G.user.java.enable,
    event = 'BufRead *.java',
    dependencies = {
        'nvim-java/nvim-java-refactor',
        'nvim-java/lua-async-await',
        'nvim-java/nvim-java-core',
        'nvim-java/nvim-java-test',
        'nvim-java/nvim-java-dap',
        'MunifTanjim/nui.nvim',
        -- Copied from docs, can merge setups
        {
            'neovim/nvim-lspconfig',
            opts = {
                servers = {
                    jdtls = {
                        -- your jdtls configuration goes here

                        -- from https://github.com/gmr458/nvim/blob/main/ftplugin/java.lua
                        -- https://www.reddit.com/r/neovim/comments/18g2jgr/having_the_worst_time_trying_to_use_jdtls/
                        --
                        -- Here you can configure eclipse.jdt.ls specific settings
                        -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
                        -- for a list of options
                        settings = {
                            java = {
                                server = { launchMode = 'Hybrid' },
                                eclipse = {
                                    downloadSources = true,
                                },
                                maven = {
                                    downloadSources = true,
                                },
                                configuration = {
                                    runtimes = {
                                        {
                                            name = 'JavaSE-1.8',
                                            path = '~/.sdkman/candidates/java/8.0.402-tem',
                                        },
                                        {
                                            name = 'JavaSE-11',
                                            path = '~/.sdkman/candidates/java/11.0.22-tem',
                                        },
                                        {
                                            name = 'JavaSE-17',
                                            path = '~/.sdkman/candidates/java/17.0.10-tem',
                                        },
                                        {
                                            name = 'JavaSE-21',
                                            path = '~/.sdkman/candidates/java/21.0.3-tem',
                                        },
                                    },
                                },
                                references = {
                                    includeDecompiledSources = true,
                                },
                                implementationsCodeLens = {
                                    enabled = false,
                                },
                                referenceCodeLens = {
                                    enabled = false,
                                },
                                inlayHints = {
                                    parameterNames = {
                                        enabled = 'none',
                                    },
                                },
                                signatureHelp = {
                                    enabled = true,
                                    description = {
                                        enabled = true,
                                    },
                                },
                                sources = {
                                    organizeImports = {
                                        starThreshold = 9999,
                                        staticStarThreshold = 9999,
                                    },
                                },
                            },
                            redhat = { telemetry = { enabled = false } },
                        },
                    },
                },
                setup = {
                    jdtls = function()
                        require('java').setup({
                            -- your nvim-java configuration goes here
                        })
                    end,
                },
            },
        },
        'mfussenegger/nvim-dap',
        {
            'williamboman/mason.nvim',
            opts = {
                registries = {
                    'github:nvim-java/mason-registry',
                    'github:mason-org/mason-registry',
                },
            },
        },
    },
    -- config = function()
    --     -- which one first?
    --     require('lspconfig').jdtls.setup({})
    --     require('java').setup()
    -- end,
}
