local dap = require('dap')
local M = {}

function M.cpp_dap(out_file)
  dap.configurations.cpp = vim.tbl_deep_extend('force', dap.configurations.cpp, {
    { program = out_file, }
  })
end

return M
