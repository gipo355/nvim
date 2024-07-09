local set_desc = require('user.utils.functions').set_keymap_desc

local function changeTabOrCreate(cmd)
    return function()
        -- Get the number of open tabs
        local tab_count = vim.fn.tabpagenr('$')

        -- Check if there is an open tab
        if tab_count > 1 then
            vim.cmd(cmd)
        else
            vim.cmd('tabnew')
        end
    end
end

-- ##### USING TABS, conflicting with c-i? #####
-- vim.keymap.set('n', '<C-i>', '<C-i>', set_desc('Tab conflicting')) -- should prevent c-i   from being mapped to tab, doesn't work with tmux

-- tabs keymaps
-- keymap("n", "<tab>", "<cmd>tabnext<cr>", opts)
-- vim.keymap.set('n', '<s-tab>', '<cmd>tabprev<cr>', set_desc('Previous tab'))

-- vim.keymap.set('n', '!', '<cmd>tabprev<cr>', set_desc('Previous tab'))
vim.keymap.set('n', '!', changeTabOrCreate('tabprev'), set_desc('Previous tab'))

-- vim.keymap.set('n', '<M-tab>', '<cmd>tabnext<cr>', set_desc('Next tab'))
-- vim.keymap.set('n', '<tab>', '<cmd>tabnext<cr>', set_desc('Next tab')) -- disables c-i
-- vim.keymap.set('n', '<C-tab>', '<cmd>tabnext<cr>', set_desc('Next tab'))

-- vim.keymap.set('n', '_', '<cmd>tabnext<cr>', set_desc('Next tab'))
vim.keymap.set('n', '_', changeTabOrCreate('tabnext'), set_desc('Next tab'))

vim.keymap.set('n', '<C-w><tab>', '<cmd>tabnew<cr>', set_desc('New tab'))
vim.keymap.set('n', '<C-w><S-tab>', '<cmd>tabclose<cr>', set_desc('Close tab'))
-- leader tab keymaps
vim.keymap.set('n', '<leader><tab>l', '<cmd>tablast<cr>', set_desc('Last Tab'))
vim.keymap.set(
    'n',
    '<leader><tab>f',
    '<cmd>tabfirst<cr>',
    set_desc('First Tab')
)
vim.keymap.set(
    'n',
    '<leader><tab><tab>',
    '<cmd>tabnew<cr>',
    set_desc('New Tab')
)
vim.keymap.set('n', '<leader><tab>l', '<cmd>tabnext<cr>', set_desc('Next Tab'))
vim.keymap.set(
    'n',
    '<leader><tab>d',
    '<cmd>tabclose<cr>',
    set_desc('Close Tab')
)
vim.keymap.set(
    'n',
    '<leader><tab>h',
    '<cmd>tabprevious<cr>',
    set_desc('Previous Tab')
)
