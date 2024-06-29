local M = {}
M.setup = function()
    local ok, env = pcall(require, 'user.env')
    if not ok then
        -- vim.print('Error loading user.env, snyk_ls will not work properly.')
        -- print error message to user
        print('Error loading user.env, snyk_ls will not work properly.')
        -- throw an error to stop the execution of the function
        -- error('Error loading user.env, snyk_ls will not work properly.')
        -- throw a warning instead
        -- vim.api.nvim_err_writeln(
        --     'Error loading user.env, snyk_ls will not work properly.'
        -- )
        return
    end
    return {
        init_options = {
            -- token = '',
            token = env.SNYK_TOKEN,
            activateSnykOpenSource = 'true',
            activateSnykIac = 'true',
            enableTrustedFoldersFeature = 'false',
            integrationName = 'NEOVIM',
            -- additionalParams = '--all-projects', -- Any extra params for the Snyk CLI, separated by spaces
            scanningMode = 'auto',
            organization = 'gipo355',
            authenticationMethod = 'token',
            activateSnykCodeSecurity = 'true',
            activateSnykCodeQuality = 'true',
            enableTelemetry = 'false',
            -- "snykCodeApi": "https://deeproxy.snyk.io",
            filterSeverity = {
                --   // Filters to be applied for the determined issues
                critical = true,
                high = true,
                medium = true,
                low = true,
            },
        },
    }
end

return M
