local M = {}

M.setup = function(cmp)
    local settings =
        require('user.plugins.cmp.cmp-config.cmp-setup.settings').setup(cmp)

    local formatting =
        require('user.plugins.cmp.cmp-config.cmp-setup.formatting').setup()

    local mappings =
        require('user.plugins.cmp.cmp-config.cmp-setup.mappings').setup(cmp)

    return vim.tbl_extend('force', settings, formatting, mappings)
end

return M
