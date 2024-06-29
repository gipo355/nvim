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
        },
        --root_dir = { ".git" }
    }
end

return M
