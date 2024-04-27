--[[
Here we can pass lua code to set the environment variables

IMPORTANT: Copy this file to ./user/env.lua and fill in the values
don't use secrets in this file as it gets tracked by git

use this only when env vars are not possible
]]
--

local M = {}

-- M.WAKATIME_API_KEY = 'string'
-- M.COPILOT_AUTH = 'string'
-- M.GITHUB_AUTH = 'string'
M.SNYK_TOKEN = 'string'

return M
