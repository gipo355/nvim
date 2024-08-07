return {
    'nvim-java/nvim-java',
    enabled = _G.user.enable_java_plugin,
    event = 'BufRead *.java',
    dependencies = {
        'nvim-java/nvim-java-refactor',
        'nvim-java/lua-async-await',
        'nvim-java/nvim-java-core',
        'nvim-java/nvim-java-test',
        'nvim-java/nvim-java-dap',
        'MunifTanjim/nui.nvim',
        'neovim/nvim-lspconfig',
        'mfussenegger/nvim-dap',
        {
            'williamboman/mason.nvim',
            opts = {
                registries = {
                    'github:nvim-java/mason-registry',
                    'github:mason-org/mason-registry',
                },
            },
        },
    },
    config = function()
        -- which one first?
        require('lspconfig').jdtls.setup({})
        require('java').setup()
    end,
}
