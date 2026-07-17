local M = {}

function M.current_buffer_dir()
  local buf_name = vim.api.nvim_buf_get_name(0)

  if buf_name == "" or buf_name:match("^[%w+.-]+://") then
    return vim.fn.getcwd()
  end

  local stat = vim.uv.fs_stat(buf_name)
  if stat and stat.type == "directory" then
    return buf_name
  end

  return vim.fs.dirname(buf_name)
end

function M.git_root()
  local current_dir = M.current_buffer_dir()
  local git_dir = vim.fs.find(".git", { path = current_dir, upward = true })[1]

  return git_dir and vim.fs.dirname(git_dir) or current_dir
end

return M
