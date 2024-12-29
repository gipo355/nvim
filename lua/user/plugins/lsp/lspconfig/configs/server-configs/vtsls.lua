local M = {}
M.setup = function()
    return {
        -- on_attach = function(client, bufnr) end,

        flags = {
            -- https://www.reddit.com/r/neovim/comments/1guifug/comment/lxuzjhn/
            -- https://github.com/gonstoll/dotfiles/blob/master/.config/nvim/lua/plugins/lsp/servers/eslint.lua#L11-L14
            -- debounce_text_changes = 500
            allow_incremental_sync = false,
            debounce_text_changes = 1000,
        },

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
