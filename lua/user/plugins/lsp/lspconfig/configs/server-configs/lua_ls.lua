local M = {}
M.setup = function()
    return {
        -- cmd = {...},
        -- filetypes { ...},
        -- capabilities = {},
        on_attach = function(client, bufnr)
            vim.keymap.set(
                { 'n', 'v' },
                '<C-c>',
                -- ':Lspsaga code_action<cr>',
                vim.lsp.buf.code_action,
                { buffer = bufnr, desc = 'lsp code action' }
            )

            -- vim.lsp.inlay_hint.enable()
        end,
        settings = {
            Lua = {
                hint = {
                    enable = true,
                    arrayIndex = 'Enable',
                    setType = true,
                },
                runtime = { version = 'LuaJIT' },
                workspace = {
                    checkThirdParty = false,
                    -- Tells lua_ls where to find all the Lua files that you have loaded
                    -- for your neovim configuration.
                    library = {
                        '${3rd}/luv/library',
                        unpack(vim.api.nvim_get_runtime_file('', true)),
                    },
                    -- If lua_ls is really slow on your computer, you can try this instead:
                    -- library = { vim.env.VIMRUNTIME },
                },
                completion = {
                    callSnippet = 'Replace',
                },
                -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                -- diagnostics = { disable = { 'missing-fields' } },
            },
        },
    }
end
return M
