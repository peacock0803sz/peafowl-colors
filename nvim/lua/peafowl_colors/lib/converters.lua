local M = {}

--- @param n number
--- @return string
local function int2hex(n)
	local hex = string.format("%x", n)
	if #hex == 1 then hex = "0" .. hex end
	return hex
end

--- @param color ColorRGB
--- @return string
function M.rgb2hex(color) return "#" .. int2hex(color.r) .. int2hex(color.g) .. int2hex(color.b) end

--- @param color ColorRGB
--- @param amount number
--- @param negative boolean
function M.brighten(color, amount, negative)
	local _max = 255
	local _min = 0
	local factor = negative and -amount or amount

	--- @type ColorRGB
	local new = { r = color.r + factor, g = color.g + factor, b = color.b + factor }

	if new.r > _max or new.g > _max or new.b > _max then
		return nil
	elseif new.r < _min or new.g < _min or new.b < _min then
		return nil
	end

	return new
end

return M
