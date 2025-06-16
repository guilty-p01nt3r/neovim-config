local M = {}

local dataPath = vim.fn.stdpath("data");
local masonSubPath = "/mason/bin/"

function M.get_mason_executable(package_name)

  local mason_path = dataPath .. masonSubPath ..  package_name

  -- Optional: check if it exists
  if vim.fn.filereadable(mason_path) == 1 then
    return mason_path
  else
    vim.notify("Executable not found: " .. mason_path, vim.log.levels.ERROR)
    return nil
  end
end

return M
