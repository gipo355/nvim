-- conditionally load all dap setups
if _G.user.dap.enable == false then
    return {}
end

-- load configs
local go_dap = require('user.plugins.dap.setup.go')
local main_dap = require('user.plugins.dap.setup.dap')
local neovim_dap = require('user.plugins.dap.setup.neovim')
local others_dap = require('user.plugins.dap.setup.others')
-- local ts_dap = require('user.plugins.dap.setup.javascript-typescript')
-- local ts_dap = require('user.plugins.dap.setup.javascript-typescript-new')
local ts_dap = require('user.plugins.dap.setup.js-lazyvim')

-- merge into return table
local daps = {}

daps[#daps + 1] = go_dap
daps[#daps + 1] = main_dap
daps[#daps + 1] = neovim_dap
daps[#daps + 1] = others_dap
daps[#daps + 1] = ts_dap

return daps
