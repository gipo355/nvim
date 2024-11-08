local M = {}
M.setup = function()
    return {
        on_attach = function(client, bufnr)
            vim.keymap.set({ 'n', 'v' }, '<C-c>', function()
                vim.lsp.buf.code_action({
                    context = {
                        diagnostics = {
                            enable = true,
                        },
                        only = {
                            'source',
                            'quickfix',
                            'refactor',
                            'notebook',
                            'source.fixAll',
                            'source.organizeImports',
                            'refactor.move',
                            'refactor.inline',
                            'refactor.extract',
                            'refactor.rewrite',
                        },
                    },
                })
            end, {
                buffer = bufnr,
                desc = 'lsp code action',
            })
        end,
        settings = {
            complete_function_calls = true,
            vtsls = {
                enableMoveToFileCodeAction = true,
                autoUseWorkspaceTsdk = true,
                experimental = {
                    completion = {
                        enableServerSideFuzzyMatch = true,
                    },
                },
            },
            typescript = {
                updateImportsOnFileMove = { enabled = 'always' },
                suggest = {
                    completeFunctionCalls = true,
                },
                inlayHints = {
                    enumMemberValues = { enabled = true },
                    functionLikeReturnTypes = { enabled = true },
                    parameterNames = { enabled = 'literals' },
                    parameterTypes = { enabled = true },
                    propertyDeclarationTypes = { enabled = true },
                    variableTypes = { enabled = false },
                },
            },
        },
    }
end
return M
