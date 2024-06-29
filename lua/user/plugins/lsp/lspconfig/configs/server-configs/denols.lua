local M = {}
M.setup = function()
    return {
        single_file_support = false,
        root_dir = require('lspconfig').util.root_pattern(
            'deno.json',
            'import_map.json'
        ),
    }
end
return M
