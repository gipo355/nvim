-- minimap
return {
    'gorbit99/codewindow.nvim',
    event = 'BufWinEnter',
    enabled = _G.user.codewindow.enable,
    config = function()
        local codewindow = require('codewindow')
        codewindow.setup({
            auto_enable = true,
            minimap_width = 10,
            window_border = 'none',
        })
        -- codewindow.apply_default_keybinds()
    end,
}
