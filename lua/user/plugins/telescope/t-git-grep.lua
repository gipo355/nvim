return {
    'gipo355/telescope-git-grep.nvim',
    branch = 'main',
    event = 'VeryLazy',
    config = function()
        pcall(require('telescope').load_extension('git_grep'))
    end,
}
