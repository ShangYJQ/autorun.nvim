local dap = require('dap')
local M = {}

function M.cpp_dap(adpt, out_file)
  dap.adapters.lldb = {
    type = 'executable',
    command = adpt, -- adjust as needed, must be absolute path
    name = 'lldb'
  }

  dap.configurations.cpp = {
    {
      name = 'Launch',
      type = 'lldb',
      request = 'launch',
      program = out_file,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = {},
    },
  }
end

return M
