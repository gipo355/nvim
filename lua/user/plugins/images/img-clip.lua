local utils = require('user.utils.functions')
local set_desc = utils.set_keymap_desc

-- alternative to clipboard-image.nvim
return {
    'HakonHarnes/img-clip.nvim',
    event = 'VeryLazy',
    config = function()
        require('img-clip').setup({
            -- add options here
            -- or leave it empty to use the default settings
            default = {
                dir_path = 'assets/imgs/nvim', -- directory path to save images to, can be relative (cwd or current file) or absolute
                url_encode_path = true, --
                embed_image_as_base64 = false,
                prompt_for_file_name = false,
                drag_and_drop = {
                    insert_mode = true,
                },
                -- required for Windows users
                use_absolute_path = true,
            },
        })
        vim.keymap.set(
            'n',
            '<leader>hp',
            '<cmd>PasteImage<cr>',
            set_desc('paste image')
        )
    end,
}
