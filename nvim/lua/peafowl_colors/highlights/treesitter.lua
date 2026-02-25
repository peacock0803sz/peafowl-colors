local C = require("peafowl_colors.palettes")

--- @type { [string]: HiGroup }
return {
  -- Identifiers
  ["@variable"] = { link = "Identifiers" }, -- Any variable name that does not have another highlight.
  ["@variable.builtin"] = { link = "Identifiers" }, -- Variable names that are defined by the languages, like this or self.
  ["@variable.parameter"] = { link = "Identifiers" }, -- For parameters of a function.
  ["@variable.member"] = { link = "Identifiers" }, -- For fields.

  ["@constant"] = { link = "Constant" }, -- For constants
  ["@constant.builtin"] = { link = "Constant" }, -- For constant that are built in the language: nil in Lua.
  ["@constant.macro"] = { link = "Constant" }, -- For constants that are defined by macros: NULL in C.

  ["@module"] = { link = "Identifiers" }, -- For identifiers referring to modules and namespaces.
  ["@label"] = { link = "Identifiers" }, -- For labels: label: in C and :label: in Lua.

  -- Literals
  ["@string"] = { link = "String" }, -- For strings.
  ["@string.documentation"] = { link = "String" }, -- For strings documenting code (e.g. Python docstrings).
  ["@string.regexp"] = { link = "String" }, -- For regexes.
  ["@string.escape"] = { link = "SpecialChar" }, -- For escape characters within a string.
  ["@string.special"] = { link = "String" }, -- other special strings (e.g. dates)
  ["@string.special.path"] = { link = "String" }, -- filenames
  ["@string.special.symbol"] = { link = "String" }, -- symbols or atoms
  ["@string.special.url"] = { link = "String" }, -- urls, links and emails
  ["@punctuation.delimiter.regex"] = { link = "String" },

  ["@character"] = { link = "String" }, -- character literals
  ["@character.special"] = { link = "SpecialChar" }, -- special characters (e.g. wildcards)

  ["@boolean"] = { link = "Boolean" }, -- For booleans.
  ["@number"] = { link = "Number" }, -- For all numbers
  ["@number.float"] = { link = "Number" }, -- For floats.

  -- Types
  ["@type"] = { link = "Type" }, -- For types.
  ["@type.builtin"] = { link = "Type" }, -- For builtin types.
  ["@type.definition"] = { link = "Type" }, -- type definitions (e.g. `typedef` in C)

  ["@attribute"] = { link = "Keyword" }, -- attribute annotations (e.g. Python decorators)
  ["@property"] = { link = "Identifiers" }, -- For fields, like accessing `bar` property on `foo.bar`. Overriden later for data languages and CSS.

  -- Functions
  ["@function"] = { link = "Function" }, -- For function (calls and definitions).
  ["@function.builtin"] = { link = "Function" }, -- For builtin functions: table.insert in Lua.
  ["@function.call"] = { link = "Function" }, -- function calls
  ["@function.macro"] = { link = "Function" }, -- For macro defined functions (calls and definitions): each macro_rules in Rust.

  ["@function.method"] = { link = "Function" }, -- For method definitions.
  ["@function.method.call"] = { link = "Function" }, -- For method calls.

  ["@constructor"] = { link = "Function" }, -- For constructor calls and definitions: = { } in Lua, and Java constructors.
  ["@operator"] = { link = "Operator" }, -- For any operator: +, but also -> and * in C.

  -- Keywords
  ["@keyword"] = { link = "Keyword" }, -- For keywords that don't fall in previous categories.
  ["@keyword.modifier"] = { link = "Keyword" }, -- For keywords modifying other constructs (e.g. `const`, `static`, `public`)
  ["@keyword.type"] = { link = "Keyword" }, -- For keywords describing composite types (e.g. `struct`, `enum`)
  ["@keyword.coroutine"] = { link = "Keyword" }, -- For keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
  ["@keyword.function"] = { link = "Keyword" }, -- For keywords used to define a function.
  ["@keyword.operator"] = { link = "Keyword" }, -- For new keyword operator
  ["@keyword.import"] = { link = "Keyword" }, -- For includes: #include in C, use or extern crate in Rust, or require in Lua.
  ["@keyword.repeat"] = { link = "Keyword" }, -- For keywords related to loops.
  ["@keyword.return"] = { link = "Keyword" },
  ["@keyword.debug"] = { link = "Keyword" }, -- For keywords related to debugging
  ["@keyword.exception"] = { link = "Keyword" }, -- For exception related keywords.
  ["@keyword.conditional"] = { link = "Keyword" }, -- For keywords related to conditionnals.
  ["@keyword.conditional.ternary"] = { link = "Keyword" }, -- For ternary operators (e.g. `?` / `:`)
  ["@keyword.directive"] = { link = "Keyword" }, -- various preprocessor directives & shebangs
  ["@keyword.directive.define"] = { link = "Keyword" }, -- preprocessor definition directives
  ["@keyword.export"] = { link = "Keyword" },

  -- Punctuation
  ["@punctuation.delimiter"] = { link = "Special" }, -- For delimiters (e.g. `;` / `.` / `,`).
  ["@punctuation.bracket"] = { link = "Special" }, -- For brackets and parenthesis.
  ["@punctuation.special"] = { link = "Special" }, -- For special punctuation that does not fall in the categories before (e.g. `{}` in string interpolation).

  -- Comment
  ["@comment"] = { link = "Comment" },
  ["@comment.documentation"] = { link = "Comment" }, -- For comments documenting code

  ["@comment.error"] = { values = { bg = C.scarlet } },
  ["@comment.warning"] = { values = { bg = C.amber } },
  ["@comment.hint"] = { values = { bg = C.sapphire } },
  ["@comment.todo"] = { values = { bg = C.emerald } },
  ["@comment.note"] = { values = { bg = C.amethyst } },

  -- Markup
  ["@markup"] = { link = "String" }, -- For strings considerated text in a markup language.
  ["@markup.strong"] = { values = { fg = C.amethyst } }, -- bold
  ["@markup.italic"] = { values = { fg = C.amber }, style = { italic = true } }, -- italic
  ["@markup.strikethrough"] = { values = { fg = C.amber }, style = { strikethrough = true } }, -- strikethrough text
  ["@markup.underline"] = { values = { fg = C.amber }, style = { underline = true } }, -- underlined text

  ["@markup.heading"] = { values = { fg = C.emerald } }, -- titles like: # Example
  ["@markup.heading.markdown"] = { link = "@markup.heading" }, -- bold headings in markdown, but not in HTML or other markup

  ["@markup.math"] = {}, -- math environments (e.g. `$ ... $` in LaTeX)
  ["@markup.quote"] = {}, -- block quotes
  ["@markup.environment"] = {}, -- text environments of markup languages
  ["@markup.environment.name"] = {}, -- text indicating the type of an environment

  ["@markup.link"] = {}, -- text references, footnotes, citations, etc.
  ["@markup.link.label"] = {}, -- link, reference descriptions
  ["@markup.link.url"] = {}, -- urls, links and emails

  ["@markup.raw"] = {}, -- used for inline code in markdown and for doc in python (""")

  ["@markup.list"] = {},
  ["@markup.list.checked"] = {}, -- todo notes
  ["@markup.list.unchecked"] = {}, -- todo notes

  -- Diff
  ["@diff.plus"] = { link = "diffAdded" }, -- added text (for diff files)
  ["@diff.minus"] = { link = "diffRemoved" }, -- deleted text (for diff files)
  ["@diff.delta"] = { link = "diffChanged" }, -- deleted text (for diff files)

  -- Tags
  ["@tag"] = {}, -- Tags like HTML tag names.
  ["@tag.builtin"] = {}, -- JSX tag names.
  ["@tag.attribute"] = {}, -- XML/HTML attributes (foo in foo="bar").
  ["@tag.delimiter"] = {}, -- Tag delimiter like < > /

  -- Misc
  ["@error"] = {},

  -- Language specific:

  -- Bash
  ["@function.builtin.bash"] = {},
  ["@variable.parameter.bash"] = {},

  -- markdown
  ["@markup.heading.1.markdown"] = {},
  ["@markup.heading.2.markdown"] = {},
  ["@markup.heading.3.markdown"] = {},
  ["@markup.heading.4.markdown"] = {},
  ["@markup.heading.5.markdown"] = {},
  ["@markup.heading.6.markdown"] = {},

  -- html
  ["@markup.heading.html"] = {},
  ["@markup.heading.1.html"] = {},
  ["@markup.heading.2.html"] = {},
  ["@markup.heading.3.html"] = {},
  ["@markup.heading.4.html"] = {},
  ["@markup.heading.5.html"] = {},
  ["@markup.heading.6.html"] = {},

  -- Java
  ["@constant.java"] = {},

  -- CSS
  ["@property.css"] = {},
  ["@property.scss"] = {},
  ["@property.id.css"] = {},
  ["@property.class.css"] = {},
  ["@type.css"] = {},
  ["@type.tag.css"] = {},
  ["@string.plain.css"] = {},
  ["@number.css"] = {},
  ["@keyword.directive.css"] = {}, -- CSS at-rules: https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule.

  -- HTML
  ["@string.special.url.html"] = {}, -- Links in href, src attributes.
  ["@markup.link.label.html"] = {}, -- Text between <a></a> tags.
  ["@character.special.html"] = {}, -- Symbols such as &nbsp;.

  -- Lua
  ["@constructor.lua"] = {}, -- For constructor calls and definitions: = { } in Lua.

  -- Python
  ["@constructor.python"] = {}, -- __init__(), __new__().

  -- YAML
  ["@label.yaml"] = {}, -- Anchor and alias names.

  -- Ruby
  ["@string.special.symbol.ruby"] = {},

  -- PHP
  ["@function.method.php"] = {},
  ["@function.method.call.php"] = {},

  -- C/CPP
  ["@keyword.import.c"] = {},
  ["@keyword.import.cpp"] = {},

  -- C#
  ["@attribute.c_sharp"] = {},

  -- gitcommit
  ["@comment.warning.gitcommit"] = {},

  -- gitignore
  ["@string.special.path.gitignore"] = {},

  -- Misc
  gitcommitSummary = {},
  zshKSHFunction = {},
}
