-- deno
return {
    'sigmasd/deno-nvim',
    event = 'BufRead',
    dependencies = {
        'neovim/nvim-lspconfig',
    },
    config = function()
        local ok, deno = pcall(require, 'deno-nvim')

        if not ok then
            return
        end

        -- in lsp-installers
        -- vim.g.markdown_fenced_languages = {
        --     "ts=typescript",
        -- }

        deno.setup({
            server = {
                root_dir = require('lspconfig').util.root_pattern(
                    'deno.json',
                    'deno.jsonc'
                ),
                on_attach = function(client, bufnr)
                    vim.keymap.set(
                        { 'n', 'v' },
                        '<C-c>',
                        -- ':Lspsaga code_action<cr>',
                        vim.lsp.buf.code_action,
                        { buffer = bufnr, desc = 'lsp code action' }
                    )

                    -- vim.lsp.codelens.refresh()
                    vim.lsp.inlay_hint.enable()

                    local active_clients = vim.lsp.get_clients()

                    if client.name == 'denols' then
                        for _, client_ in pairs(active_clients) do
                            -- stop tsserver if denols is already active
                            if
                                client_.name == 'tsserver'
                                or client_.name == 'typescript-tools'
                            then
                                client_.stop()
                            end
                        end
                    end
                end,
                settings = {
                    deno = {
                        enable = true,
                        suggest = {
                            imports = {
                                hosts = {
                                    ['https://crux.land'] = true,
                                    ['https://deno.land'] = true,
                                    ['https://x.nest.land'] = true,
                                },
                            },
                        },
                        inlayHints = {
                            parameterNames = {
                                enabled = 'all',
                            },
                            parameterTypes = {
                                enabled = true,
                            },
                            variableTypes = {
                                enabled = true,
                            },
                            propertyDeclarationTypes = {
                                enabled = true,
                            },
                            functionLikeReturnTypes = {
                                enabled = true,
                            },
                            enumMemberValues = {
                                enabled = true,
                            },
                        },
                    },
                },
            },
        })
    end,
}
