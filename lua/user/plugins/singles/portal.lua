return {
    'cbochs/portal.nvim',
    -- use fzf-lua jumps for this instead
    enabled = _G.user.additional_plugins.portal
        and not _G.user.pickers.fzf_lua.enable,
    keys = {
        {
            '<leader>o',
            '<cmd>Portal jumplist backward<cr>',
            'n',
            desc = 'Portal jumplist backward',
        },
        {
            '<leader>i',
            '<cmd>Portal jumplist forward<cr>',
            'n',
            desc = 'Portal jumplist forward',
        },
    },
    -- Optional dependencies
    dependencies = { 'cbochs/grapple.nvim' },
    opts = {},
}
