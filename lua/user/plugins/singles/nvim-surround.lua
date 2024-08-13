-- # surround, conflicts with mini.surround
-- also conflicts with flash.nvim (ds is jump)
return {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    config = function()
        require('nvim-surround').setup({
            keymaps = {
                -- insert = '<C-g>s',
                insert = 'cvii',
                -- insert_line = '<C-g>S',
                insert_line = 'cvil',
                normal = 'cvas',
                normal_cur = 'cvass',
                normal_line = 'cvaS',
                normal_cur_line = 'cvaSS',
                visual = 'cvv',
                visual_line = 'cvs',
                delete = 'cvds',
                change = 'cvrs',
                change_line = 'cvrS',
            },
        })
    end,
}
