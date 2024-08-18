local M = {}

-- ##### FORMATTING filter from lvim 💕#####

---filter passed to vim.lsp.buf.format
---always selects null-ls if it's available and caches the value per buffer
---@param client table client attached to a buffer
---@return boolean if client matches
M.format_filter = function(client)
    -- early returns for specific filetypes
    -- can entirely disable filetype formatting
    -- skip lsp formatters if included in the table
    if _G.user.lsp.skipped_lsp_formatters[client.name] then
        return false
    end

    local n = require('null-ls')
    local s = require('null-ls.sources')
    local method = n.methods.FORMATTING

    local filetype = vim.bo.filetype
    local available_formatters = s.get_available(filetype, method)

    if #available_formatters > 0 then
        return client.name == 'null-ls'
    elseif client.supports_method('textDocument/formatting') then
        return true
    else
        return false
    end
end

---Simple wrapper for vim.lsp.buf.format() to provide defaults
---@param opts table|nil
M.format = function(opts)
    opts = opts or {}
    opts.filter = opts.filter or M.format_filter

    return vim.lsp.buf.format(opts)
end

return M
