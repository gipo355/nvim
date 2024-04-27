local M = {}

local null_ls = require('null-ls')
local services = require('user.plugins.lsp.formatters.utils.services')
local method = null_ls.methods.FORMATTING

function M.list_registered(filetype)
    local registered_providers =
        services.list_registered_providers_names(filetype)
    return registered_providers[method] or {}
end

function M.list_supported(filetype)
    local s = require('null-ls.sources')
    local supported_formatters = s.get_supported(filetype, 'formatting')
    table.sort(supported_formatters)
    return supported_formatters
end

return M
