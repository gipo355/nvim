local set_desc = require('user.utils.functions').set_keymap_desc
-- NOTE: requires the Ollama service to be running and the chosen model to be available.
--
-- huge resource hog, not recommended for daily use
--
-- requires ollama in path and codellama model
--
-- 1. Install the Ollama service
-- 2. Pull the language model from the Ollama repository
--
-- Recommended beefy GPU for this plugin (possibly cuda)

return {
    -- Minimal configuration
    'David-Kunz/gen.nvim',

    event = 'BufReadPre',

    dependencies = {
        -- for chat
        'akinsho/toggleterm.nvim',
    },

    config = function()
        local gen = require('gen')
        -- custom prompts

        gen.prompts['Elaborate_Text'] = {
            prompt = 'Elaborate the following text:\n$text',
            replace = true,
        }
        gen.prompts['Fix_Code'] = {
            prompt = 'Fix the following code. Only ouput the result in format ```$filetype\n...\n```.\nThe code is:\n```$filetype\n$text\n```',
            replace = false,
            extract = '```$filetype\n(.-)```',
        }
        gen.prompts['Explain_Code'] = {
            prompt = 'Explain the following code. Only ouput the result in format ```$filetype\n...\n```.\nThe code is:\n```$filetype\n$text\n```',
            replace = false,
            extract = '```$filetype\n(.-)```',
        }
        gen.prompts['Performance_Code'] = {
            prompt = 'Optimize the following code:\n```$text```\n  It should increase its performance and follow best practices. Only ouput the result in format ```$filetype\n...\n```.\nThe code is:\n```$filetype\n$text\n```',
            replace = false,
            extract = '```$filetype\n(.-)```',
        }
        gen.prompts['Security_Code'] = {
            prompt = 'Analyze the following code. You are responsible for finding possible security flows of any kind, from web security flaws like OWASP vulnerabilities, data races, deadlocks, bufferoverflows and so on. Only ouput the result in format ```$filetype\n...\n```.\nThe code is:\n```$filetype\n$text\n```',
            replace = false,
            extract = '```$filetype\n(.-)```',
        }
        gen.prompts['OWASP'] = {
            prompt = 'Check this code against OWASP guidelines for security vulnerabilities. Only ouput the result in format ```$filetype\n...\n```.\nThe code is:\n```$filetype\n$text\n```',
            replace = false,
            extract = '```$filetype\n(.-)```',
        }
        gen.setup({
            model = 'codellama', -- The default model to use.
            -- host = 'localhost', -- The host running the Ollama service.
            -- port = '11434', -- The port on which the Ollama service is listening.
            -- quit_map = 'q',      -- set keymap for close the response window
            -- retry_map = '<c-r>', -- set keymap to re-send the current prompt
            -- init = function(options)
            --     pcall(io.popen, 'ollama serve > /dev/null 2>&1 &')
            -- end,
            -- -- Function to initialize Ollama
            -- command = function(options)
            --     local body = { model = opts.model, stream = true }
            --     return 'curl --silent --no-buffer -X POST http://'
            --         .. options.host
            --         .. ':'
            --         .. options.port
            --         .. '/api/chat -d $body'
            -- end,
            -- -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
            -- -- This can also be a command string.
            -- -- The executed command must return a JSON object with { response, context }
            -- -- (context property is optional).
            -- -- list_models = '<omitted lua function>', -- Retrieves a list of model names
            display_mode = 'split', -- The display mode. Can be "float" or "split".
            -- show_prompt = true, -- Shows the prompt submitted to Ollama.
            -- show_model = true, -- Displays which model you are using at the beginning of your chat session.
            no_auto_close = true, -- Never closes the window automatically.
            -- debug = false,          -- Prints errors and the command which is run.
        })

        -- hide diagnostics on
        vim.api.nvim_create_autocmd('BufEnter', {
            -- group = "lsp_format_on_save",
            pattern = 'gen.nvim',
            callback = function()
                vim.diagnostic.hide()
            end,
        })

        -- BUG: visual selection does not feed correct input
        -- the bug happens when i use <cmd> in visual instead of :

        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mlg',
            ':Gen<cr>',
            set_desc('Open Llama')
        )

        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mlc',
            ':Gen Chat<cr>',
            set_desc('Llama chat')
        )
        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mlq',
            ':Gen Summarize<cr>',
            set_desc('Llama summarize')
        )

        vim.keymap.set(
            { 'n', 'v' },
            '<leader>ma',
            ':Gen Ask<cr>',
            set_desc('Llama ask')
        )

        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mlC',
            ':Gen Change<cr>',
            set_desc('Llama change')
        )

        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mlb',
            ':Gen Enhance_Grammar_Spelling<cr>',
            set_desc('Llama enhance grammar spelling')
        )

        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mlW',
            ':Gen Enhance_Wording<cr>',
            set_desc('Llama enhance wording')
        )

        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mlM',
            ':Gen Make_Concise<cr>',
            set_desc('Llama make concise')
        )

        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mlL',
            ':Gen Make_List<cr>',
            set_desc('Llama make list')
        )

        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mlT',
            ':Gen Make_Table<cr>',
            set_desc('Llama make table')
        )

        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mlR',
            ':Gen Review_Code<cr>',
            set_desc('Llama review code')
        )

        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mle',
            ':Gen Enhance_Code<cr>',
            set_desc('Llama enhance code')
        )

        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mlC',
            ':Gen Change_Code<cr>',
            set_desc('Llama change code')
        )

        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mlF',
            ':Gen Fix_Code<cr>',
            set_desc('Llama fix code')
        )

        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mlE',
            ':Gen Elaborate_Text<cr>',
            set_desc('Llama elaborate text')
        )

        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mlP',
            ':Gen Performance_Code<cr>',
            set_desc('Llama performance code')
        )

        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mlS',
            ':Gen Security_Code<cr>',
            set_desc('Llama security code')
        )

        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mlX',
            ':Gen Explain_Code<cr>',
            set_desc('Llama explain code')
        )

        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mlO',
            ':Gen OWASP<cr>',
            set_desc('Llama OWASP')
        )
    end,
}
