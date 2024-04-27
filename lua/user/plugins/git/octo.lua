local set_desc = require('user.utils.functions').set_keymap_desc
return {

    'pwntester/octo.nvim', -- :octo
    -- event = "BufRead",

    event = 'VeryLazy',

    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        -- 'kyazdani42/nvim-web-devicons',
    },

    config = function()
        local ok, octo = pcall(require, 'octo')

        if not ok then
            return
        end

        octo.setup({
            use_local_fs = true,
            default_to_projects_v2 = true, -- use projects v2 for the `Octo card ...` command by default. Both legacy and v2 commands are available under `Octo cardlegacy ...` and `Octo cardv2 ...` respectively.
            enable_builtin = true,
            picker_config = {
                use_emojis = true,
            },
            mappings = {
                issue = {
                    close_issue = { lhs = '<space>Oic', desc = 'close issue' },
                    reopen_issue = { lhs = '<space>Oio', desc = 'reopen issue' },
                    list_issues = {
                        lhs = '<space>Oil',
                        desc = 'list open issues on same repo',
                    },
                    reload = { lhs = '<C-r>', desc = 'reload issue' },
                    open_in_browser = {
                        lhs = '<C-b>',
                        desc = 'open issue in browser',
                    },
                    copy_url = {
                        lhs = '<C-y>',
                        desc = 'copy url to system clipboard',
                    },
                    add_assignee = { lhs = '<space>Oaa', desc = 'add assignee' },
                    remove_assignee = {
                        lhs = '<space>Oad',
                        desc = 'remove assignee',
                    },
                    create_label = { lhs = '<space>Olc', desc = 'create label' },
                    add_label = { lhs = '<space>Ola', desc = 'add label' },
                    remove_label = { lhs = '<space>Old', desc = 'remove label' },
                    goto_issue = {
                        lhs = '<space>Ogi',
                        desc = 'navigate to a local repo issue',
                    },
                    add_comment = { lhs = '<space>Oca', desc = 'add comment' },
                    delete_comment = {
                        lhs = '<space>Ocd',
                        desc = 'delete comment',
                    },
                    next_comment = { lhs = ']c', desc = 'go to next comment' },
                    prev_comment = {
                        lhs = '[c',
                        desc = 'go to previous comment',
                    },
                    react_hooray = {
                        lhs = '<space>Orp',
                        desc = 'add/remove 🎉 reaction',
                    },
                    react_heart = {
                        lhs = '<space>Orh',
                        desc = 'add/remove ❤️ reaction',
                    },
                    react_eyes = {
                        lhs = '<space>Ore',
                        desc = 'add/remove 👀 reaction',
                    },
                    react_thumbs_up = {
                        lhs = '<space>Or+',
                        desc = 'add/remove 👍 reaction',
                    },
                    react_thumbs_down = {
                        lhs = '<space>Or-',
                        desc = 'add/remove 👎 reaction',
                    },
                    react_rocket = {
                        lhs = '<space>Orr',
                        desc = 'add/remove 🚀 reaction',
                    },
                    react_laugh = {
                        lhs = '<space>Orl',
                        desc = 'add/remove 😄 reaction',
                    },
                    react_confused = {
                        lhs = '<space>Orc',
                        desc = 'add/remove 😕 reaction',
                    },
                },
                pull_request = {
                    checkout_pr = { lhs = '<space>Opo', desc = 'checkout PR' },
                    merge_pr = { lhs = '<space>Opm', desc = 'merge commit PR' },
                    squash_and_merge_pr = {
                        lhs = '<space>Opsm',
                        desc = 'squash and merge PR',
                    },
                    list_commits = {
                        lhs = '<space>Opc',
                        desc = 'list PR commits',
                    },
                    list_changed_files = {
                        lhs = '<space>Opf',
                        desc = 'list PR changed files',
                    },
                    show_pr_diff = { lhs = '<space>Opd', desc = 'show PR diff' },
                    add_reviewer = { lhs = '<space>Ova', desc = 'add reviewer' },
                    remove_reviewer = {
                        lhs = '<space>Ovd',
                        desc = 'remove reviewer request',
                    },
                    close_issue = { lhs = '<space>Oic', desc = 'close PR' },
                    reopen_issue = { lhs = '<space>Oio', desc = 'reopen PR' },
                    list_issues = {
                        lhs = '<space>Oil',
                        desc = 'list open issues on same repo',
                    },
                    reload = { lhs = '<C-r>', desc = 'reload PR' },
                    open_in_browser = {
                        lhs = '<C-b>',
                        desc = 'open PR in browser',
                    },
                    copy_url = {
                        lhs = '<C-y>',
                        desc = 'copy url to system clipboard',
                    },
                    goto_file = { lhs = 'gf', desc = 'go to file' },
                    add_assignee = { lhs = '<space>Oaa', desc = 'add assignee' },
                    remove_assignee = {
                        lhs = '<space>Oad',
                        desc = 'remove assignee',
                    },
                    create_label = { lhs = '<space>Olc', desc = 'create label' },
                    add_label = { lhs = '<space>Ola', desc = 'add label' },
                    remove_label = { lhs = '<space>Old', desc = 'remove label' },
                    goto_issue = {
                        lhs = '<space>Ogi',
                        desc = 'navigate to a local repo issue',
                    },
                    add_comment = { lhs = '<space>Oca', desc = 'add comment' },
                    delete_comment = {
                        lhs = '<space>Ocd',
                        desc = 'delete comment',
                    },
                    next_comment = { lhs = ']c', desc = 'go to next comment' },
                    prev_comment = {
                        lhs = '[c',
                        desc = 'go to previous comment',
                    },
                    react_hooray = {
                        lhs = '<space>Orp',
                        desc = 'add/remove 🎉 reaction',
                    },
                    react_heart = {
                        lhs = '<space>Orh',
                        desc = 'add/remove ❤️ reaction',
                    },
                    react_eyes = {
                        lhs = '<space>Ore',
                        desc = 'add/remove 👀 reaction',
                    },
                    react_thumbs_up = {
                        lhs = '<space>Or+',
                        desc = 'add/remove 👍 reaction',
                    },
                    react_thumbs_down = {
                        lhs = '<space>Or-',
                        desc = 'add/remove 👎 reaction',
                    },
                    react_rocket = {
                        lhs = '<space>Orr',
                        desc = 'add/remove 🚀 reaction',
                    },
                    react_laugh = {
                        lhs = '<space>Orl',
                        desc = 'add/remove 😄 reaction',
                    },
                    react_confused = {
                        lhs = '<space>Orc',
                        desc = 'add/remove 😕 reaction',
                    },
                },
                review_thread = {
                    goto_issue = {
                        lhs = '<space>Ogi',
                        desc = 'navigate to a local repo issue',
                    },
                    add_comment = { lhs = '<space>Oca', desc = 'add comment' },
                    add_suggestion = {
                        lhs = '<space>Osa',
                        desc = 'add suggestion',
                    },
                    delete_comment = {
                        lhs = '<space>Ocd',
                        desc = 'delete comment',
                    },
                    next_comment = { lhs = ']c', desc = 'go to next comment' },
                    prev_comment = {
                        lhs = '[c',
                        desc = 'go to previous comment',
                    },
                    select_next_entry = {
                        lhs = ']q',
                        desc = 'move to previous changed file',
                    },
                    select_prev_entry = {
                        lhs = '[q',
                        desc = 'move to next changed file',
                    },
                    close_review_tab = {
                        lhs = '<C-c>',
                        desc = 'close review tab',
                    },
                    react_hooray = {
                        lhs = '<space>Orp',
                        desc = 'add/remove 🎉 reaction',
                    },
                    react_heart = {
                        lhs = '<space>Orh',
                        desc = 'add/remove ❤️ reaction',
                    },
                    react_eyes = {
                        lhs = '<space>Ore',
                        desc = 'add/remove 👀 reaction',
                    },
                    react_thumbs_up = {
                        lhs = '<space>Or+',
                        desc = 'add/remove 👍 reaction',
                    },
                    react_thumbs_down = {
                        lhs = '<space>Or-',
                        desc = 'add/remove 👎 reaction',
                    },
                    react_rocket = {
                        lhs = '<space>Orr',
                        desc = 'add/remove 🚀 reaction',
                    },
                    react_laugh = {
                        lhs = '<space>Orl',
                        desc = 'add/remove 😄 reaction',
                    },
                    react_confused = {
                        lhs = '<space>Orc',
                        desc = 'add/remove 😕 reaction',
                    },
                },
                submit_win = {
                    approve_review = { lhs = '<C-a>', desc = 'approve review' },
                    comment_review = { lhs = '<C-m>', desc = 'comment review' },
                    request_changes = {
                        lhs = '<C-r>',
                        desc = 'request changes review',
                    },
                    close_review_tab = {
                        lhs = '<C-c>',
                        desc = 'close review tab',
                    },
                },
                review_diff = {
                    add_review_comment = {
                        lhs = '<space>Oca',
                        desc = 'add a new review comment',
                    },
                    add_review_suggestion = {
                        lhs = '<space>Osa',
                        desc = 'add a new review suggestion',
                    },
                    focus_files = {
                        lhs = '<leader>e',
                        desc = 'move focus to changed file panel',
                    },
                    toggle_files = {
                        lhs = '<leader>b',
                        desc = 'hide/show changed files panel',
                    },
                    next_thread = { lhs = ']t', desc = 'move to next thread' },
                    prev_thread = {
                        lhs = '[t',
                        desc = 'move to previous thread',
                    },
                    select_next_entry = {
                        lhs = ']q',
                        desc = 'move to previous changed file',
                    },
                    select_prev_entry = {
                        lhs = '[q',
                        desc = 'move to next changed file',
                    },
                    close_review_tab = {
                        lhs = '<C-c>',
                        desc = 'close review tab',
                    },
                    toggle_viewed = {
                        lhs = '<leader><space>O',
                        desc = 'toggle viewer viewed state',
                    },
                },
                file_panel = {
                    next_entry = {
                        lhs = 'j',
                        desc = 'move to next changed file',
                    },
                    prev_entry = {
                        lhs = 'k',
                        desc = 'move to previous changed file',
                    },
                    select_entry = {
                        lhs = '<cr>',
                        desc = 'show selected changed file diffs',
                    },
                    refresh_files = {
                        lhs = 'R',
                        desc = 'refresh changed files panel',
                    },
                    focus_files = {
                        lhs = '<leader>e',
                        desc = 'move focus to changed file panel',
                    },
                    toggle_files = {
                        lhs = '<leader>b',
                        desc = 'hide/show changed files panel',
                    },
                    select_next_entry = {
                        lhs = ']q',
                        desc = 'move to previous changed file',
                    },
                    select_prev_entry = {
                        lhs = '[q',
                        desc = 'move to next changed file',
                    },
                    close_review_tab = {
                        lhs = '<C-c>',
                        desc = 'close review tab',
                    },
                    toggle_viewed = {
                        lhs = '<leader><space>O',
                        desc = 'toggle viewer viewed state',
                    },
                },
            },
        })

        vim.keymap.set(
            'n',
            '<leader>Ol',
            '<cmd>Octo issue list<cr>',
            set_desc('list issues')
        )
        vim.keymap.set(
            'n',
            '<leader>Oc',
            '<cmd>Octo issue create<cr>',
            set_desc('create issue')
        )
        vim.keymap.set(
            'n',
            '<leader>Op',
            '<cmd>Octo pr list<cr>',
            set_desc('list prs')
        )
        vim.keymap.set(
            'n',
            '<leader>OP',
            '<cmd>Octo pr create<cr>',
            set_desc('create pr')
        )
    end,
}
