local M = {}
M.setup = function()
    return {
        filetypes = { 'php' },
        root_dir = require('lspconfig').util.root_pattern(
            'composer.json',
            '.git'
        ),
    }
end
return M
