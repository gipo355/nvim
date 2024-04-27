return {
    {
        'tzachar/cmp-tabnine',
        build = './install.sh',
        dependencies = 'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        -- opt = true,
        -- config = function()
        --   local tabnine = require 'cmp_tabnine.config'
        --   tabnine:setup {
        --     max_lines = 1000,
        --     max_num_results = 10,
        --     sort = true,
        --   }
        -- end,
    },
}
