local M = {}
M.setup = function()
    return {
        filetypes = {
            'css',
            'scss',
            'less',
            'html',
            'astro',
            'svelte',
            'angular.html',
            'javascriptreact',
            'rescript',
            'typescriptreact',
            'vue',
        },
    }
end

return M
