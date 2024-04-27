-- [[ we set some global default vars and options here ]]
local M = {}

M.global_keymap_opts = {
    noremap = true,
    silent = true,
    -- expr = true, -- BUG: this breaks telescope
}

return M
