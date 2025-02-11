local info = debug.getinfo(1, "S");

local path = info.source

path = string.sub(path, 2, -1)

local function check_extension(filetype)
  if filetype == "cpp" or
      filetype == "py" or
      filetype == "rs" then
    return true
  else
    return false
  end
end

local py_exec = "python"

local M = {}

function M.run_code()
  local file_path = vim.fn.expand("%:p")
  local file_type = vim.fn.expand("%:e")
  local py_path = ""
  if check_extension(file_type) then
    py_path = string.gsub(path, "init.lua$", "py/" .. file_type .. ".py")
  else
    error("The file type must be .cpp .py .rust! but your is " .. file_type)
  end
  vim.api.nvim_command(":TermExec direction=float cmd='" .. py_exec .. " " .. py_path .. " " .. file_path .. "'")
end

function M.setup(opts)
  py_exec = opts.py_exec
  vim.keymap.set("n", "<A-r>", M.run_code, { noremap = true, silent = true })
  vim.keymap.set("n", "<C-q>", ":q!<CR>", { noremap = true, silent = true })
end

return M
