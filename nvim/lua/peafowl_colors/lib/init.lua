local M = {}

--- Apply highlight groups, overrides, and extras to the current Neovim session.
--- @param highlights HiTable
--- @param overrides? HiTable
--- @param extras? HiTable
function M.set_hi(highlights, overrides, extras)
  local converters = require("peafowl_colors.lib.converters")
  overrides = overrides or {}

  --- Convert HiGroup.values to nvim_set_hl-compatible keys.
  --- ColorRGB is converted via rgb2hex; strings like "NONE" pass through.
  --- @param values { [string]: ColorRGB | "NONE" }
  --- @return { [string]: string }
  local function to_hl(values)
    local result = {}
    for key, v in pairs(values) do
      result[key] = type(v) == "string" and v or converters.rgb2hex(v)
    end
    return result
  end

  --- Apply a single HiGroup via nvim_set_hl.
  --- @param name string
  --- @param data HiGroup
  local function apply(name, data)
    if data.link then
      vim.api.nvim_set_hl(0, name, { link = data.link })
    elseif data.values then
      local hl = to_hl(data.values)
      if data.style then
        hl = vim.tbl_extend("keep", hl, data.style)
      end
      vim.api.nvim_set_hl(0, name, hl)
    end
  end

  -- Apply base highlights, merging with overrides where they overlap
  for name, data in pairs(highlights) do
    local ov = overrides[name]
    if not ov then
      apply(name, data)
    else
      if data.values then
        local hl = to_hl(data.values)
        if ov.values then
          hl = vim.tbl_extend("force", hl, to_hl(ov.values))
        end
        -- ov.style が存在すれば (空テーブルでも) override の style を採用
        local style = ov.style ~= nil and ov.style or data.style
        if style then
          hl = vim.tbl_extend("keep", hl, style)
        end
        vim.api.nvim_set_hl(0, name, hl)
      else
        apply(name, ov)
      end
      overrides[name] = nil
    end
  end

  -- Apply remaining overrides and extras through the same path
  for _, groups in ipairs({ overrides, extras or {} }) do
    for name, data in pairs(groups) do
      apply(name, data)
    end
  end
end

return M
