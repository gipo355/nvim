return {

    -- multicursor
    -- this sets m-\ a-\ keybind \\\\\\
    {
        'mg979/vim-visual-multi',
        enabled = _G.user.additional_plugins.multi_cursor,
        event = 'BufReadPre',
    },
}
