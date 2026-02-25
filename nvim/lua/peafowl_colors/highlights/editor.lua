local C = require("peafowl_colors.palettes")

--- @type { [string]: HiGroup }
return {
  ColorColumn = {}, -- used for the columns set with 'colorcolumn'
  Conceal = {}, -- placeholder characters substituted for concealed text (see 'conceallevel')
  Cursor = { values = { fg = C.white, bg = C.amethyst } }, -- character under the cursor
  lCursor = { link = "Cursor" }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
  CursorIM = { link = "Cursor" }, -- like Cursor, but used when in IME mode |CursorIM|
  CursorColumn = { link = "ColorColumn" }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
  CursorLine = {}, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if forecrust (ctermfg OR guifg) is not set.
  Directory = {}, -- directory names (and other special names in listings)
  EndOfBuffer = {}, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
  ErrorMsg = {}, -- error messages on the command line
  VertSplit = {}, -- the column separating vertically split windows
  Folded = { values = { fg = C.sapphire }, style = { italic = true } }, -- line used for closed folds
  FoldColumn = { link = "ColorColumn" }, -- 'foldcolumn'
  SignColumn = {}, -- column where |signs| are displayed
  SignColumnSB = {}, -- column where |signs| are displayed
  Substitute = {}, -- |:substitute| replacement text highlighting
  LineNr = { values = { fg = C.gray0 } }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
  CursorLineNr = {}, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line. highlights the number in numberline.
  MatchParen = {}, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
  ModeMsg = {}, -- 'showmode' message (e.g., "-- INSERT -- ")
  -- MsgArea = {}, -- Area for messages and cmdline, don't set this highlight because of https://github.com/neovim/neovim/issues/17832
  MsgSeparator = { values = { fg = C.black } }, -- Separator for scrolled messages, `msgsep` flag of 'display'
  MoreMsg = { values = { fg = C.black } }, -- |more-prompt|
  NonText = { values = { fg = C.gray3 } }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
  Normal = {}, -- normal text
  NormalNC = {}, -- normal text in non-current windows
  NormalSB = {}, -- normal text in non-current windows
  NormalFloat = {}, -- Normal text in floating windows.
  FloatBorder = {},
  FloatTitle = {}, -- Title of floating windows
  FloatShadow = {},
  FloatShadowThrough = {},
  Pmenu = { values = { bg = C.white } }, -- Popup menu: normal item.
  PmenuSel = {}, -- Popup menu: selected item.
  PmenuMatch = {}, -- Popup menu: matching text.
  PmenuMatchSel = {}, -- Popup menu: matching text in selected item; is combined with |hl-PmenuMatch| and |hl-PmenuSel|.
  PmenuSbar = {}, -- Popup menu: scrollbar.
  PmenuThumb = {}, -- Popup menu: Thumb of the scrollbar.
  PmenuExtra = {}, -- Popup menu: normal item extra text.
  PmenuExtraSel = {}, -- Popup menu: selected item extra text.
  ComplMatchIns = {}, -- Matched text of the currently inserted completion.
  PreInsert = {}, -- Text inserted when "preinsert" is in 'completeopt'.
  ComplHint = {}, -- Virtual text of the currently selected completion.
  ComplHintMore = {}, -- The additional information of the virtual text.
  Question = {}, -- |hit-enter| prompt and yes/no questions
  QuickFixLine = {}, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
  Search = {}, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
  IncSearch = {}, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
  CurSearch = {}, -- 'cursearch' highlighting: highlights the current search you're on differently
  SpecialKey = {}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' textspace. |hl-Whitespace|
  SpellBad = {}, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
  SpellCap = {}, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
  SpellLocal = {}, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
  SpellRare = {}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
  StatusLine = {}, -- status line of current window
  StatusLineNC = {}, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
  TabLine = {}, -- tab pages line, not active tab page label
  TabLineFill = {}, -- tab pages line, where there are no labels
  TabLineSel = {}, -- tab pages line, active tab page label
  TermCursor = {}, -- cursor in a focused terminal
  TermCursorNC = {}, -- cursor in unfocused terminals
  Title = {}, -- titles for output from ":set all", ":autocmd" etc.
  Visual = {}, -- Visual mode selection
  VisualNOS = {}, -- Visual mode selection when vim is "Not Owning the Selection".
  WarningMsg = {}, -- warning messages
  Whitespace = {}, -- "nbsp", "space", "tab" and "trail" in 'listchars'
  WildMenu = {}, -- current match in 'wildmenu' completion
  WinBar = {},
  WinBarNC = {},
  WinSeparator = { values = { fg = C.black } },
}
