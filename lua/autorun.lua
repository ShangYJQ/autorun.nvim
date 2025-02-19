local coref = require("autorun.utils")
local defult_conf = require("autorun.config")
local dap_core = require("autorun.dapcore")
local conf = {}
local M = {}

local info = debug.getinfo(1, "S");
local path = info.source
path = string.sub(path, 2, -1)

function M.run_code()
  local file_path = vim.fn.expand("%:p")
  local file_type = vim.fn.expand("%:e")
  local file_name = coref.get_file_name(file_path)
  local py_path = ""

  if file_type == "" or file_type == " " then
    error("The file type is empty!Please check!")
  end
  if coref.check_extension(file_type) then
    py_path = string.gsub(path, "autorun.lua$", "autorun/py/" .. file_type .. ".py")
  else
    error("The file type must be .c .cpp .py .rust .java .go .lua! but your is " .. file_type .. "!")
  end

  local cmd = conf.py_exec .. " " .. py_path .. " " .. file_name

  if file_type == "cpp" then
    cmd = cmd .. " " .. conf.cpp_c
  elseif file_type == "c" then
    cmd = cmd .. " " .. conf.c_c
  elseif file_type == "py" then
    cmd = cmd .. " " .. conf.py_exec
  end

  cmd = "cd " .. coref.get_file_dir(file_path) .. " && " .. cmd

  vim.api.nvim_command(":TermExec direction=float cmd='" .. cmd .. "'")
end

function M.dap_code()
  local file_path = vim.fn.expand("%:p")
  local file_type = vim.fn.expand("%:e")
  local file_name = coref.get_file_name(file_path)
  local out_file_name = file_name
  local out_file_path = coref.get_file_dir(file_path) .. "/debug/" .. out_file_name

  if not file_type == "cpp" then
    error("The file type is not cpp!")
  end
  local debug_dir = coref.get_file_dir(file_path) .. "/debug"
  os.execute("rm -rf " .. debug_dir .. " && mkdir " .. debug_dir)

  local cmd = conf.cpp_c .. " -g " .. file_name .. " -o debug/" .. out_file_name
  cmd = "cd " .. coref.get_file_dir(file_path) .. " && " .. cmd

  vim.api.nvim_command(":!" .. cmd)

  dap_core.cpp_dap(out_file_path)
  vim.api.nvim_command(":lua require'dap'.continue()")
end

function M.setup(opts)
  conf = vim.tbl_deep_extend("force", defult_conf, opts or {})
  vim.api.nvim_create_user_command("Autorun", M.run_code, {
    desc = "Use autorun plugin to run your code!",
  })
  vim.api.nvim_create_user_command("Autodap", M.dap_code, {
    desc = "Use autorun plugin to dap your code!"
  })
  -- vim.keymap.set("n", "<A-r>", run_code, { noremap = true, silent = true })
end

return M
