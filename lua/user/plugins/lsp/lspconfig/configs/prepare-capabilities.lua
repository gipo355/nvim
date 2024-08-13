local M = {}

M.prepare_capabilities = function()
    local lspconfig = require('lspconfig')
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local file_operations_ok, file_operations =
        pcall(require, 'lsp-file-operations')

    local ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')

    if ok then
        capabilities = vim.tbl_deep_extend(
            'force',
            capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )
    end
    if file_operations_ok then
        -- Set global defaults for all servers
        -- lspconfig.util.default_config =
        --     vim.tbl_extend('force', lspconfig.util.default_config, {
        --         capabilities = vim.tbl_deep_extend(
        --             'force',
        --             vim.lsp.protocol.make_client_capabilities(),
        --             -- returns configured operations if setup() was already called
        --             -- or default operations if not
        --             require('lsp-file-operations').default_capabilities()
        --         ),
        --     })
        capabilities = vim.tbl_deep_extend(
            'force',
            capabilities,
            -- returns configured operations if setup() was already called
            -- or default operations if not
            file_operations.default_capabilities()
        )
    end
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    -- for UFO
    capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
    }

    -- TODO: check if this is needed
    -- what is this? says it imrpoves performance
    -- https://www.reddit.com/r/neovim/comments/161tv8l/lsp_has_gotten_very_slow/
    -- https://www.reddit.com/r/neovim/comments/1b4bk5h/psa_new_fswatch_watchfunc_backend_available_on/
    -- this is an alternative to fswatch. no need to add this if you have fswatch
    -- improves performance
    -- workspace/didChangeWatchedFiles LSP client capability is now enabled by default
    -- BUG: breaks tailwindcss lsp if set to true (or commented which means use fswatch)
    -- watch for file changes (default: true)

    -- NOTE: looks like it's fixed
    -- if _G.user.tailwindcss.enable_lsp then
    --     capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false
    -- end

    return capabilities
end

return M
