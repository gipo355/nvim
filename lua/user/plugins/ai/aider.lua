local set_desc = require('user.utils.functions').set_keymap_desc

return {
    'joshuavial/aider.nvim',
    event = 'VeryLazy',
    enabled = _G.user.ai.aider.enable,
    config = function()
        require('aider').setup({
            auto_manage_context = true,
            -- default_bindings = false,
        })

        vim.keymap.set('n', '<leader>ma', function()
            require('aider').AiderOpen()
        end, set_desc('Aider'))
    end,
}
