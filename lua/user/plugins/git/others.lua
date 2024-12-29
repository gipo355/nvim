local set_desc = require('user.utils.functions').set_keymap_desc

-- TODO: possible add those

-- f-person/git-blame.nvim: git blame, and the GitBlameOpenCommitURL command is really handy since it will open the commit in your hosted Git origin/service like GitLab/GitHub, you could then view the diff or you could send the link to your colleague during code reviews or discussion
-- (gitsigns has it)

-- airblade/vim-gitgutter

-- fugitive

-- TODO: fugitive keymaps, check lvim config
--
-- lvim.builtin.which_key.mappings["E"] = {
--     name = "Vim Fugitive and gitgutter",
--     a = { "<cmd>Git add %:p<cr>", "git add current file" },
--     A = { "<cmd>Git add .<cr>", "git add all" },
--     ss = { "<cmd>G status<cr>", "git status" },
--     d = { "<cmd>Gdiff<cr>", "diffView" },
--     B = { "<cmd>G blame<cr>", "git blame" },
--     c = { "<cmd>G commit -v -q<cr>", "git commit" },
--     t = { "<cmd>G commit -v -q %:p<cr>", "git commit current file" },
--     e = { "<cmd>Gedit<cr>", "git edit" },
--     l = { "<cmd>silent! G log<CR>", "git log" },
--     rr = { "<cmd>G read<cr>", "git read" },
--     gl = { "<cmd>Silent Git stash<CR>:e<CR>", "git stash -" },
--     gp = { "<cmd>Silent Git stash pop<CR>:e<CR>", "git stash pop +" },
--     w = { "<cmd>Gwrite<cr><cr>", "git write" },
--     m = { "<cmd>Gmove<cr>", "git move" },
--     pp = { "<cmd>Ggrep<space>", "git grep" },
--     M = { "<cmd>G mergetool<cr>", "git mergetool" },
--     b = { "<cmd>Git branch<space>", "git branch" },
--     o = { "<cmd>Git checkout -b<space>", "git checkout" },
--     ps = { "<cmd>Dispatch! git push<cr>", "git push" },
--     pl = { "<cmd>Dispatch! git pull<cr>", "git push" },
--     rb = { "<cmd>Dispatch! git rebase -i HEAD~<space>", "git rebase int" },
--     f = { "<cmd>Dispatch! git fetch origin<cr>", "git fetch" },
--     -- git gutter
--     sl = {
--         "<cmd>GitGutterLineHighlightsToggle<cr>",
--         "gitgutter line highlight toggle",
--     },
--     sn = {
--         "<cmd>GitGutterLineNrHighlightsToggle<cr>",
--         "gitgutter lineNr highlight toggle",
--     },
--     sS = { "<cmd>GitGutterSignsToggle<cr>", "gitgutter signs toggle" },
-- }

-- TODO: improve gist and octo mappings

return {
    {
        'rhysd/conflict-marker.vim',
        event = 'VeryLazy',
    },

    {
        'rbong/vim-flog',
        enabled = _G.user.additional_plugins.flog,
        event = 'VeryLazy',
        cmd = {
            'Flog',
            -- 'Flogsplit',
            -- 'Floggit'
        },
        dependencies = {
            'tpope/vim-fugitive',
        },
        config = function()
            vim.keymap.set('n', '<leader>gf', '<cmd>Flog<cr>', set_desc('Flog'))
        end,
    },

    {
        'junegunn/gv.vim',
        enabled = _G.user.additional_plugins.gv,
        event = 'VeryLazy',
        -- 'tpope/vim-fugitive',
        dependencies = { 'tpope/vim-fugitive' },
        -- depencencies = { { 'junegunn/gv.vim' } },
        config = function()
            vim.keymap.set(
                { 'n', 'v' },
                '<leader>gcO',
                '<cmd>GV<cr>',
                set_desc('Browse git commits')
            )
            vim.keymap.set(
                'n',
                '<leader>gcF',
                '<cmd>GV!<cr>',
                set_desc('Browse commits current file')
            )
        end,
    },

    {
        'ruifm/gitlinker.nvim',
        event = 'VeryLazy',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('gitlinker').setup({
                mappings = nil,
            })
            vim.keymap.set(
                { 'v' },
                '<leader>gLL',
                -- TODO: improve visual selection
                '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
                set_desc('Open git link in browser')
            )
            vim.keymap.set(
                { 'n' },
                '<leader>gLL',
                -- TODO: improve visual selection
                '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
                set_desc('Open git link in browser')
            )

            vim.keymap.set(
                { 'v' },
                '<leader>gLl',
                -- TODO: improve visual selection
                '<cmd>lua require"gitlinker".get_buf_range_url("v")<cr>',
                set_desc('Get git link url')
            )
            vim.keymap.set(
                { 'n' },
                '<leader>gLl',
                -- TODO: improve visual selection
                '<cmd>lua require"gitlinker".get_buf_range_url("n")<cr>',
                set_desc('Get git link url')
            )

            vim.keymap.set(
                { 'n' },
                '<leader>gLu',
                -- TODO: improve visual selection
                '<cmd>lua require"gitlinker".get_repo_url()<cr>',
                set_desc('Get git repo url')
            )
            vim.keymap.set(
                { 'n' },
                '<leader>gLo',
                -- TODO: improve visual selection
                '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>',
                set_desc('Open git repo in browser')
            )
        end,
    },

    -- # create gists
    -- only gh cli <leader O g>
    {
        'rawnly/gist.nvim',
        event = 'VeryLazy',
        config = function()
            vim.keymap.set(
                { 'n', 'v' },
                '<leader>gGc',
                '<cmd>GistCreate<cr>',
                set_desc('Create Gist')
            )
            vim.keymap.set(
                'n',
                '<leader>gGf',
                '<cmd>GistCreateFromFile<cr>',
                set_desc('Create Gist from file')
            )
        end,
    },

    {
        'aaronhallaert/advanced-git-search.nvim',
        event = 'VeryLazy',
        config = function()
            pcall(require('telescope').load_extension('advanced_git_search'))
            vim.keymap.set(
                'v',
                '<leader>gsl',
                "<cmd>lua require('telescope').extensions.advanced_git_search.diff_commit_line()<cr>",
                set_desc('Advanced Git Search Lines')
            )

            vim.keymap.set(
                'n',
                '<leader>gsb',
                "<cmd>lua require('telescope').extensions.advanced_git_search.diff_branch_file()<cr>",
                set_desc('Advanced Git Search branch')
            )

            vim.keymap.set(
                'n',
                '<leader>gsf',
                "<cmd>lua require('telescope').extensions.advanced_git_search.diff_commit_file()<cr>",
                set_desc('Advanced Git Search file')
            )

            vim.keymap.set(
                'n',
                '<leader>gsk',
                "<cmd>lua require('telescope').extensions.advanced_git_search.search_log_content()<cr>",
                set_desc('Advanced Git Search log')
            )

            vim.keymap.set(
                'n',
                '<leader>gsK',
                "<cmd>lua require('telescope').extensions.advanced_git_search.search_log_content_file()<cr>",
                set_desc('Advanced Git Search log file')
            )

            vim.keymap.set(
                'n',
                '<leader>gsr',
                "<cmd>lua require('telescope').extensions.advanced_git_search.checkout_reflog()<cr>",
                set_desc('Advanced Git Search reflog')
            )

            vim.keymap.set(
                'n',
                '<leader>gsC',
                "<cmd>lua require('telescope').extensions.advanced_git_search.show_custom_functions()<cr>",
                set_desc('Advanced Git Search custom functions')
            )

            vim.keymap.set(
                'n',
                '<leader>gss',
                '<cmd>Git<cr><cmd>Twiggy<cr>',
                set_desc('Git status and Twiggy')
            )

            vim.keymap.set(
                'n',
                '<leader>gsr',
                '<cmd>Git<cr>',
                set_desc('Git status')
            )
            vim.api.nvim_create_user_command(
                'DiffCommitLine',
                "lua require('telescope').extensions.advanced_git_search.diff_commit_line()",
                { range = true }
            )
        end,
        dependencies = {
            'nvim-telescope/telescope.nvim',
            -- to show diff splits and open commits in browser
            'tpope/vim-fugitive',
            'sodapopcan/vim-twiggy',
        },
    },
}
