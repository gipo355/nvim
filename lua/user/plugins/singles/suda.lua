return {
    'lambdalisue/suda.vim',
    enabled = _G.user.additional_plugins.suda,
    event = 'BufReadPre',
    config = function()
        -- vim.g.suda_smart_edit = 1
    end,
}
