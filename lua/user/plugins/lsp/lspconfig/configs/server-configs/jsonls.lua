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
                        {
                            description = 'kubernetes',
                            fileMatch = {
                                '*.k8.json',
                                '*.k8s.json',
                            },
                            name = 'kubernetes',
                            -- url = 'https://kubernetesjsonschema.dev/master-standalone-strict/all.json',
                            url = 'https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.26.0-standalone/all.json',
                        },
                    },
                }),
                validate = { enable = true },
            },
        },
    }
end
return M
