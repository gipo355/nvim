local M = {}
M.setup = function()
    return {
        filetypes = {
            'typescript',
            'javascript',
            'html',
            'astro',
            'angular.html',
        },
        root_dir = require('lspconfig').util.root_pattern(
            'angular.json',
            'tsconfig.angular.json',
            '.git'
        ),
    }
end
return M
