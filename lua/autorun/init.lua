local defult_conf = require("autorun.conf")
local conf = {}

local info = debug.getinfo(1, "S");
local path = info.source
path = string.sub(path, 2, -1)

local function check_extension(filetype)
  if filetype == "cpp" or
      filetype == "py" or
      filetype == "c" or
      filetype == "rs" then
    return true
  else
    return false
  end
end

local function run_code()
  local file_path = vim.fn.expand("%:p")
  local file_type = vim.fn.expand("%:e")
  local py_path = ""
  if check_extension(file_type) then
    py_path = string.gsub(path, "init.lua$", "py/" .. file_type .. ".py")
  else
    error("The file type must be .c .cpp .py .rust! but your is " .. file_type)
  end
  local cmd = conf.py_exec .. " " .. py_path .. " " .. file_path

  if file_type == "cpp" then
    cmd = cmd .. " " .. conf.cpp_c
  elseif file_type == "c" then
    cmd = cmd .. " " .. conf.c_c
  elseif file_type == "py" then
    cmd = cmd .. " " .. conf.py_exec
  end

  vim.api.nvim_command(":TermExec direction=float cmd='" .. cmd .. "'")
end

local M = {}

function M.setup(opts)
  conf = vim.tbl_deep_extend("force", defult_conf, opts or {})

  vim.keymap.set("n", "<A-r>", run_code, { noremap = true, silent = true })
  vim.keymap.set("i", "<C-q>", "<Esc>", { noremap = true, silent = true })
end

return M
