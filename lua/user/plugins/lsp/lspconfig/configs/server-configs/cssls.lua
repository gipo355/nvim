local M = {}
M.setup = function(capabilities)
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
        capabilities = capabilities,
        --root_dir = { ".git" }
    }
end

return M
