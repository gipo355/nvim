local M = {}
M.setup = function()
    return {
        filetypes = {
            'css',
            'scss',
            'less',
            -- 'html',
            -- 'angular.html',
            -- "javascript",
            -- "javascriptreact",
            -- "typescript",
            -- "typescriptreact",
            -- 'vue',
            'svelte',
            -- "astro",
        },
        --root_dir = { ".git", ".stylelyntrc*" },
        settings = {
            stylelintplus = {
                autoFixOnFormat = true,
                autoFixOnSave = true,
                validateOnType = true,
                validateOnSave = true,
            },
        },
    }
end
return M
