local M = {}
M.setup = function()
    return {
        -- https://github.com/Integralist/nvim/blob/main/lua/plugins/lsp.lua#L10-L92
        on_attach = function()
            vim.lsp.inlay_hint.enable() -- uncomment to enable inlay hints for go
        end,
        capabilities = {
            textDocument = {
                completion = {
                    completionItem = {
                        commitCharactersSupport = true,
                        deprecatedSupport = true,
                        documentationFormat = {
                            'markdown',
                            'plaintext',
                        },
                        preselectSupport = true,
                        insertReplaceSupport = true,
                        labelDetailsSupport = true,
                        snippetSupport = true,
                        resolveSupport = {
                            properties = {
                                'documentation',
                                'details',
                                'additionalTextEdits',
                            },
                        },
                    },
                    contextSupport = true,
                    dynamicRegistration = true,
                },
            },
        },
        filetypes = {
            'go',
            'gomod',
            'gosum',
            'gotmpl',
            'gohtmltmpl',
            'gotexttmpl',
            'gowork',
            'templ',
        },
        message_level = vim.lsp.protocol.MessageType.Error,
        cmd = {
            'gopls', -- share the gopls instance if there is one already
            '-remote.debug=:0',
        },
        flags = {
            allow_incremental_sync = true,
            debounce_text_changes = 500,
        },
        -- NOTE: it is important to add handler to formatting handlers
        -- the async formatter will call these handlers when gopls responed
        -- without these handlers, the file will not be saved
        -- handlers = {
        --     [range_format] = function(...)
        --         vim.lsp.handlers[range_format](...)
        --         if vfn.getbufinfo('%')[1].changed == 1 then
        --             vim.cmd('noautocmd write')
        --         end
        --     end,
        --     [formatting] = function(...)
        --         vim.lsp.handlers[formatting](...)
        --         if vfn.getbufinfo('%')[1].changed == 1 then
        --             vim.cmd('noautocmd write')
        --         end
        --     end,
        -- },
        settings = {
            gopls = {
                directoryFilters = {
                    '-.git',
                    '-.vscode',
                    '-.idea',
                    '-.vscode-test',
                    '-node_modules',
                },
                analyses = {
                    fieldalignment = true,
                    nilness = true,
                    unusedparams = true,
                    unusedwrite = true,
                    useany = true,
                    unreachable = true,
                    ST1003 = true,
                    undeclaredname = true,
                    fillreturns = true,
                    nonewvars = true,
                    shadow = true,
                },
                hints = {
                    -- which?
                    assignVariableTypes = true,
                    compositeLiteralFields = true,
                    compositeLiteralTypes = true,
                    constantValues = true,
                    parameterNames = true,
                    functionTypeParameters = true,
                    rangeVariableTypes = true,
                },
                codelenses = {
                    generate = true,
                    gc_details = true,
                    test = true,
                    tidy = true,
                    vendor = true,
                    regenerate_cgo = true,
                    run_govulncheck = true,
                    upgrade_dependency = true,
                },
                experimentalPostfixCompletions = true,
                -- DISABLED: staticcheck
                --
                -- gopls doesn't invoke the staticcheck binary.
                -- Instead it imports the analyzers directly.
                -- This means it can report on issues the binary can't.
                -- But it's not a good thing (like it initially sounds).
                -- You can't then use line directives to ignore issues.
                --
                -- Instead of using staticcheck via gopls.
                -- We have golangci-lint execute it instead.
                --
                -- For more details:
                -- https://github.com/golang/go/issues/36373#issuecomment-570643870
                -- https://github.com/golangci/golangci-lint/issues/741#issuecomment-1488116634
                --
                staticcheck = false,
                gofumpt = true,
                usePlaceholders = true,
                completeUnimported = true,
                matcher = 'Fuzzy',
                diagnosticsDelay = '500ms',
                symbolMatcher = 'fuzzy',
                semanticTokens = true,
                -- noSemanticTokens = true, -- disable semantic string tokens so we can use treesitter highlight injection
                buildFlags = { '-tags', 'integration' },
                -- ['local'] = get_current_gomod(),
            },
        },
    }
end
return M
