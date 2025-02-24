local coref = require("autorun.utils")
local defult_conf = require("autorun.config")
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

function M.cgdb()
  local file_path = vim.fn.expand("%:p")
  local file_type = vim.fn.expand("%:e")
  local file_name = coref.get_file_name(file_path)

  if file_type ~= "cpp" then
    error("The file type must be cpp!Please check!")
  end

  local py_path = string.gsub(path, "autorun.lua$", "autorun/py/cgdb.py")

  local cmd = conf.py_exec .. " " .. py_path .. " " .. file_name


  cmd = "cd " .. coref.get_file_dir(file_path) .. " && " .. cmd .. " " .. conf.cpp_c

  vim.api.nvim_command(":TermExec direction=float cmd='" .. cmd .. "'")
end

function M.add_test()
  local file_path = vim.fn.expand("%:p")
  local file_type = vim.fn.expand("%:e")
  local file_name = coref.get_file_name(file_path)

  if file_type ~= "cpp" then
    error("The file type must be cpp!Please check!")
  end

  local py_path = string.gsub(path, "autorun.lua$", "autorun/py/function/addtest.py")

  local cmd = conf.py_exec .. " " .. py_path .. " " .. file_name

  cmd = "cd " .. coref.get_file_dir(file_path) .. " && " .. cmd

  vim.api.nvim_command(":TermExec direction=float cmd='" .. cmd .. "'")
end

function M.run_test()
  local file_path = vim.fn.expand("%:p")
  local file_type = vim.fn.expand("%:e")
  local file_name = coref.get_file_name(file_path)

  if file_type ~= "cpp" then
    error("The file type must be cpp!Please check!")
  end

  local py_path = string.gsub(path, "autorun.lua$", "autorun/py/function/runtest.py")

  local cmd = conf.py_exec .. " " .. py_path .. " " .. file_name .. " " .. conf.cpp_c

  cmd = "cd " .. coref.get_file_dir(file_path) .. " && " .. cmd

  vim.api.nvim_command(":TermExec direction=float cmd='" .. cmd .. "'")
end

function M.del_test()
  local file_path = vim.fn.expand("%:p")
  local file_type = vim.fn.expand("%:e")
  local file_name = coref.get_file_name(file_path)

  if file_type ~= "cpp" then
    error("The file type must be cpp!Please check!")
  end

  local py_path = string.gsub(path, "autorun.lua$", "autorun/py/function/deltest.py")

  local cmd = conf.py_exec .. " " .. py_path .. " " .. file_name

  cmd = "cd " .. coref.get_file_dir(file_path) .. " && " .. cmd

  vim.api.nvim_command(":TermExec direction=float cmd='" .. cmd .. "'")
end

function M.setup(opts)
  conf = vim.tbl_deep_extend("force", defult_conf, opts or {})
  vim.api.nvim_create_user_command("Autorun", M.run_code, {
    desc = "Use autorun plugin to run your code!",
  })

  vim.api.nvim_create_user_command("Autogdb", M.cgdb, {
    desc = "Use cgdb to debug your cpp code!"
  })

  vim.api.nvim_create_user_command("Autoaddtest", M.add_test, {
    desc = "Add test"
  })

  vim.api.nvim_create_user_command("Autoruntest", M.run_test, {
    desc = "Run test"
  })

  vim.api.nvim_create_user_command("Autodeltest", M.del_test, {
    desc = "Del all your tests"
  })

  -- vim.keymap.set("n", "<A-r>", run_code, { noremap = true, silent = true })
end

return M
