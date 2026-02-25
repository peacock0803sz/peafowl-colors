--- @module "peafowl_colors"
--- @class M
local M = {}

--- @type Options
local default_options = {
  background = "light",
  italic_comment = true,
  transparent = false,
  extras = {},
}
local transparent_groups = {
  "Normal",
  "NormalNC",
  "NormalFloat",
  "NonText",
  "SignColumn",
  "LineNr",
  "Folded",
  "FoldColumn",
  "EndOfBuffer",
  "StatusLine",
  "StatusLineNC",
  "TabLine",
  "TabLineFill",
  "TabLineSel",
  "WinBar",
  "WinBarNC",
  "WinSeparator",
}

--- @type Options
local options = vim.deepcopy(default_options)

--- @param opts? Options
function M.setup(opts)
  options = vim.tbl_deep_extend("force", vim.deepcopy(default_options), opts or {})
end

--- Build highlight overrides from the current config.
--- @param opts Options
--- @return HiTable
local function _build_overrides(opts)
  --- @type HiTable
  local overrides = {}

  if opts.italic_comment == false then
    overrides["Comment"] = { style = {} }
  end

  if opts.transparent == true then
    for _, group in ipairs(transparent_groups) do
      overrides[group] = overrides[group] or {}
      overrides[group].values = overrides[group].values or {}
      overrides[group].values.bg = "NONE"
    end
  end

  return overrides
end

function M.load()
  local set_hi = require("peafowl_colors.lib").set_hi
  local highlights = require("peafowl_colors.highlights")

  local colors_name = "peafowl"
  vim.cmd("highlight clear")
  vim.o.background = options.background
  vim.g.colors_name = colors_name

  local overrides = _build_overrides(options)
  set_hi(highlights, overrides, options.extras)

  -- Defer extras reapplication so they persist after plugins
  -- (e.g. nvim-cmp, lualine) set their own highlights on load.
  if options.extras and next(options.extras) then
    local extras = options.extras
    vim.schedule(function()
      if vim.g.colors_name ~= colors_name then
        return
      end
      set_hi({}, {}, extras)
    end)
  end
end

return M
