local M
function M.check_extension(filetype)
  if filetype == "cpp" or
      filetype == "py" or
      filetype == "c" or
      filetype == "java" or
      filetype == "go" or
      filetype == "rs" then
    return true
  else
    return false
  end
end

function M.get_file_dir(full_path)
  local lastpos = string.find(full_path:reverse(), "/")
  if lastpos then
    lastpos = #full_path - lastpos + 1
    local dirpath = string.sub(full_path, 1, lastpos - 1)
    return dirpath
  else
    return "./"
  end
end

function M.get_file_name(full_path)
  local lastpos = string.find(full_path:reverse(), "/")
  if lastpos then
    lastpos = #full_path - lastpos + 1
    local filename = string.sub(full_path, lastpos + 1)
    return filename
  else
    error("The file name is empty!")
  end
end

return M
