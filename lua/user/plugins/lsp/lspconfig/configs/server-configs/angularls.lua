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
            'ng-package.json',
            'tsconfig.angular.json'
        ),
    }
end
return M
