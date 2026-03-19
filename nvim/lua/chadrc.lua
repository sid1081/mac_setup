-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tokyonight",

  -- hl_override = {
  -- Comment = { italic = true },
  -- ["@comment"] = { italic = true },
  -- },
}

M.ui = {
  statusline = {
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor", "time" },
    modules = {
      time = function()
        return "  " .. os.date "%H:%M" .. " "
      end,
    },
  },
}

return M
