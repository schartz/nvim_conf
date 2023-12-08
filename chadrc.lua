---@type ChadrcConfig
local M = {}

M.ui = { 
  theme = 'radium',
  hl_override = {
    CursorLine = {
      bg = "lightbg",
    }
  }
}
M.plugins = "custom.plugins"
return M
