local M = {}

local all_mods = { "editor", "syntax", "treesitter", "terminal" }
for _, name in ipairs(all_mods) do
  local ok, hls = pcall(require, "peafowl_colors.highlights." .. name)
  if ok then
    M = vim.tbl_deep_extend("error", M, hls)
  else
    vim.notify("Failed to load highlights for group: " .. name, vim.log.levels.WARN)
  end
end

return M
