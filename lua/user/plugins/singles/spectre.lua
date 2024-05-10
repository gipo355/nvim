local set_desc = require('user.utils.functions').set_keymap_desc
return {
    'windwp/nvim-spectre',
    event = 'BufRead',
    config = function()
        require('spectre').setup()
        -- {
        --     '<leader>aj',
        --     "<cmd>lua require('spectre').open()<cr>",
        --     'n',
        --     desc = 'Spectre replace',
        -- },
        vim.keymap.set(
            'n',
            '<leader>Aj',
            "<cmd>lua require('spectre').open()<cr>",
            set_desc('Spectre replace')
        )
        vim.keymap.set(
            'n',
            '<leader>Aw',
            "<cmd>lua require('spectre').open_visual({select_word=true})<cr>",
            set_desc('Spectre Replace word')
        )
        vim.keymap.set(
            'n',
            '<leader>Ab',
            "<cmd>lua require('spectre').open_file_search()<cr>",
            set_desc('Spectre Replace in buffer')
        )
    end,
}
