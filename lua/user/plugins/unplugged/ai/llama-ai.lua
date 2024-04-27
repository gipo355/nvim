local set_desc = require('user.utils.functions').set_keymap_desc

-- TODO: add globals to allow disabling ai plugins

-- NOTE: requires docker

return {
    'jpmcb/nvim-llama',
    config = function()
        require('nvim-llama').setup({

            -- See plugin debugging logs
            debug = false,

            -- The model for ollama to use. This model will be automatically downloaded.
            model = 'llama2:13b',
        })

        -- When setting the model setting, the specified model will be automatically downloaded:
        -- Model 	Parameters 	Size 	Model setting
        -- Neural Chat 	7B 	4.1GB 	model = neural-chat
        -- Starling 	7B 	4.1GB 	model = starling-lm
        -- Mistral 	7B 	4.1GB 	model = mistral
        -- Llama 2 	7B 	3.8GB 	model = llama2
        -- Code Llama 	7B 	3.8GB 	model = codellama
        -- Llama 2 Uncensored 	7B 	3.8GB 	model = llama2-uncensored
        -- Llama 2 13B 	13B 	7.3GB 	model = llama2:13b
        -- Llama 2 70B 	70B 	39GB 	model = llama2:70b
        -- Orca Mini 	3B 	1.9GB 	model = orca-mini
        -- Vicuna 	7B 	3.8GB 	model = vicuna
        --
        --     Note: You should have at least 8 GB of RAM to run the 3B models, 16 GB to run the 7B models, and 32 GB to run the 13B models. 70B parameter models require upwards of 64 GB of ram (if not more).

        -- To exit Terminal mode, which by default locks the focus to the terminal buffer, use the bindings Ctrl-\ Ctrl-n

        vim.keymap.set(
            'n',
            '<leader>md',
            '<cmd>Llama<cr>',
            set_desc('Start Llama')
        )
    end,
}
