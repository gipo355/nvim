local M = {}
M.setup = function()
    return {
        filetypes = { 'yaml', 'yml' },
        settings = {
            yaml = {
                schemaStore = {
                    -- You must disable built-in schemaStore support if you want to use
                    -- this plugin and its advanced options like `ignore`.
                    enable = false,
                    -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                    url = '',
                },
                -- schemaStore = {
                --     url = 'https://www.schemastore.org/api/json/catalog.json',
                --     enable = true,
                -- },
                format = {
                    enable = true,
                    singleQuote = true,
                },
                validate = true,
                hover = true,
                completion = true,
                schemas = require('schemastore').yaml.schemas({
                    extra = {
                        {
                            description = 'compose',
                            fileMatch = {
                                '*compose*.yml',
                                '*compose*.yaml',
                            },
                            name = 'docker-compose',
                            url = 'https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json',
                        },
                        {
                            description = 'kubernetes',
                            fileMatch = {
                                '*.k8.yaml',
                                '*.k8.yml',
                                '*.k8s.yaml',
                                '*.k8s.yml',
                            },
                            name = 'kubernetes',
                            url = 'https://kubernetesjsonschema.dev/master-standalone-strict/all.json',
                            -- url = 'https://kubernetesjsonschema.dev/v1.10.3-standalone/service-v1.json',
                            -- url = 'https://kubernetesjsonschema.dev/v1.14.0/deployment-apps-v1.json',
                            -- url = 'https://github.com/yannh/kubernetes-json-schema/blob/master/v1.32.3/all.json',
                        },
                        {
                            description = 'github-action',
                            fileMatch = {
                                'action.yml',
                                'action.yaml',
                            },
                            name = 'github-action',
                            url = 'https://json.schemastore.org/github-action',
                        },
                        {
                            description = 'github-workflow',
                            fileMatch = {
                                'workflows/*.yml',
                                'workflows/*.yaml',
                            },
                            name = 'github-workflow',
                            url = 'https://json.schemastore.org/github-workflow',
                        },
                    },
                }),
                -- schemas = {
                --     kubernetes = '*.k8s.yaml',
                --     ['http://json.schemastore.org/github-workflow'] = '.github/workflows/*',
                --     ['http://json.schemastore.org/github-action'] = '.github/action.{yml,yaml}',
                --     ['http://json.schemastore.org/ansible-stable-2.9'] = 'roles/tasks/*.{yml,yaml}',
                --     ['http://json.schemastore.org/prettierrc'] = '.prettierrc.{yml,yaml}',
                --     ['http://json.schemastore.org/kustomization'] = 'kustomization.{yml,yaml}',
                --     ['http://json.schemastore.org/ansible-playbook'] = '*play*.{yml,yaml}',
                --     ['http://json.schemastore.org/chart'] = 'Chart.{yml,yaml}',
                --     ['https://json.schemastore.org/dependabot-v2'] = '.github/dependabot.{yml,yaml}',
                --     ['https://json.schemastore.org/gitlab-ci'] = '*gitlab-ci*.{yml,yaml}',
                --     ['https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json'] = '*api*.{yml,yaml}',
                --     ['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = '*compose*.{yml,yaml}',
                --     ['https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json'] = '*flow*.{yml,yaml}',
                -- },
            },
        },
    }
end
return M
