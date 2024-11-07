local utils = require('user.utils.functions')
local set_desc = utils.set_keymap_desc

-- create beautiful images :Silicon
return {
    'segeljakt/vim-silicon',
    enabled = _G.user.additional_plugins.silicon,
    event = 'BufReadPre',
    -- TODO: why doesn't this set the key in visual mode?
    -- keys = {
    --     {
    --         '<leader>hs',
    --         ':Silicon<cr>',
    --         { 'n', 'v' },
    --         desc = 'Silicon',
    --     },
    -- },
    config = function()
        vim.keymap.set(
            'n',
            '<leader>hs',
            '<cmd>Silicon<cr>',
            set_desc('Take code snapshot')
        )
        vim.keymap.set(
            'v',
            '<leader>hs',
            ':Silicon<cr>',
            set_desc('Take visual code snapshot')
        )
    end,
}
