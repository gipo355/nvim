-- NOTE: must run :Codeium Auth
-- trying putting it in cmp file
-- may conflict with copilot
return {
    -- disabled codeium, grep it in the file to activate
    'Exafunction/codeium.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'hrsh7th/nvim-cmp',
    },
    event = 'BufEnter',
    -- setup in cmp file, after cmp setup
    -- config = function()
    --     require('codeium').setup({
    --         enable_chat = true,
    --     })
    -- end,
}
