local M = {}
M.setup = function()
    return {
        settings = {
            json = {
                schemas = require('schemastore').json.schemas({
                    extra = {
                        {
                            description = 'biomejs',
                            fileMatch = { 'biome.json*' },
                            name = 'biomejs',
                            url = 'https://biomejs.dev/schemas/1.8.3/schema.json',
                        },
                    },
                }),
                validate = { enable = true },
            },
        },
    }
end
return M
