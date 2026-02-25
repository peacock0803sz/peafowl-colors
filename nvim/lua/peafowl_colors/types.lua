--- @class ColorRGB
--- @field r integer
--- @field g integer
--- @field b integer

--- @class HiGroup
--- @field link? string
--- @field values? { [string]: ColorRGB | "NONE" }
--- @field style? { [string]: boolean | integer }
--- @alias HiTable { [string]: HiGroup }

--- @class Options
--- @field background? "light" | "dark"
--- @field italic_comment? boolean
--- @field transparent? boolean
--- @field extras? HiTable
