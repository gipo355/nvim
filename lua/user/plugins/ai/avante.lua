return {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    build = 'make',
    enabled = _G.user.ai.avante.enable,
    opts = {
        -- add any opts here
        provider = 'openai',
    },
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
}
