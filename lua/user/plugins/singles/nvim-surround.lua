-- # surround, conflicts with mini.surround
-- also conflicts with flash.nvim (ds is jump)
-- example: replace with own keybinds
--     Old text                    Command         New text
--------------------------------------------------------------------------------
-- surr*ound_words             ysiw)           (surround_words)
-- *make strings               ys$"            "make strings"
-- [delete ar*ound me!]        ds]             delete around me!
-- remove <b>HTML t*ags</b>    dst             remove HTML tags
-- 'change quot*es'            cs'"            "change quotes"
-- <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
-- delete(functi*on calls)     dsf             function calls
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
                visual = 'cvj',
                visual_line = 'cvl',
                delete = 'cvd',
                change = 'cvrs',
                change_line = 'cvrS',
            },
        })
    end,
}
