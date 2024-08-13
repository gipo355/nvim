-- For the description on keymaps, I have a function getOptions(desc) which returns noremap=true, silent=true and desc=desc. Then call: keymap(mode, keymap, command, getOptions("some randome desc")

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- TODO: add keymaps

-- Utils
local utils = require('user.utils.functions')
local set_desc = utils.set_keymap_desc
local merge_tables = utils.merge_tables
local opts = require('user.utils.options').global_keymap_opts

-- Diagnostic keymaps
vim.keymap.set(
    'n',
    '[d',
    vim.diagnostic.goto_prev,
    set_desc('Go to previous diagnostic message')
)
vim.keymap.set(
    'n',
    ']d',
    vim.diagnostic.goto_next,
    set_desc('Go to next diagnostic message')
)
vim.keymap.set(
    'n',
    '<leader>ve',
    vim.diagnostic.open_float,
    set_desc('Show diagnostic [E]rror messages')
)
vim.keymap.set(
    'n',
    '<leader>vq',
    vim.diagnostic.setloclist,
    set_desc('Open diagnostic [Q]uickfix list')
)

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set(
    'n',
    '<C-h>',
    '<C-w><C-h>',
    set_desc('Move focus to the left window')
)
vim.keymap.set(
    'n',
    '<C-l>',
    '<C-w><C-l>',
    set_desc('Move focus to the right window')
)

-- need those keymaps for frecency and
-- vim.keymap.set(
--     'n',
--     '<C-j>',
--     '<C-w><C-j>',
--     { desc = 'Move focus to the lower window' }
-- )
-- vim.keymap.set(
--     'n',
--     '<C-k>',
--     '<C-w><C-k>',
--     { desc = 'Move focus to the upper window' }
-- )

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup(
        'kickstart-highlight-yank',
        { clear = true }
    ),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set(
    'n',
    '<Esc>',
    '<cmd>nohlsearch<CR>',
    set_desc('Clear search highlights')
) -- below
-- vim.keymap.set('n', '<Esc>', '<cmd>nohl<CR><Esc>')

-- quit
vim.keymap.set('n', '<leader>Q', '<cmd>wqa<cr>', set_desc('[Q]uit all'))
vim.keymap.set('n', '<leader>q', '<cmd>confirm q<cr>', set_desc('[q]uit'))
-- vim.keymap.set(
--     'n',
--     '<C-q>',
--     '<cmd>confirm wa<cr><cmd>confirm q<cr>',
--     set_desc('save all and close current')
-- )

-- Macro
vim.keymap.set('n', '<C-q>', '<cmd>norm @q<cr>', set_desc('exec q macro'))

-- save
vim.keymap.set('n', '<leader>w', '<cmd>wa<cr>', set_desc('Save all'))
vim.keymap.set('n', '<c-s>', '<cmd>w<cr><cmd>wa<cr>', set_desc('Save all'))
vim.keymap.set(
    'n',
    '<leader>W',
    '<cmd>w ++p<cr>',
    set_desc('Save while creating folders')
)
-- ## CUSTOM
-- vim.keymap.set('n', '<C-s>', '<cmd>w<cr>', set_desc('Save file'))

-- ## primeagen
-- keep cursor in place after line join
vim.keymap.set(
    'n',
    'J',
    'mzJ`z',
    set_desc('Keep cursor in place after line join')
)

-- ### override \ (open nerdtree, netrw) (first 2) ( USING OIL PLUGIN INSTEAD)
-- keymap("n", "-", "<cmd>Explore<CR>", opts) -- file browser
-- keymap("n", "\\", "<cmd>Rex<CR>", opts)
-- keymap("n", "\\", "<cmd>Explore<CR>", opts)
-- keymap("n", "\\", "<cmd>lua require('nvim-tree').open_replacing_current_buffer()<cr>", opts) -- open nvim tree vinegar mode
-- keymap("n", "\\", "<cmd>Neo-tree position=current", opts) -- bbye plugin

-- ### chris mappings
-- keymap("n", "-", "<cmd>lua require'lir.float'.toggle()<cr>", opts) -- file browser
-- keymap("n", "\\", "<cmd>lua require'lir.float'.toggle()<cr>", opts)
-- keymap("n", "<leader>r", "<cmd>lua require'lir.float'.toggle()<cr>", { noremap = true, silent = true, desc = 'lir float' })
vim.keymap.set(
    'n',
    '<F7>',
    '<cmd>TSHighlightCapturesUnderCursor<cr>',
    set_desc('Highlight captures under cursor')
)
-- keymap("n", "<m-v>", "<cmd>lua require('lsp_lines').toggle()<cr>", opts) -- hide virtual lines
vim.keymap.set(
    'n',
    '<m-/>',
    "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
    set_desc('Comment line')
)

-- Better window navigation, alt tab to switch between windows
-- vim.keymap.set('n', '<m-tab>', '<c-6>', set_desc('Go to previous buffer'))

-- ## harpoon tab keybind, conflicts with default jumplist keymap <C-i>
-- vim.api.nvim_set_keymap(
-- keymap(
--     "n",
--     "<tab>",
--     -- "<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>",
--     "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
--     opts
-- )
-- # we need to tell nvim that tab and c-i are separate keys
-- https://neovim.discourse.group/t/problems-mapping-c-i-and-tab-separately/2926/3
-- keymap(
--   "n",
--   "<C-i>",
--   -- "<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>",
--   "<C-i>",
--   opts
-- )

-- ########## toggle quickfix
local toggle_qf = function()
    local qf_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
        if win['quickfix'] == 1 then
            qf_exists = true
        end
    end
    if qf_exists == true then
        vim.cmd('cclose')
        return
    end
    if not vim.tbl_isempty(vim.fn.getqflist()) then
        vim.cmd('copen')
    end
end
vim.keymap.set('n', '<m-i>', toggle_qf, set_desc('Toggle quickfix'))

-- ## toggle inlay hints
-- "<cmd>vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())<cr>",
-- vim.keymap.set('n', '<C-x>', utils.toggle_hints, set_desc('Toggle hints'))
vim.keymap.set('n', '<M-x>', utils.toggle_hints, set_desc('Toggle hints'))
vim.keymap.set(
    'n',
    '<S-x>',
    utils.toggle_diagnostics,
    set_desc('Toggle diagnostics')
)

-- vim.keymap.set(
--     'n',
--     '<M-x>',
--     utils.toggle_all,
--     set_desc('Toggle hints and diagnostics')
-- )

-- ## refresh code lens ( adding in lsp )
-- vim.keymap.set(
--     'n',
--     '<C-c>',
--     '<cmd>lua vim.lsp.codelens.refresh()<cr>',
--     set_desc('Refresh code lens')
-- )

-- ## open code actions
vim.keymap.set(
    { 'n', 'v' },
    '<C-c>',
    ':lua vim.lsp.buf.code_action()<cr>',
    set_desc('lsp code actions')
)

-- keymap("n", "<leader>vi", "<cmd>lua vim.lsp.inlay_hint()<cr>", { noremap = true, silent = true, desc = 'hints' })

-- ##### toggle diagnostics  virtual text wit ctrl-v #####
local diagnostics_active = true
vim.keymap.set('n', '<m-v>', function()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
        -- vim.diagnostic.show()
        vim.diagnostic.config({ virtual_text = true })
    else
        vim.diagnostic.config({ virtual_text = false })
        -- vim.diagnostic.hide()
    end
end)

-- ##### from lazyvim

-- Add undo break-points
vim.keymap.set('i', ',', ',<c-g>u', set_desc('Add undo break-points'))
vim.keymap.set('i', '.', '.<c-g>u', set_desc('Add undo break-points'))
vim.keymap.set('i', ';', ';<c-g>u', set_desc('Add undo break-points'))

-- no idea what overrrided this, got to do with modifying the on_attach function for the lsp
-- the lvim builting on_attach on lspconfig adds the keybinding ( doesn't work for ts )
vim.keymap.set(
    'n',
    'gl',
    vim.diagnostic.open_float,
    set_desc('Show diagnostic [L]ist')
)

vim.keymap.set(
    'n',
    'gd',
    '<cmd>lua vim.lsp.buf.definition()<cr>',
    set_desc('Go to [D]efinition')
)

-- #### chris keymaps (lvim)

-- Resize with arrows
vim.keymap.set(
    'n',
    '<M-Up>',
    ':resize -2<CR>',
    set_desc('Resize window horizontally')
)
vim.keymap.set(
    'n',
    '<M-Down>',
    ':resize +2<CR>',
    set_desc('Resize window horizontally')
)
vim.keymap.set(
    'n',
    '<M-Left>',
    ':vertical resize -2<CR>',
    set_desc('Resize window vertically')
)
vim.keymap.set(
    'n',
    '<M-Right>',
    ':vertical resize +2<CR>',
    set_desc('Resize window vertically')
)

-- vim.keymap.set('n', '<c-j>', '<c-d>', opts)
-- vim.keymap.set('n', '<c-k>', '<c-u>', opts)
-- vim.keymap.set('n', '<c-m>', '<s-m>', opts)

-- Visual --
-- Stay in indent mode, better indenting
vim.keymap.set('v', '<', '<gv', set_desc('Unindent selection'))
vim.keymap.set('v', '>', '>gv', set_desc('Indent selection'))

-- paste without yanking
vim.keymap.set('x', 'p', [["_dP]], set_desc('paste without yanking'))
-- vim.keymap.set(
--     'v',
--     '<leader>p',
--     '<cmd>_dP<cr>',
--     { desc = 'paste without yanking' }
-- )
-- vim.keymap.set("v", "p", '"_dp', opts)
-- vim.keymap.set("v", "P", '"_dP', opts)

vim.keymap.set(
    'n',
    '<F6>',
    [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>]],
    set_desc('Highlight group under cursor')
)

-- vim.keymap.set('n', '<F7>', '<cmd>TSHighlightCapturesUnderCursor<cr>', opts)
-- vim.keymap.set('n', '-', ":lua require'lir.float'.toggle()<cr>", opts)

vim.keymap.set(
    'n',
    'gX',
    [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]],
    set_desc('Open file in browser')
)

vim.cmd([[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]])

vim.keymap.set(
    'n',
    '<m-q>',
    ':call QuickFixToggle()<cr>',
    set_desc('Toggle quickfix')
)

-- ## end chris keymaps

-- ## lunarvim
-- Move current line / block with Alt-j/k ala vscode.
-- vim.keymap.set(
--     'n',
--     '<A-j>',
--     '<cmd>m .+1<CR>==gi<cr>',
--     { desc = 'Move line down' }
-- )
-- Move current line / block with Alt-j/k ala vscode.
-- vim.keymap.set(
--     'n',
--     '<A-k>',
--     '<cmd>m .-2<CR>==gi<cr>',
--     { desc = 'Move line up' }
-- )

-- ## lazyvim

-- Move Lines
vim.keymap.set('n', '<A-j>', '<cmd>m .+1<cr>==', set_desc('Move down'))
vim.keymap.set('n', '<A-k>', '<cmd>m .-2<cr>==', set_desc('Move up'))
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', set_desc('Move down'))
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', set_desc('Move up'))
vim.keymap.set('v', '<A-j>', ":m '>+1<cr>gv=gv", set_desc('Move down'))
vim.keymap.set('v', '<A-k>', ":m '<-2<cr>gv=gv", set_desc('Move up'))

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set(
    'n',
    'n',
    "'Nn'[v:searchforward].'zv'",
    merge_tables(opts, { expr = true, desc = 'Next search result' })
)
vim.keymap.set(
    'x',
    'n',
    "'Nn'[v:searchforward]",
    merge_tables(opts, { expr = true, desc = 'Next search result' })
)
vim.keymap.set(
    'o',
    'n',
    "'Nn'[v:searchforward]",
    merge_tables(opts, { expr = true, desc = 'Next search result' })
)
vim.keymap.set(
    'n',
    'N',
    "'nN'[v:searchforward].'zv'",
    merge_tables(opts, { expr = true, desc = 'Prev search result' })
)
vim.keymap.set(
    'x',
    'N',
    "'nN'[v:searchforward]",
    merge_tables(opts, { expr = true, desc = 'Prev search result' })
)
vim.keymap.set(
    'o',
    'N',
    "'nN'[v:searchforward]",
    merge_tables(opts, { expr = true, desc = 'Prev search result' })
)

-- ### Terminal Mappings keybinds keymaps

-- from toggleterm docs
function _G.set_terminal_keymaps()
    vim.api.nvim_buf_set_keymap(0, 't', '<m-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<m-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<m-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<m-l>', [[<C-\><C-n><C-W>l]], opts)
    -- close with ctrl-c
    vim.api.nvim_buf_set_keymap(0, 't', '<C-c>', [[<Cmd>wincmd q<cr>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- remove, breaks lazygit
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', set_desc('Exit terminal mode'))
vim.keymap.set('t', '<C-c>', '<C-\\><C-n>', set_desc('Exit terminal mode'))

-- vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>', set_desc('Enter Normal Mode')) -- double keymap

vim.keymap.set('t', '<C-h>', '<cmd>wincmd h<cr>', set_desc('Go to left window'))
vim.keymap.set(
    't',
    '<C-j>',
    '<cmd>wincmd j<cr>',
    set_desc('Go to lower window')
)
vim.keymap.set(
    't',
    '<C-k>',
    '<cmd>wincmd k<cr>',
    set_desc('Go to upper window')
)
vim.keymap.set(
    't',
    '<C-l>',
    '<cmd>wincmd l<cr>',
    set_desc('Go to right window')
)
vim.keymap.set('t', '<C-/>', '<cmd>close<cr>', set_desc('Hide Terminal'))
vim.keymap.set('t', '<c-_>', '<cmd>close<cr>', set_desc('Hide Terminal'))

-- close all other buffers
vim.keymap.set(
    'n',
    '<leader>bB',
    '<cmd>%bd|e#|bd#<cr>',
    set_desc('Close all other buffers')
)

-- An exprssion mapping for dd that doesn't yank an empty line into your default register:
vim.keymap.set('n', 'dd', function()
    if vim.api.nvim_get_current_line():match('^%s*$') then
        return '"_dd'
    else
        return 'dd'
    end
end, {
    expr = true,
    noremap = true,
    silent = true,
    desc = 'delete line no yank empty',
})

--  Another exprssion mapping for i that will indent properly on empty lines:
-- using chris example
vim.keymap.set('n', 'i', function()
    if #vim.fn.getline('.') == 0 then
        return [["_cc]]
    else
        return 'i'
    end
end, {
    expr = true,
    noremap = true,
    silent = true,
    desc = 'indent properly on empty lines',
})

-- [https://www.reddit.com/r/neovim/comments/17q22qp/colemakdh_nvim/]
-- colemak rebind movement keys
if _G.user.colemak then
    local mode = { 'n', 'x', 'o', 't', 'v' }

    vim.keymap.set(mode, 'm', 'h')
    -- vim.keymap.set(mode, 'M', 'H')

    -- vim.keymap.set(mode, 'h', 'i')
    vim.keymap.set(mode, 'h', 'm')
    -- vim.keymap.set(mode, 'H', 'I')

    -- down
    vim.keymap.set(mode, 'n', 'j')
    -- vim.keymap.set(mode, 'N', 'J')

    -- vim.keymap.set(mode, 'k', 'n')
    vim.keymap.set(mode, 'j', 'n')
    -- vim.keymap.set(mode, 'K', 'N')

    -- up
    vim.keymap.set(mode, 'e', 'k')
    -- vim.keymap.set(mode, 'E', 'K')

    -- vim.keymap.set(mode, 'l', 'e')
    vim.keymap.set(mode, 'k', 'e')
    -- vim.keymap.set(mode, 'L', 'E')

    -- right
    vim.keymap.set(mode, 'i', 'l')
    -- vim.keymap.set(mode, 'I', 'L')

    -- vim.keymap.set(mode, 'j', ';')
    vim.keymap.set(mode, 'l', 'i')
    -- vim.keymap.set(mode, 'J', ':')

    -- vim.keymap.set(mode, ';', 'm')
    -- vim.keymap.set(mode, ':', 'M')
end

--  c-k in insert mode to insert newline above
vim.keymap.set('i', '<C-k>', '<esc>O', set_desc('Insert newline above'))
-- s-cr doesn't work in tmux
vim.keymap.set('i', '<S-CR>', '<esc>O', set_desc('Insert newline above'))
-- c-j in insert mode to insert newline below
vim.keymap.set('i', '<C-j>', '<esc>o', set_desc('Insert newline below'))

-- select all
vim.keymap.set('n', 'M', 'ggVG', set_desc('Select all file'))
-- yank all file( replaces go to middle of displayed window M)
vim.keymap.set('n', 'MM', ':%y<cr>', set_desc('Yank all file'))
-- Change all file all file( replaces go to middle of displayed window M)
vim.keymap.set('n', 'dC', ':%c<cr>', set_desc('Change all file'))
-- Delete all file all file( replaces go to middle of displayed window M)
vim.keymap.set('n', 'dD', ':%d<cr>', set_desc('Delete all file'))
