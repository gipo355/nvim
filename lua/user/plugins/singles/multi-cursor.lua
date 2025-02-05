local set_desc = require('user.utils.functions').set_keymap_desc

return {

    -- multicursor
    -- this sets m-\ a-\ keybind \\\\\\
    -- {
    --     'mg979/vim-visual-multi',
    --     enabled = _G.user.additional_plugins.multi_cursor,
    --     event = 'BufReadPre',
    -- },

    {
        'jake-stewart/multicursor.nvim',
        event = 'BufReadPre',
        branch = '1.0',
        config = function()
            local mc = require('multicursor-nvim')

            mc.setup()

            local set = vim.keymap.set

            -- Add or skip cursor above/below the main cursor.
            set({ 'n', 'v' }, '<up>', function()
                mc.lineAddCursor(-1)
            end, set_desc('Add cursor above'))
            set({ 'n', 'v' }, '<down>', function()
                mc.lineAddCursor(1)
            end, set_desc('Add cursor below'))
            set({ 'n', 'v' }, '<leader><up>', function()
                mc.lineSkipCursor(-1)
            end, set_desc('Skip cursor above'))
            set({ 'n', 'v' }, '<leader><down>', function()
                mc.lineSkipCursor(1)
            end, set_desc('Skip cursor below'))

            -- Add or skip adding a new cursor by matching word/selection
            set({ 'n', 'v' }, '<leader>on', function()
                mc.matchAddCursor(1)
            end, set_desc('Add cursor by matching word'))
            set({ 'n', 'v' }, '<leader>os', function()
                mc.matchSkipCursor(1)
            end, set_desc('Skip cursor by matching word'))
            set({ 'n', 'v' }, '<leader>oN', function()
                mc.matchAddCursor(-1)
            end, set_desc('Add cursor by matching word backwards'))
            set({ 'n', 'v' }, '<leader>oS', function()
                mc.matchSkipCursor(-1)
            end, set_desc('Skip cursor by matching word backwards'))

            -- Add all matches in the document
            set(
                { 'n', 'v' },
                '<leader>oA',
                mc.matchAllAddCursors,
                set_desc('Add all cursors by matching word')
            )

            -- You can also add cursors with any motion you prefer:
            -- set("n", "<right>", function()
            --     mc.addCursor("w")
            -- end)
            -- set("n", "<leader><right>", function()
            --     mc.skipCursor("w")
            -- end)

            -- Rotate the main cursor.
            set({ 'n', 'v' }, '<left>', mc.nextCursor, set_desc('Next cursor'))
            set({ 'n', 'v' }, '<right>', mc.prevCursor, set_desc('Prev cursor'))

            -- Delete the main cursor.
            set(
                { 'n', 'v' },
                '<leader>ox',
                mc.deleteCursor,
                set_desc('Delete main cursor')
            )

            -- Add and remove cursors with control + left click.
            set(
                'n',
                '<c-leftmouse>',
                mc.handleMouse,
                set_desc('Add cursor with mouse')
            )

            -- Easy way to add and remove cursors using the main cursor.
            set(
                { 'n', 'v' },
                '<c-q>',
                mc.toggleCursor,
                set_desc('Toggle cursor')
            )

            -- Clone every cursor and disable the originals.
            set(
                { 'n', 'v' },
                '<leader><c-q>',
                mc.duplicateCursors,
                set_desc('Duplicate cursors')
            )

            set('n', '<esc>', function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                elseif mc.hasCursors() then
                    mc.clearCursors()
                    vim.cmd([[ nohlsearch ]])
                else
                    -- Default <esc> handler.
                end
            end, set_desc('Clear cursors'))

            -- bring back cursors if you accidentally clear them
            set(
                'n',
                '<leader>ov',
                mc.restoreCursors,
                set_desc('Restore cursors')
            )

            -- Align cursor columns.
            set('n', '<leader>oa', mc.alignCursors, set_desc('Align cursors'))

            -- Split visual selections by regex.
            set('v', 'oX', mc.splitCursors, set_desc('Split cursors'))

            -- Append/insert for each line of visual selections.
            set('v', 'I', mc.insertVisual, set_desc('Insert visual'))
            set('v', 'A', mc.appendVisual, set_desc('Append visual'))

            -- match new cursors within visual selections by regex.
            set('v', 'M', mc.matchCursors, set_desc('Match cursors'))

            -- Rotate visual selection contents.
            set('v', '<leader>ot', function()
                mc.transposeCursors(1)
            end, set_desc('Transpose cursors'))
            set('v', '<leader>oT', function()
                mc.transposeCursors(-1)
            end, set_desc('Transpose cursors backwards'))

            -- Jumplist support
            set({ 'v', 'n' }, '<c-i>', mc.jumpForward, set_desc('Jump forward'))
            set(
                { 'v', 'n' },
                '<c-o>',
                mc.jumpBackward,
                set_desc('Jump backward')
            )

            -- Customize how cursors look.
            local hl = vim.api.nvim_set_hl
            hl(0, 'MultiCursorCursor', { link = 'Cursor' })
            hl(0, 'MultiCursorVisual', { link = 'Visual' })
            hl(0, 'MultiCursorSign', { link = 'SignColumn' })
            hl(0, 'MultiCursorDisabledCursor', { link = 'Visual' })
            hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
            hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
        end,
    },
}
