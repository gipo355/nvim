-- replaces noice lsp utils
-- can be replaced by nvim_lsp_signature_help cmp source
return {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    enabled = _G.user.use_lsp_signature,
    opts = {
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
            border = 'single',
        },
    },
    config = function(_, opts)
        require('lsp_signature').setup(opts)
    end,
}
