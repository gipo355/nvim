local M = {}

M.USER_HOME = os.getenv('HOME')
M.SNYK_TOKEN = os.getenv('SNYK_TOKEN')
M.SNYK_ORG = os.getenv('SNYK_ORG')

return M
