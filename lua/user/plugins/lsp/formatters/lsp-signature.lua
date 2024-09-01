-- replaces noice lsp utils
-- can be replaced by nvim_lsp_signature_help cmp source
return {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    enabled = _G.user.lsp.function_signature.source == 'lsp_signature',
    opts = {
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        hint_enable = false,
        handler_opts = {
            border = 'single',
        },
    },
    config = function(_, opts)
        require('lsp_signature').setup(opts)

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local bufnr = args.buf
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if vim.tbl_contains({ 'null-ls' }, client.name) then -- blacklist lsp
                    return
                end
                require('lsp_signature').on_attach({
                    -- ... setup options here ...
                }, bufnr)
            end,
        })
    end,
}
