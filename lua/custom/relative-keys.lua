local M = {}

function M.get_line_number()
  local line = vim.v.lnum
  local current = vim.fn.line('.')
  local relative = line - current

  local number_part = ""

  if relative == 0 then
    number_part = string.format('%4d', line)
  else
    local abs_relative = math.abs(relative)
    local key = relative > 0 and "j" or "k"
    local hl = relative > 0 and "DiagnosticInfo" or "DiagnosticHint"

    number_part = string.format("%%#%s#%4d%s", hl, abs_relative, key)
  end
  return "%s" .. number_part .. " "
end

function M.enable()
  vim.wo.statuscolumn = [[%!v:lua.require'custom.relative-keys'.get_line_number()]]
end

function M.disable()
  vim.wo.statuscolumn = ""
end

function M.toggle()
  if vim.wo.statuscolumn == "" then
    M.enable()
  else
    M.disable()
  end
end

return M

