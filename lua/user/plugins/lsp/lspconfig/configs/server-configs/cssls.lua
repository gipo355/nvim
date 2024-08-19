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
            -- 'typescript', -- required for styled components
            -- 'javascript', -- required for styled components
            -- 'javascriptreact', -- required for styled components
            -- 'typescriptreact', -- required for styled components
        },
        capabilities = capabilities,
        --root_dir = { ".git" }
    }
end

return M
