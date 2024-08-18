local M = {}
M.setup = function()
    return {
        filetypes = { 'go', 'gomod', 'gowork', 'templ', 'gotmpl' },
        -- init_options = {
        --     command = {
        --         'golangci-lint',
        --         'run',
        --         '--out-format',
        --         'json',
        --         --         "-c",
        --         --         "~/.golangci.yml",
        --         -- "--issues-exit-code=1",
        --         -- '--fix',
        --         '--issues-exit-code=1',
        --     },
        -- },
    }
end
return M
