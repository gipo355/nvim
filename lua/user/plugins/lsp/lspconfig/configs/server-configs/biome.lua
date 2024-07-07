local M = {}
M.setup = function(capabilities)
    return {
        capabilities = capabilities,
        root_dir = require('lspconfig').util.root_pattern({
            'package.json',
            'tsconfig.json',
            'biome.json',
            '.git',
        }),
        single_file_support = true,
        filetypes = {
            'javascript',
            'javascriptreact',
            'javascript.jsx',
            'typescript',
            'typescriptreact',
            'typescript.tsx',
            'vue',
            'svelte',
            'html',
            'astro',
            'json',
            'jsonc',
            'json5',
            'angular.html',
        },
    }
end
return M
