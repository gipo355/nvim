return {
    'MattesGroeger/vim-bookmarks',
    enabled = _G.user.additional_plugins.bookmarks,
    event = 'VeryLazy',
    keys = {
        {
            '<leader>Bd',
            '<cmd>BookmarkClear<cr>',
            'n',
            desc = 'Clear bookmark',
        },
        {
            '<leader>BD',
            '<cmd>BookmarkClearAll<cr>',
            'n',
            desc = 'Clear all bookmark',
        },
        {
            '<leader>Ba',
            '<cmd>BookmarkToggle<cr>',
            'n',
            desc = 'Bookmark toggle',
        },
        {
            '<leader>Bt',
            '<cmd>BookmarkAnnotate<cr>',
            'n',
            desc = 'Bookmark annotate',
        },
        {
            '<leader>Bv',
            '<cmd>BookmarkShowAll<cr>',
            'n',
            desc = 'Show all bookmark',
        },
        {
            '<leader>BT',
            '<cmd>TodoTelescope<cr>',
            'n',
            desc = 'Todo Telescope',
        },
    },
    config = function()
        -- highlight BookmarkSign ctermbg=NONE ctermfg=160
        -- highlight BookmarkLine ctermbg=194 ctermfg=NONE
        -- local icons = require "user.icons"
        vim.g.bookmark_sign = ''
        vim.g.bookmark_annotation_sign = ''
        vim.g.bookmark_no_default_key_mappings = 1
        vim.g.bookmark_auto_close = 0
        vim.g.bookmark_manage_per_buffer = 0
        vim.g.bookmark_save_per_working_dir = 0
        -- vim.g.bookmark_highlight_lines = 1
        vim.g.bookmark_show_warning = 0
        vim.g.bookmark_center = 1
        vim.g.bookmark_location_list = 0
        vim.g.bookmark_disable_ctrlp = 1
        vim.g.bookmark_display_annotation = 0
        -- vim.g.bookmark_auto_save_file = '~/.config/lvim/bookmarks'
        vim.g.bookmark_auto_save = 0
    end,
}
