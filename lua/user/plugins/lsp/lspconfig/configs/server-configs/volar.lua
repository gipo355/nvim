local M = {}
M.setup = function()
    return {
        filetypes = {
            'typescript',
            'javascript',
            'javascriptreact',
            'typescriptreact',
            'vue',
            'json',
        },
        root_dir = require('lspconfig').util.root_pattern('vue.config.js'),
        init_options = {
            typescript = {
                tsdk = vim.env.HOME
                    .. '/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib',
            },
        },
    }
end
return M
