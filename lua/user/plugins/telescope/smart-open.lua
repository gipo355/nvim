local set_desc = require('user.utils.functions').set_keymap_desc

-- smart open frecency smart file finder
return {
    'danielfalk/smart-open.nvim',
    enabled = _G.user.additional_plugins.smart_open,
    branch = '0.2.x',
    event = 'VeryLazy',
    config = function()
        local ok, telescope = pcall(require, 'telescope')
        if not ok then
            return
        end
        telescope.load_extension('smart_open')
        vim.keymap.set('n', '<leader>sk', function()
            require('telescope').extensions.smart_open.smart_open()
        end, set_desc('smart open'))
        vim.keymap.set('n', 'so', function()
            require('telescope').extensions.smart_open.smart_open()
        end, set_desc('smart open'))
    end,
    dependencies = {
        'kkharji/sqlite.lua',
        'nvim-telescope/telescope.nvim',
        -- Only required if using match_algorithm fzf
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
        { 'nvim-telescope/telescope-fzy-native.nvim' },
    },
}
