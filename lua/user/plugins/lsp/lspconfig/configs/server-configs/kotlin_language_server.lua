local M = {}
M.setup = function()
    return {
        root_dir = require('lspconfig').util.root_pattern(
            'build.gradle.kts',
            'build.gradle',
            'pom.xml',
            'settings.gradle.kts',
            'settings.gradle',
            '.git'
        ),
    }
end
return M
