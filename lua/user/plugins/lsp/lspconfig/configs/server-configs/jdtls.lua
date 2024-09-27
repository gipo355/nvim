local M = {}

local ok, navbuddy = pcall(require, 'nvim-navbuddy')

M.setup = function(capabilities)
    return {
        -- Your custom nvim-java configuration goes here
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            if ok then
                navbuddy.attach(client, bufnr)
            end

            -- client.server_capabilities.documentSymbolProvider =
            --     false
        end,

        init_options = {
            documentSymbol = {
                dynamicRegistration = false,
                hierarchicalDocumentSymbolSupport = true,
                labelSupport = true,

                symbolKind = {
                    valueSet = {
                        1,
                        2,
                        3,
                        4,
                        5,
                        6,
                        7,
                        8,
                        9,
                        10,
                        11,
                        12,
                        13,
                        14,
                        15,
                        16,
                        17,
                        18,
                        19,
                        20,
                        21,
                        22,
                        23,
                        24,
                        25,
                        26,
                        27,
                        28,
                        29,
                        30,
                        31,
                    },
                    tagSupport = {
                        valueSet = {},
                    },
                },
            },
        },

        -- NOTE: custom java settings
        -- https://github.com/ray-x/lsp_signature.nvim/issues/97
        -- all options:
        -- https://github.com/mfussenegger/nvim-jdtls
        -- https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        single_file_support = true,
        settings = {
            java = {
                autobuild = { enabled = false },
                server = { launchMode = 'Hybrid' },
                eclipse = {
                    downloadSources = true,
                },
                maven = {
                    downloadSources = true,
                },
                import = {
                    gradle = {
                        enabled = true,
                    },
                    maven = {
                        enabled = true,
                    },
                    exclusions = {
                        '**/node_modules/**',
                        '**/.metadata/**',
                        '**/archetype-resources/**',
                        '**/META-INF/maven/**',
                        '/**/test/**',
                    },
                },
                -- configuration = {
                --     runtimes = {
                --         {
                --             name = 'JavaSE-1.8',
                --             path = '~/.sdkman/candidates/java/8.0.402-tem',
                --         },
                --         {
                --             name = 'JavaSE-11',
                --             path = '~/.sdkman/candidates/java/11.0.22-tem',
                --         },
                --         {
                --             name = 'JavaSE-17',
                --             path = '~/.sdkman/candidates/java/17.0.10-tem',
                --         },
                --         {
                --             name = 'JavaSE-21',
                --             path = '~/.sdkman/candidates/java/21.0.3-tem',
                --         },
                --     },
                -- },
                references = {
                    includeDecompiledSources = true,
                },
                implementationsCodeLens = {
                    enabled = false,
                },
                referenceCodeLens = {
                    enabled = false,
                },
                -- https://github.com/eclipse-jdtls/eclipse.jdt.ls/issues/2948
                inlayHints = {
                    parameterNames = {
                        ---@type "none" | "literals" | "all"
                        enabled = 'all',
                    },
                },
                signatureHelp = {
                    enabled = true,
                    description = {
                        enabled = true,
                    },
                },
                symbols = {
                    includeSourceMethodDeclarations = true,
                },
                -- https://stackoverflow.com/questions/74844019/neovim-setting-up-jdtls-with-lsp-zero-mason
                rename = { enabled = true },

                contentProvider = {
                    preferred = 'fernflower',
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
    }
end
return M
