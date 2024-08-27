return {
    'yetone/avante.nvim',
    event = 'BufReadPre',
    build = 'make',
    enabled = _G.user.ai.avante.enable,
    -- opts = {
    --     -- add any opts here
    --     -- provider = 'openai',
    --     provider = 'copilot',
    -- },
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'stevearc/dressing.nvim',
        'nvim-lua/plenary.nvim',
        {
            'grapp-dev/nui-components.nvim',
            dependencies = {
                'MunifTanjim/nui.nvim',
            },
        },
        --- The below is optional, make sure to setup it properly if you have lazy=true
        {
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                file_types = { 'markdown', 'Avante' },
            },
            ft = { 'markdown', 'Avante' },
        },
    },
    config = function()
        local avante = require('avante')
        avante.setup({
            -- add any opts here
            -- provider = 'openai',
            ---@type "openai" | "claude" | "azure"  | "copilot"
            provider = 'copilot',
            mappings = {
                ask = '<leader>maa',
                edit = '<leader>mae',
                refresh = '<leader>mar',
                --- @class AvanteConflictMappings
                diff = {
                    ours = 'co',
                    theirs = 'ct',
                    none = 'c0',
                    both = 'cb',
                    next = ']x',
                    prev = '[x',
                },
                jump = {
                    next = ']]',
                    prev = '[[',
                },
                submit = {
                    normal = '<CR>',
                    insert = '<C-s>',
                },
                toggle = {
                    debug = '<leader>ad',
                    hint = '<leader>ah',
                },
            },
            hints = {
                enabled = true,
            },
        })

        -- views can only be fully collapsed with the global statusline
        vim.opt.laststatus = 3
        -- Default splitting will cause your main splits to jump when opening an edgebar.
        -- To prevent this, set `splitkeep` to either `screen` or `topline`.
        vim.opt.splitkeep = 'screen'
    end,
}
