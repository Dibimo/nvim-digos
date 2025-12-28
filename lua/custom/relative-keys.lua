local M = {}

function M.get_line_number()
  local line = vim.v.lnum
  local relnum = vim.v.relnum

  local number_part = ""

  if relnum == 0 then
    number_part = string.format('%4d', line)
  else
    local key = vim.v.lnum > vim.fn.line('.') and "j" or "k"
    local hl = vim.v.lnum > vim.fn.line('.') and "DiagnosticInfo" or "DiagnosticHint"

    number_part = string.format("%%#%s#%4d%s", hl, relnum, key)
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

