local M = {}

local null_ls = require('null-ls')
local services = require('user.plugins.lsp.formatters.utils.services')
local method = null_ls.methods.DIAGNOSTICS

local alternative_methods = {
    null_ls.methods.DIAGNOSTICS,
    null_ls.methods.DIAGNOSTICS_ON_OPEN,
    null_ls.methods.DIAGNOSTICS_ON_SAVE,
}

function M.list_registered(filetype)
    local registered_providers =
        services.list_registered_providers_names(filetype)
    -- local providers_for_methods = vim.tbl_flatten(vim.tbl_map(function(m)
    --     return registered_providers[m] or {}
    -- end, alternative_methods))
    -- tbl_flatten is deprecated, use iter instead, run :checkhealth vim.tbl_flatten
    local providers_for_methods = {}
    for _, m in ipairs(alternative_methods) do
        vim.list_extend(providers_for_methods, registered_providers[m] or {})
    end

    return providers_for_methods
end

function M.list_supported(filetype)
    local s = require('null-ls.sources')
    local supported_linters = s.get_supported(filetype, 'diagnostics')
    table.sort(supported_linters)
    return supported_linters
end

return M
