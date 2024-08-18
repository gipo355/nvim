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
            'typescript',
            'javascript',
            'javascriptreact',
            'typescriptreact',
        },
        capabilities = capabilities,
        --root_dir = { ".git" }
    }
end

return M
