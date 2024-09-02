-- ## lsp log, turn on for debugging, writes to ~/.local/state/nvim/lsp.log
local M = {}

M.setup = function()
    -- define symbols for lsp
    -- vim.fn.sign_define('LspDiagnosticsSignError', {
    --     texthl = 'LspDiagnosticsSignError',
    --     text = '',
    --     numhl = 'LspDiagnosticsSignError',
    -- })
    -- vim.fn.sign_define('LspDiagnosticsSignWarning', {
    --     texthl = 'LspDiagnosticsSignWarning',
    --     text = '⚠',
    --     numhl = 'LspDiagnosticsSignWarning',
    -- })
    -- vim.fn.sign_define('LspDiagnosticsSignHint', {
    --     texthl = 'LspDiagnosticsSignHint',

    --     text = '', -- TODO: fix icon

    --     numhl = 'LspDiagnosticsSignHint',
    -- })
    -- vim.fn.sign_define('LspDiagnosticsSignInformation', {
    --     texthl = 'LspDiagnosticsSignInformation',
    --     text = '',
    --     numhl = 'LspDiagnosticsSignInformation',
    -- })

    vim.filetype.add({
        pattern = {
            ['.*%.component%.html'] = 'angular.html', -- Sets the filetype to `angular.html` if it matches the pattern
        },
        extension = {
            templ = 'templ', -- golang atempl
            zsh = 'sh',
            http = 'http',
        },
        filename = {
            ['.zshrc'] = 'sh',
            ['.zshenv'] = 'sh',
        },
    })

    vim.api.nvim_create_autocmd('FileType', {
        pattern = 'angular.html',
        callback = function()
            vim.treesitter.language.register('angular', 'angular.html') -- Register the filetype with treesitter for the `angular` language/parser
        end,
    })

    vim.g.markdown_fenced_languages = {
        'ts=typescript',
    }
end

return M
