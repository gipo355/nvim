-- using toggleterm for now, don't need this
return {

    'kdheepak/lazygit.nvim',
    opts = {},
    cmd = {
        'LazyGit',
        'LazyGitConfig',
        'LazyGitCurrentFile',
        'LazyGitFilter',
        'LazyGitFilterCurrentFile',
    },

    -- optional for floating window border decoration
    dependencies = {
        'nvim-lua/plenary.nvim',
        'akinsho/toggleterm.nvim',
    },

    init = function()
        vim.keymap.set('n', '<C-g>', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })
    end,
}
