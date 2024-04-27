--
--[[
 💓 thank you kicksart, lunarvim, lazyvim! 💓
]]

-- improve startup time, experimental
vim.loader.enable()

-- TODO: improve startup, check :StartupTime and :autocmd, nvim --startuptime
-- possible culprits: overseer, wakatime, dap, session-manager, alpha, vm-start, indent-blankline, crates
-- reduce plugins, use VeryLazy for plugins that are not used often

-- [[ Initialize global variables before everything else ]]
require('user.globals')

-- [[ Settings ]]
require('user.options')

-- [[ Basic Keymaps ]]
require('user.keymaps')

-- [[ Install `lazy.nvim` plugin manager ]]
require('user.lazy-bootstrap')

--[[ if using VSCODE Neovim extension,
load only what you want
 (the vscode extension sets the global var vim.g.vscode) ]]
--
if vim.g.vscode then
    -- [[ VSCODE Neovim extension ]] load only what you want
    require('user.vscode')
else
    -- [[ Configure and install plugins ]]
    -- TODO: this takes 88% of startup time
    require('user.lazy-plugins')

    -- [[ autocommands ]]
    require('user.auto-commands')

    --[[ theme settings 
    outside of vscode, after plugins 
    set them on the individual theme setup inside _G global obj
    so as to have intellisense of whats available ]]

    -- don't change here, change _G in globals.lua under
    -- _G.user.background = 'dark' or 'light'
    vim.opt.background = _G.user.background

    -- change in globals.lua under _G.user.theme = _G.user.themes.<theme>
    -- Set here: G.user.themes.<theme>
    vim.cmd.colorscheme(_G.user.theme())

    -- set diagnostic config here, for some reason it gets
    -- overwritten by the theme setup
    vim.diagnostic.config(_G.user.diagnostics_config)
end

if vim.g.neovide then
    require('user.neovide')
end
