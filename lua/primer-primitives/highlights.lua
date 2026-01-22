-- Primer Primitives highlight group definitions
-- Builds highlight groups from a palette

local M = {}

--- Build highlight groups from a palette
---@param p table The palette table
---@return table groups The highlight groups table
function M.build(p)
  local groups = {}
  local blend = p.blend or 85

  -- ============================================================
  -- Editor UI
  -- ============================================================

  groups.Normal = { fg = p.fg.default, bg = p.canvas.default }
  groups.NormalFloat = { fg = p.fg.default, bg = p.canvas.overlay }
  groups.NormalNC = { fg = p.fg.default, bg = p.canvas.default }
  groups.FloatBorder = { fg = p.border.default, bg = p.canvas.overlay }
  groups.FloatTitle = { fg = p.fg.default, bg = p.canvas.overlay, bold = true }
  groups.FloatFooter = { fg = p.fg.muted, bg = p.canvas.overlay }

  -- Cursor
  groups.Cursor = { fg = p.canvas.default, bg = p.fg.default }
  groups.lCursor = { link = 'Cursor' }
  groups.CursorIM = { link = 'Cursor' }
  groups.TermCursor = { link = 'Cursor' }
  groups.TermCursorNC = { fg = p.canvas.default, bg = p.fg.muted }

  -- Line numbers
  groups.LineNr = { fg = p.fg.subtle }
  groups.LineNrAbove = { fg = p.fg.subtle }
  groups.LineNrBelow = { fg = p.fg.subtle }
  groups.CursorLineNr = { fg = p.fg.default, bold = true }
  groups.CursorLineFold = { fg = p.fg.subtle, bg = p.canvas.subtle }
  groups.CursorLineSign = { bg = p.canvas.subtle }
  groups.SignColumn = { fg = p.fg.subtle, bg = p.canvas.default }
  groups.FoldColumn = { fg = p.fg.subtle, bg = p.canvas.default }

  -- Cursor line/column
  groups.CursorLine = { bg = p.canvas.subtle }
  groups.CursorColumn = { link = 'CursorLine' }
  groups.ColorColumn = { bg = p.canvas.subtle }

  -- Visual selection
  groups.Visual = { bg = p.accent.muted, blend = blend }
  groups.VisualNOS = { link = 'Visual' }

  -- Search
  groups.Search = { fg = p.scale.black, bg = p.attention.emphasis }
  groups.IncSearch = { fg = p.canvas.default, bg = p.accent.emphasis }
  groups.CurSearch = { link = 'IncSearch' }
  groups.Substitute = { fg = p.canvas.default, bg = p.danger.emphasis }

  -- Diff
  groups.DiffAdd = { bg = p.success.muted }
  groups.DiffChange = { bg = p.attention.muted }
  groups.DiffDelete = { bg = p.danger.muted }
  groups.DiffText = { bg = p.attention.emphasis }

  -- Spelling
  groups.SpellBad = { sp = p.danger.fg, undercurl = true }
  groups.SpellCap = { sp = p.attention.fg, undercurl = true }
  groups.SpellLocal = { sp = p.accent.fg, undercurl = true }
  groups.SpellRare = { sp = p.done.fg, undercurl = true }

  -- Popup menu
  groups.Pmenu = { fg = p.fg.default, bg = p.canvas.overlay }
  groups.PmenuSel = { fg = p.fg.default, bg = p.accent.muted, blend = blend }
  groups.PmenuKind = { fg = p.fg.muted, bg = p.canvas.overlay }
  groups.PmenuKindSel = { fg = p.fg.muted, bg = p.accent.muted, blend = blend }
  groups.PmenuExtra = { fg = p.fg.subtle, bg = p.canvas.overlay }
  groups.PmenuExtraSel = { fg = p.fg.subtle, bg = p.accent.muted, blend = blend }
  groups.PmenuSbar = { bg = p.canvas.subtle }
  groups.PmenuThumb = { bg = p.border.default }
  groups.PmenuMatch = { fg = p.accent.fg, bg = p.canvas.overlay, bold = true }
  groups.PmenuMatchSel = { fg = p.accent.fg, bg = p.accent.muted, bold = true, blend = blend }

  -- Completion
  groups.ComplMatchIns = { fg = p.accent.fg, bold = true }

  -- Status line
  groups.StatusLine = { fg = p.fg.muted, bg = p.canvas.inset }
  groups.StatusLineNC = { fg = p.fg.subtle, bg = p.canvas.inset }
  groups.StatusLineTerm = { fg = p.fg.muted, bg = p.canvas.inset }
  groups.StatusLineTermNC = { fg = p.fg.subtle, bg = p.canvas.inset }

  -- Tab line
  groups.TabLine = { fg = p.fg.muted, bg = p.canvas.inset }
  groups.TabLineFill = { bg = p.canvas.inset }
  groups.TabLineSel = { fg = p.fg.default, bg = p.canvas.default }

  -- Window
  groups.WinSeparator = { fg = p.border.default }
  groups.VertSplit = { link = 'WinSeparator' }
  groups.WinBar = { fg = p.fg.default, bg = p.canvas.default, bold = true }
  groups.WinBarNC = { fg = p.fg.muted, bg = p.canvas.default }

  -- Folding
  groups.Folded = { fg = p.fg.muted, bg = p.canvas.subtle }

  -- Messages
  groups.ModeMsg = { fg = p.fg.default, bold = true }
  groups.MsgArea = { fg = p.fg.default }
  groups.MsgSeparator = { fg = p.border.default }
  groups.MoreMsg = { fg = p.success.fg, bold = true }
  groups.Question = { fg = p.accent.fg }
  groups.ErrorMsg = { fg = p.danger.fg }
  groups.WarningMsg = { fg = p.attention.fg }

  -- Misc UI
  groups.Conceal = { fg = p.fg.subtle }
  groups.Directory = { fg = p.accent.fg }
  groups.EndOfBuffer = { fg = p.fg.subtle }
  groups.MatchParen = { bg = p.accent.muted, bold = true, blend = blend }
  groups.NonText = { fg = p.fg.subtle }
  groups.SpecialKey = { fg = p.fg.subtle }
  groups.Title = { fg = p.accent.fg, bold = true }
  groups.Whitespace = { fg = p.fg.subtle }
  groups.WildMenu = { link = 'PmenuSel' }
  groups.QuickFixLine = { bg = p.accent.muted, blend = blend }
  groups.SnippetTabstop = { bg = p.accent.muted, blend = blend }

  -- ============================================================
  -- Syntax Highlighting
  -- ============================================================

  groups.Comment = { fg = p.syntax.comment, italic = true }

  groups.Constant = { fg = p.syntax.constant }
  groups.String = { fg = p.syntax.string }
  groups.Character = { fg = p.syntax.string }
  groups.Number = { fg = p.syntax.constant }
  groups.Boolean = { fg = p.syntax.constant }
  groups.Float = { fg = p.syntax.constant }

  groups.Identifier = { fg = p.fg.default }
  groups.Function = { fg = p.syntax.func }

  groups.Statement = { fg = p.syntax.keyword }
  groups.Conditional = { fg = p.syntax.keyword }
  groups.Repeat = { fg = p.syntax.keyword }
  groups.Label = { fg = p.syntax.keyword }
  groups.Operator = { fg = p.fg.default }
  groups.Keyword = { fg = p.syntax.keyword }
  groups.Exception = { fg = p.syntax.keyword }

  groups.PreProc = { fg = p.syntax.keyword }
  groups.Include = { fg = p.syntax.keyword }
  groups.Define = { fg = p.syntax.keyword }
  groups.Macro = { fg = p.syntax.constant }
  groups.PreCondit = { fg = p.syntax.keyword }

  groups.Type = { fg = p.syntax.variable }
  groups.StorageClass = { fg = p.syntax.keyword }
  groups.Structure = { fg = p.syntax.keyword }
  groups.Typedef = { fg = p.syntax.keyword }

  groups.Special = { fg = p.syntax.constant }
  groups.SpecialChar = { fg = p.syntax.string }
  groups.Tag = { fg = p.syntax.tag }
  groups.Delimiter = { fg = p.fg.default }
  groups.SpecialComment = { fg = p.syntax.comment, italic = true, bold = true }
  groups.Debug = { fg = p.attention.fg }

  groups.Underlined = { fg = p.accent.fg, underline = true }
  groups.Ignore = { fg = p.fg.subtle }
  groups.Error = { fg = p.danger.fg }
  groups.Todo = { fg = p.attention.fg, bold = true }

  -- Diff (syntax)
  groups.Added = { fg = p.success.fg }
  groups.Changed = { fg = p.attention.fg }
  groups.Removed = { fg = p.danger.fg }

  -- ============================================================
  -- Treesitter
  -- ============================================================

  -- Identifiers
  groups['@variable'] = { fg = p.fg.default }
  groups['@variable.builtin'] = { fg = p.syntax.constant }
  groups['@variable.parameter'] = { fg = p.fg.default }
  groups['@variable.parameter.builtin'] = { fg = p.syntax.constant }
  groups['@variable.member'] = { fg = p.syntax.variable }

  -- Constants
  groups['@constant'] = { link = 'Constant' }
  groups['@constant.builtin'] = { fg = p.syntax.constant }
  groups['@constant.macro'] = { link = 'Macro' }

  -- Modules
  groups['@module'] = { fg = p.syntax.variable }
  groups['@module.builtin'] = { fg = p.syntax.constant }

  -- Labels
  groups['@label'] = { link = 'Label' }

  -- Strings
  groups['@string'] = { link = 'String' }
  groups['@string.documentation'] = { fg = p.syntax.comment }
  groups['@string.regexp'] = { fg = p.syntax.string }
  groups['@string.escape'] = { fg = p.syntax.constant }
  groups['@string.special'] = { fg = p.syntax.constant }
  groups['@string.special.symbol'] = { fg = p.syntax.constant }
  groups['@string.special.path'] = { fg = p.syntax.string }
  groups['@string.special.url'] = { fg = p.accent.fg, underline = true }

  -- Characters
  groups['@character'] = { link = 'Character' }
  groups['@character.special'] = { link = 'SpecialChar' }

  -- Numbers
  groups['@boolean'] = { link = 'Boolean' }
  groups['@number'] = { link = 'Number' }
  groups['@number.float'] = { link = 'Float' }

  -- Types
  groups['@type'] = { link = 'Type' }
  groups['@type.builtin'] = { fg = p.syntax.constant }
  groups['@type.definition'] = { link = 'Type' }

  -- Attributes
  groups['@attribute'] = { fg = p.syntax.entity }
  groups['@attribute.builtin'] = { fg = p.syntax.entity }
  groups['@property'] = { fg = p.syntax.variable }

  -- Functions
  groups['@function'] = { link = 'Function' }
  groups['@function.builtin'] = { fg = p.syntax.func }
  groups['@function.call'] = { link = 'Function' }
  groups['@function.macro'] = { link = 'Macro' }
  groups['@function.method'] = { link = 'Function' }
  groups['@function.method.call'] = { link = 'Function' }

  -- Constructors
  groups['@constructor'] = { fg = p.syntax.entity }

  -- Operators
  groups['@operator'] = { link = 'Operator' }

  -- Keywords
  groups['@keyword'] = { link = 'Keyword' }
  groups['@keyword.coroutine'] = { fg = p.syntax.keyword }
  groups['@keyword.function'] = { link = 'Keyword' }
  groups['@keyword.operator'] = { link = 'Keyword' }
  groups['@keyword.import'] = { link = 'Include' }
  groups['@keyword.type'] = { link = 'Keyword' }
  groups['@keyword.modifier'] = { link = 'Keyword' }
  groups['@keyword.repeat'] = { link = 'Repeat' }
  groups['@keyword.return'] = { link = 'Keyword' }
  groups['@keyword.debug'] = { link = 'Debug' }
  groups['@keyword.exception'] = { link = 'Exception' }
  groups['@keyword.conditional'] = { link = 'Conditional' }
  groups['@keyword.conditional.ternary'] = { link = 'Operator' }
  groups['@keyword.directive'] = { link = 'PreProc' }
  groups['@keyword.directive.define'] = { link = 'Define' }

  -- Punctuation
  groups['@punctuation'] = { fg = p.fg.default }
  groups['@punctuation.bracket'] = { fg = p.fg.default }
  groups['@punctuation.delimiter'] = { fg = p.fg.default }
  groups['@punctuation.special'] = { fg = p.syntax.keyword }

  -- Comments
  groups['@comment'] = { link = 'Comment' }
  groups['@comment.documentation'] = { fg = p.syntax.comment }
  groups['@comment.error'] = { fg = p.danger.fg, bold = true }
  groups['@comment.warning'] = { fg = p.attention.fg, bold = true }
  groups['@comment.todo'] = { fg = p.attention.fg, bold = true }
  groups['@comment.note'] = { fg = p.accent.fg, bold = true }

  -- Markup
  groups['@markup.strong'] = { fg = p.fg.default, bold = true }
  groups['@markup.italic'] = { fg = p.fg.default, italic = true }
  groups['@markup.strikethrough'] = { fg = p.fg.default, strikethrough = true }
  groups['@markup.underline'] = { underline = true }
  groups['@markup.heading'] = { link = 'Title' }
  groups['@markup.heading.1'] = { fg = p.accent.fg, bold = true }
  groups['@markup.heading.2'] = { fg = p.accent.fg, bold = true }
  groups['@markup.heading.3'] = { fg = p.accent.fg, bold = true }
  groups['@markup.heading.4'] = { fg = p.accent.fg, bold = true }
  groups['@markup.heading.5'] = { fg = p.accent.fg, bold = true }
  groups['@markup.heading.6'] = { fg = p.accent.fg, bold = true }
  groups['@markup.quote'] = { fg = p.fg.muted, italic = true }
  groups['@markup.math'] = { fg = p.syntax.constant }
  groups['@markup.link'] = { fg = p.accent.fg }
  groups['@markup.link.label'] = { fg = p.accent.fg }
  groups['@markup.link.url'] = { fg = p.accent.fg, underline = true }
  groups['@markup.raw'] = { fg = p.syntax.string }
  groups['@markup.raw.block'] = { fg = p.syntax.string }
  groups['@markup.list'] = { fg = p.fg.default }
  groups['@markup.list.checked'] = { fg = p.success.fg }
  groups['@markup.list.unchecked'] = { fg = p.fg.muted }

  -- Diff
  groups['@diff.plus'] = { fg = p.success.fg }
  groups['@diff.minus'] = { fg = p.danger.fg }
  groups['@diff.delta'] = { fg = p.attention.fg }

  -- Tags
  groups['@tag'] = { link = 'Tag' }
  groups['@tag.builtin'] = { link = 'Tag' }
  groups['@tag.attribute'] = { fg = p.syntax.variable }
  groups['@tag.delimiter'] = { fg = p.fg.default }

  -- Legacy Treesitter captures (for backwards compatibility)
  groups['@text'] = { fg = p.fg.default }
  groups['@text.literal'] = { link = 'String' }
  groups['@text.reference'] = { fg = p.accent.fg }
  groups['@text.title'] = { link = 'Title' }
  groups['@text.uri'] = { fg = p.accent.fg, underline = true }
  groups['@text.underline'] = { underline = true }
  groups['@text.todo'] = { link = 'Todo' }
  groups['@define'] = { link = 'Define' }
  groups['@macro'] = { link = 'Macro' }
  groups['@string.regex'] = { fg = p.syntax.string }
  groups['@parameter'] = { fg = p.fg.default }
  groups['@method'] = { link = 'Function' }
  groups['@method.call'] = { link = 'Function' }
  groups['@field'] = { fg = p.syntax.variable }
  groups['@conditional'] = { link = 'Conditional' }
  groups['@repeat'] = { link = 'Repeat' }
  groups['@exception'] = { link = 'Exception' }
  groups['@type.qualifier'] = { link = 'Keyword' }
  groups['@storageclass'] = { link = 'StorageClass' }
  groups['@structure'] = { link = 'Structure' }
  groups['@namespace'] = { fg = p.syntax.variable }
  groups['@include'] = { link = 'Include' }
  groups['@preproc'] = { link = 'PreProc' }
  groups['@debug'] = { link = 'Debug' }
  groups['@error'] = { link = 'Error' }
  groups['@warning'] = { fg = p.attention.fg }
  groups['@info'] = { fg = p.accent.fg }
  groups['@hint'] = { fg = p.success.fg }
  groups['@float'] = { link = 'Float' }

  -- ============================================================
  -- LSP Semantic Tokens
  -- ============================================================

  -- Types
  groups['@lsp.type.class'] = { fg = p.syntax.entity }
  groups['@lsp.type.comment'] = { link = 'Comment' }
  groups['@lsp.type.decorator'] = { fg = p.syntax.entity }
  groups['@lsp.type.enum'] = { fg = p.syntax.entity }
  groups['@lsp.type.enumMember'] = { fg = p.syntax.constant }
  groups['@lsp.type.event'] = { fg = p.syntax.entity }
  groups['@lsp.type.function'] = { link = 'Function' }
  groups['@lsp.type.interface'] = { fg = p.syntax.entity }
  groups['@lsp.type.keyword'] = { link = 'Keyword' }
  groups['@lsp.type.macro'] = { link = 'Macro' }
  groups['@lsp.type.method'] = { link = 'Function' }
  groups['@lsp.type.modifier'] = { link = 'Keyword' }
  groups['@lsp.type.namespace'] = { fg = p.syntax.variable }
  groups['@lsp.type.number'] = { link = 'Number' }
  groups['@lsp.type.operator'] = { link = 'Operator' }
  groups['@lsp.type.parameter'] = { fg = p.fg.default }
  groups['@lsp.type.property'] = { fg = p.syntax.variable }
  groups['@lsp.type.regexp'] = { fg = p.syntax.string }
  groups['@lsp.type.string'] = { link = 'String' }
  groups['@lsp.type.struct'] = { fg = p.syntax.entity }
  groups['@lsp.type.type'] = { link = 'Type' }
  groups['@lsp.type.typeParameter'] = { fg = p.syntax.variable }
  groups['@lsp.type.variable'] = { fg = p.fg.default }

  -- Modifiers
  groups['@lsp.mod.abstract'] = { italic = true }
  groups['@lsp.mod.async'] = { italic = true }
  groups['@lsp.mod.declaration'] = {}
  groups['@lsp.mod.defaultLibrary'] = { fg = p.syntax.constant }
  groups['@lsp.mod.definition'] = {}
  groups['@lsp.mod.deprecated'] = { strikethrough = true }
  groups['@lsp.mod.documentation'] = { fg = p.syntax.comment }
  groups['@lsp.mod.modification'] = {}
  groups['@lsp.mod.readonly'] = { fg = p.syntax.constant }
  groups['@lsp.mod.static'] = { italic = true }

  -- ============================================================
  -- LSP Highlights
  -- ============================================================

  groups.LspReferenceText = { bg = p.accent.muted, blend = blend }
  groups.LspReferenceRead = { bg = p.accent.muted, blend = blend }
  groups.LspReferenceWrite = { bg = p.accent.muted, blend = blend }
  groups.LspReferenceTarget = { bg = p.accent.muted, blend = blend }
  groups.LspCodeLens = { fg = p.fg.subtle }
  groups.LspCodeLensSeparator = { fg = p.fg.subtle }
  groups.LspSignatureActiveParameter = { fg = p.accent.fg, bold = true, underline = true }
  groups.LspInlayHint = { fg = p.fg.subtle, bg = p.canvas.subtle }

  -- ============================================================
  -- Diagnostics
  -- ============================================================

  groups.DiagnosticError = { fg = p.danger.fg }
  groups.DiagnosticWarn = { fg = p.attention.fg }
  groups.DiagnosticInfo = { fg = p.accent.fg }
  groups.DiagnosticHint = { fg = p.success.fg }
  groups.DiagnosticOk = { fg = p.success.fg }

  groups.DiagnosticVirtualTextError = { fg = p.danger.fg, bg = p.danger.muted }
  groups.DiagnosticVirtualTextWarn = { fg = p.attention.fg, bg = p.attention.muted }
  groups.DiagnosticVirtualTextInfo = { fg = p.accent.fg, bg = p.accent.muted, blend = blend }
  groups.DiagnosticVirtualTextHint = { fg = p.success.fg, bg = p.success.muted }
  groups.DiagnosticVirtualTextOk = { fg = p.success.fg, bg = p.success.muted }

  groups.DiagnosticUnderlineError = { sp = p.danger.fg, undercurl = true }
  groups.DiagnosticUnderlineWarn = { sp = p.attention.fg, undercurl = true }
  groups.DiagnosticUnderlineInfo = { sp = p.accent.fg, undercurl = true }
  groups.DiagnosticUnderlineHint = { sp = p.success.fg, undercurl = true }
  groups.DiagnosticUnderlineOk = { sp = p.success.fg, undercurl = true }

  groups.DiagnosticFloatingError = { fg = p.danger.fg }
  groups.DiagnosticFloatingWarn = { fg = p.attention.fg }
  groups.DiagnosticFloatingInfo = { fg = p.accent.fg }
  groups.DiagnosticFloatingHint = { fg = p.success.fg }
  groups.DiagnosticFloatingOk = { fg = p.success.fg }

  groups.DiagnosticSignError = { fg = p.danger.fg }
  groups.DiagnosticSignWarn = { fg = p.attention.fg }
  groups.DiagnosticSignInfo = { fg = p.accent.fg }
  groups.DiagnosticSignHint = { fg = p.success.fg }
  groups.DiagnosticSignOk = { fg = p.success.fg }

  groups.DiagnosticDeprecated = { strikethrough = true, sp = p.danger.fg }
  groups.DiagnosticUnnecessary = { fg = p.fg.subtle }

  -- ============================================================
  -- Git Signs
  -- ============================================================

  groups.GitSignsAdd = { fg = p.success.fg }
  groups.GitSignsChange = { fg = p.attention.fg }
  groups.GitSignsDelete = { fg = p.danger.fg }
  groups.GitSignsAddNr = { fg = p.success.fg }
  groups.GitSignsChangeNr = { fg = p.attention.fg }
  groups.GitSignsDeleteNr = { fg = p.danger.fg }
  groups.GitSignsAddLn = { bg = p.success.muted }
  groups.GitSignsChangeLn = { bg = p.attention.muted }
  groups.GitSignsDeleteLn = { bg = p.danger.muted }

  -- ============================================================
  -- Telescope
  -- ============================================================

  groups.TelescopeNormal = { link = 'NormalFloat' }
  groups.TelescopeBorder = { link = 'FloatBorder' }
  groups.TelescopeTitle = { link = 'FloatTitle' }
  groups.TelescopePromptNormal = { fg = p.fg.default, bg = p.canvas.overlay }
  groups.TelescopePromptBorder = { fg = p.border.default, bg = p.canvas.overlay }
  groups.TelescopePromptTitle = { fg = p.fg.default, bg = p.canvas.overlay, bold = true }
  groups.TelescopePromptPrefix = { fg = p.accent.fg }
  groups.TelescopeResultsNormal = { fg = p.fg.default, bg = p.canvas.overlay }
  groups.TelescopeResultsBorder = { fg = p.border.default, bg = p.canvas.overlay }
  groups.TelescopeResultsTitle = { fg = p.fg.default, bg = p.canvas.overlay }
  groups.TelescopePreviewNormal = { fg = p.fg.default, bg = p.canvas.overlay }
  groups.TelescopePreviewBorder = { fg = p.border.default, bg = p.canvas.overlay }
  groups.TelescopePreviewTitle = { fg = p.fg.default, bg = p.canvas.overlay }
  groups.TelescopeSelection = { link = 'PmenuSel' }
  groups.TelescopeSelectionCaret = { fg = p.accent.fg }
  groups.TelescopeMultiSelection = { fg = p.fg.default, bg = p.accent.muted, blend = blend }
  groups.TelescopeMatching = { fg = p.accent.fg, bold = true }

  -- ============================================================
  -- nvim-cmp
  -- ============================================================

  groups.CmpItemAbbr = { fg = p.fg.default }
  groups.CmpItemAbbrDeprecated = { fg = p.fg.subtle, strikethrough = true }
  groups.CmpItemAbbrMatch = { fg = p.accent.fg, bold = true }
  groups.CmpItemAbbrMatchFuzzy = { fg = p.accent.fg }
  groups.CmpItemMenu = { fg = p.fg.muted }
  groups.CmpItemKind = { fg = p.fg.muted }
  groups.CmpItemKindDefault = { fg = p.fg.muted }
  groups.CmpItemKindKeyword = { fg = p.syntax.keyword }
  groups.CmpItemKindVariable = { fg = p.syntax.variable }
  groups.CmpItemKindConstant = { fg = p.syntax.constant }
  groups.CmpItemKindReference = { fg = p.syntax.variable }
  groups.CmpItemKindValue = { fg = p.syntax.constant }
  groups.CmpItemKindFunction = { fg = p.syntax.func }
  groups.CmpItemKindMethod = { fg = p.syntax.func }
  groups.CmpItemKindConstructor = { fg = p.syntax.entity }
  groups.CmpItemKindClass = { fg = p.syntax.entity }
  groups.CmpItemKindInterface = { fg = p.syntax.entity }
  groups.CmpItemKindStruct = { fg = p.syntax.entity }
  groups.CmpItemKindEvent = { fg = p.syntax.entity }
  groups.CmpItemKindEnum = { fg = p.syntax.entity }
  groups.CmpItemKindUnit = { fg = p.syntax.constant }
  groups.CmpItemKindModule = { fg = p.syntax.variable }
  groups.CmpItemKindProperty = { fg = p.syntax.variable }
  groups.CmpItemKindField = { fg = p.syntax.variable }
  groups.CmpItemKindTypeParameter = { fg = p.syntax.variable }
  groups.CmpItemKindEnumMember = { fg = p.syntax.constant }
  groups.CmpItemKindOperator = { fg = p.fg.default }
  groups.CmpItemKindSnippet = { fg = p.done.fg }
  groups.CmpItemKindText = { fg = p.fg.default }
  groups.CmpItemKindFile = { fg = p.fg.default }
  groups.CmpItemKindFolder = { fg = p.accent.fg }
  groups.CmpItemKindColor = { fg = p.syntax.constant }

  -- ============================================================
  -- Indent Blankline
  -- ============================================================

  groups.IndentBlanklineChar = { fg = p.border.muted }
  groups.IndentBlanklineContextChar = { fg = p.border.default }
  groups.IndentBlanklineContextStart = { sp = p.border.default, underline = true }
  groups.IndentBlanklineSpaceChar = { fg = p.border.muted }
  groups.IndentBlanklineSpaceCharBlankline = { fg = p.border.muted }

  groups.IblIndent = { fg = p.border.muted }
  groups.IblScope = { fg = p.border.default }
  groups.IblWhitespace = { fg = p.border.muted }

  -- ============================================================
  -- nvim-tree
  -- ============================================================

  groups.NvimTreeNormal = { fg = p.fg.default, bg = p.canvas.inset }
  groups.NvimTreeEndOfBuffer = { fg = p.canvas.inset }
  groups.NvimTreeRootFolder = { fg = p.fg.muted, bold = true }
  groups.NvimTreeGitDirty = { fg = p.attention.fg }
  groups.NvimTreeGitNew = { fg = p.success.fg }
  groups.NvimTreeGitDeleted = { fg = p.danger.fg }
  groups.NvimTreeSpecialFile = { fg = p.accent.fg }
  groups.NvimTreeIndentMarker = { fg = p.border.muted }
  groups.NvimTreeImageFile = { fg = p.fg.default }
  groups.NvimTreeSymlink = { fg = p.accent.fg }
  groups.NvimTreeFolderIcon = { fg = p.accent.fg }
  groups.NvimTreeFolderName = { fg = p.fg.default }
  groups.NvimTreeOpenedFolderName = { fg = p.fg.default }
  groups.NvimTreeEmptyFolderName = { fg = p.fg.muted }

  -- ============================================================
  -- Neo-tree
  -- ============================================================

  groups.NeoTreeNormal = { fg = p.fg.default, bg = p.canvas.inset }
  groups.NeoTreeNormalNC = { fg = p.fg.default, bg = p.canvas.inset }
  groups.NeoTreeEndOfBuffer = { fg = p.canvas.inset }
  groups.NeoTreeRootName = { fg = p.fg.muted, bold = true }
  groups.NeoTreeGitAdded = { fg = p.success.fg }
  groups.NeoTreeGitConflict = { fg = p.danger.fg }
  groups.NeoTreeGitDeleted = { fg = p.danger.fg }
  groups.NeoTreeGitIgnored = { fg = p.fg.subtle }
  groups.NeoTreeGitModified = { fg = p.attention.fg }
  groups.NeoTreeGitUnstaged = { fg = p.attention.fg }
  groups.NeoTreeGitUntracked = { fg = p.success.fg }
  groups.NeoTreeGitStaged = { fg = p.success.fg }
  groups.NeoTreeIndentMarker = { fg = p.border.muted }
  groups.NeoTreeDirectoryIcon = { fg = p.accent.fg }
  groups.NeoTreeDirectoryName = { fg = p.fg.default }
  groups.NeoTreeFileName = { fg = p.fg.default }
  groups.NeoTreeFileIcon = { fg = p.fg.default }

  -- ============================================================
  -- Lazy.nvim
  -- ============================================================

  groups.LazyNormal = { link = 'NormalFloat' }
  groups.LazyButton = { fg = p.fg.default, bg = p.canvas.subtle }
  groups.LazyButtonActive = { fg = p.fg.on_emphasis, bg = p.accent.emphasis }
  groups.LazyH1 = { fg = p.fg.on_emphasis, bg = p.accent.emphasis, bold = true }
  groups.LazyH2 = { fg = p.accent.fg, bold = true }
  groups.LazySpecial = { fg = p.accent.fg }
  groups.LazyCommit = { fg = p.fg.muted }
  groups.LazyCommitType = { fg = p.success.fg }
  groups.LazyReasonPlugin = { fg = p.done.fg }
  groups.LazyReasonEvent = { fg = p.attention.fg }
  groups.LazyReasonCmd = { fg = p.accent.fg }
  groups.LazyReasonFt = { fg = p.success.fg }
  groups.LazyReasonKeys = { fg = p.done.fg }
  groups.LazyReasonStart = { fg = p.danger.fg }

  -- ============================================================
  -- Which-key
  -- ============================================================

  groups.WhichKey = { fg = p.accent.fg }
  groups.WhichKeyGroup = { fg = p.done.fg }
  groups.WhichKeyDesc = { fg = p.fg.default }
  groups.WhichKeySeparator = { fg = p.fg.subtle }
  groups.WhichKeyFloat = { link = 'NormalFloat' }
  groups.WhichKeyBorder = { link = 'FloatBorder' }
  groups.WhichKeyValue = { fg = p.fg.muted }

  -- ============================================================
  -- fzf-lua
  -- ============================================================

  -- Main window
  groups.FzfLuaNormal = { link = 'NormalFloat' }
  groups.FzfLuaBorder = { link = 'FloatBorder' }
  groups.FzfLuaTitle = { link = 'FloatTitle' }
  groups.FzfLuaTitleFlags = { fg = p.accent.fg, bold = true }
  groups.FzfLuaBackdrop = { bg = p.scale.black }

  -- Preview window
  groups.FzfLuaPreviewNormal = { link = 'NormalFloat' }
  groups.FzfLuaPreviewBorder = { link = 'FloatBorder' }
  groups.FzfLuaPreviewTitle = { link = 'FloatTitle' }
  groups.FzfLuaCursor = { link = 'Cursor' }
  groups.FzfLuaCursorLine = { link = 'CursorLine' }
  groups.FzfLuaCursorLineNr = { link = 'CursorLineNr' }
  groups.FzfLuaSearch = { link = 'IncSearch' }
  groups.FzfLuaScrollBorderEmpty = { fg = p.border.muted }
  groups.FzfLuaScrollBorderFull = { fg = p.accent.fg }
  groups.FzfLuaScrollFloatEmpty = { fg = p.border.muted }
  groups.FzfLuaScrollFloatFull = { fg = p.accent.fg }

  -- Help window
  groups.FzfLuaHelpNormal = { link = 'NormalFloat' }
  groups.FzfLuaHelpBorder = { link = 'FloatBorder' }
  groups.FzfLuaHeaderBind = { fg = p.accent.fg }
  groups.FzfLuaHeaderText = { fg = p.fg.muted }

  -- Content highlights
  groups.FzfLuaPathColNr = { fg = p.success.fg }
  groups.FzfLuaPathLineNr = { fg = p.attention.fg }
  groups.FzfLuaBufName = { fg = p.fg.muted }
  groups.FzfLuaBufId = { fg = p.fg.subtle }
  groups.FzfLuaBufNr = { fg = p.accent.fg }
  groups.FzfLuaBufLineNr = { fg = p.attention.fg }
  groups.FzfLuaBufFlagCur = { fg = p.accent.fg }
  groups.FzfLuaBufFlagAlt = { fg = p.done.fg }
  groups.FzfLuaTabTitle = { fg = p.fg.default, bold = true }
  groups.FzfLuaTabMarker = { fg = p.accent.fg }
  groups.FzfLuaDirIcon = { fg = p.accent.fg }
  groups.FzfLuaDirPart = { fg = p.fg.muted }
  groups.FzfLuaFilePart = { fg = p.fg.default }
  groups.FzfLuaLivePrompt = { fg = p.danger.fg, bold = true }
  groups.FzfLuaLiveSym = { fg = p.danger.fg }

  -- Fzf colors (inside fzf window)
  groups.FzfLuaFzfNormal = { fg = p.fg.default }
  groups.FzfLuaFzfCursorLine = { bg = p.accent.muted, blend = blend }
  groups.FzfLuaFzfMatch = { fg = p.accent.fg, bold = true }
  groups.FzfLuaFzfBorder = { fg = p.border.default }
  groups.FzfLuaFzfScrollbar = { fg = p.accent.fg }
  groups.FzfLuaFzfSeparator = { fg = p.border.default }
  groups.FzfLuaFzfGutter = { bg = p.canvas.overlay }
  groups.FzfLuaFzfHeader = { fg = p.fg.muted }
  groups.FzfLuaFzfInfo = { fg = p.fg.subtle }
  groups.FzfLuaFzfPointer = { fg = p.accent.fg }
  groups.FzfLuaFzfMarker = { fg = p.success.fg }
  groups.FzfLuaFzfSpinner = { fg = p.accent.fg }
  groups.FzfLuaFzfPrompt = { fg = p.accent.fg }
  groups.FzfLuaFzfQuery = { fg = p.fg.default }

  -- ============================================================
  -- blink.cmp
  -- ============================================================

  groups.BlinkCmpMenu = { link = 'Pmenu' }
  groups.BlinkCmpMenuBorder = { link = 'FloatBorder' }
  groups.BlinkCmpMenuSelection = { link = 'PmenuSel' }
  groups.BlinkCmpScrollBarThumb = { link = 'PmenuThumb' }
  groups.BlinkCmpScrollBarGutter = { link = 'PmenuSbar' }
  groups.BlinkCmpLabel = { fg = p.fg.default }
  groups.BlinkCmpLabelDeprecated = { fg = p.fg.subtle, strikethrough = true }
  groups.BlinkCmpLabelMatch = { fg = p.accent.fg, bold = true }
  groups.BlinkCmpLabelDetail = { fg = p.fg.muted }
  groups.BlinkCmpLabelDescription = { fg = p.fg.muted }
  groups.BlinkCmpKind = { fg = p.fg.muted }
  groups.BlinkCmpSource = { fg = p.fg.subtle }
  groups.BlinkCmpGhostText = { fg = p.fg.subtle }
  groups.BlinkCmpDoc = { link = 'NormalFloat' }
  groups.BlinkCmpDocBorder = { link = 'FloatBorder' }
  groups.BlinkCmpDocSeparator = { fg = p.border.default }
  groups.BlinkCmpDocCursorLine = { link = 'Visual' }
  groups.BlinkCmpSignatureHelp = { link = 'NormalFloat' }
  groups.BlinkCmpSignatureHelpBorder = { link = 'FloatBorder' }
  groups.BlinkCmpSignatureHelpActiveParameter = { link = 'LspSignatureActiveParameter' }

  -- blink.cmp kind highlights (matching nvim-cmp style)
  groups.BlinkCmpKindText = { fg = p.fg.default }
  groups.BlinkCmpKindMethod = { fg = p.syntax.func }
  groups.BlinkCmpKindFunction = { fg = p.syntax.func }
  groups.BlinkCmpKindConstructor = { fg = p.syntax.entity }
  groups.BlinkCmpKindField = { fg = p.syntax.variable }
  groups.BlinkCmpKindVariable = { fg = p.syntax.variable }
  groups.BlinkCmpKindClass = { fg = p.syntax.entity }
  groups.BlinkCmpKindInterface = { fg = p.syntax.entity }
  groups.BlinkCmpKindModule = { fg = p.syntax.variable }
  groups.BlinkCmpKindProperty = { fg = p.syntax.variable }
  groups.BlinkCmpKindUnit = { fg = p.syntax.constant }
  groups.BlinkCmpKindValue = { fg = p.syntax.constant }
  groups.BlinkCmpKindEnum = { fg = p.syntax.entity }
  groups.BlinkCmpKindKeyword = { fg = p.syntax.keyword }
  groups.BlinkCmpKindSnippet = { fg = p.done.fg }
  groups.BlinkCmpKindColor = { fg = p.syntax.constant }
  groups.BlinkCmpKindFile = { fg = p.fg.default }
  groups.BlinkCmpKindReference = { fg = p.syntax.variable }
  groups.BlinkCmpKindFolder = { fg = p.accent.fg }
  groups.BlinkCmpKindEnumMember = { fg = p.syntax.constant }
  groups.BlinkCmpKindConstant = { fg = p.syntax.constant }
  groups.BlinkCmpKindStruct = { fg = p.syntax.entity }
  groups.BlinkCmpKindEvent = { fg = p.syntax.entity }
  groups.BlinkCmpKindOperator = { fg = p.fg.default }
  groups.BlinkCmpKindTypeParameter = { fg = p.syntax.variable }

  -- ============================================================
  -- snacks.nvim
  -- ============================================================

  -- Dashboard
  groups.SnacksDashboardNormal = { fg = p.fg.default, bg = p.canvas.default }
  groups.SnacksDashboardDesc = { fg = p.fg.muted }
  groups.SnacksDashboardFile = { fg = p.accent.fg }
  groups.SnacksDashboardDir = { fg = p.fg.subtle }
  groups.SnacksDashboardFooter = { fg = p.fg.muted }
  groups.SnacksDashboardHeader = { fg = p.accent.fg }
  groups.SnacksDashboardIcon = { fg = p.accent.fg }
  groups.SnacksDashboardKey = { fg = p.attention.fg }
  groups.SnacksDashboardSpecial = { fg = p.done.fg }
  groups.SnacksDashboardTitle = { fg = p.accent.fg, bold = true }

  -- Notifier
  groups.SnacksNotifierHistory = { link = 'NormalFloat' }
  groups.SnacksNotifierHistoryTitle = { link = 'FloatTitle' }
  groups.SnacksNotifierHistoryDateTime = { fg = p.fg.subtle }
  groups.SnacksNotifierMinimal = { link = 'NormalFloat' }

  -- Notifier levels
  groups.SnacksNotifierInfo = { fg = p.fg.default, bg = p.canvas.overlay }
  groups.SnacksNotifierIconInfo = { fg = p.accent.fg }
  groups.SnacksNotifierBorderInfo = { fg = p.accent.fg }
  groups.SnacksNotifierTitleInfo = { fg = p.accent.fg }
  groups.SnacksNotifierFooterInfo = { fg = p.fg.muted }

  groups.SnacksNotifierWarn = { fg = p.fg.default, bg = p.canvas.overlay }
  groups.SnacksNotifierIconWarn = { fg = p.attention.fg }
  groups.SnacksNotifierBorderWarn = { fg = p.attention.fg }
  groups.SnacksNotifierTitleWarn = { fg = p.attention.fg }
  groups.SnacksNotifierFooterWarn = { fg = p.fg.muted }

  groups.SnacksNotifierError = { fg = p.fg.default, bg = p.canvas.overlay }
  groups.SnacksNotifierIconError = { fg = p.danger.fg }
  groups.SnacksNotifierBorderError = { fg = p.danger.fg }
  groups.SnacksNotifierTitleError = { fg = p.danger.fg }
  groups.SnacksNotifierFooterError = { fg = p.fg.muted }

  groups.SnacksNotifierDebug = { fg = p.fg.default, bg = p.canvas.overlay }
  groups.SnacksNotifierIconDebug = { fg = p.fg.subtle }
  groups.SnacksNotifierBorderDebug = { fg = p.border.default }
  groups.SnacksNotifierTitleDebug = { fg = p.fg.muted }
  groups.SnacksNotifierFooterDebug = { fg = p.fg.muted }

  groups.SnacksNotifierTrace = { fg = p.fg.default, bg = p.canvas.overlay }
  groups.SnacksNotifierIconTrace = { fg = p.fg.subtle }
  groups.SnacksNotifierBorderTrace = { fg = p.border.default }
  groups.SnacksNotifierTitleTrace = { fg = p.fg.muted }
  groups.SnacksNotifierFooterTrace = { fg = p.fg.muted }

  -- Indent
  groups.SnacksIndent = { fg = p.border.muted }
  groups.SnacksIndentScope = { fg = p.border.default }

  -- ============================================================
  -- sidekick.nvim
  -- ============================================================

  -- Diff display
  groups.SidekickDiffContext = { bg = p.attention.muted }
  groups.SidekickDiffAdd = { bg = p.success.muted }
  groups.SidekickDiffDelete = { bg = p.danger.muted }

  -- UI elements
  groups.SidekickSign = { fg = p.done.fg }
  groups.SidekickChat = { fg = p.fg.default, bg = p.canvas.overlay }

  -- CLI status
  groups.SidekickCliMissing = { fg = p.danger.fg }
  groups.SidekickCliAttached = { fg = p.done.fg }
  groups.SidekickCliStarted = { fg = p.attention.fg }
  groups.SidekickCliInstalled = { fg = p.success.fg }
  groups.SidekickCliUnavailable = { fg = p.danger.fg }

  -- Location display
  groups.SidekickLocDelim = { fg = p.fg.subtle }
  groups.SidekickLocFile = { fg = p.accent.fg, underline = true }
  groups.SidekickLocNum = { fg = p.syntax.variable }
  groups.SidekickLocRow = { link = 'SidekickLocDelim' }
  groups.SidekickLocCol = { link = 'SidekickLocDelim' }

  -- ============================================================
  -- aerial.nvim
  -- ============================================================

  groups.AerialNormal = { fg = p.fg.default }
  groups.AerialLine = { bg = p.accent.muted, blend = blend }
  groups.AerialLineNC = { link = 'AerialLine' }
  groups.AerialGuide = { fg = p.border.muted }
  groups.AerialPrivate = { fg = p.fg.muted }
  groups.AerialProtected = { fg = p.fg.muted }

  -- Aerial symbol icons
  groups.AerialArrayIcon = { fg = p.syntax.variable }
  groups.AerialBooleanIcon = { fg = p.syntax.constant }
  groups.AerialClassIcon = { fg = p.syntax.entity }
  groups.AerialConstantIcon = { fg = p.syntax.constant }
  groups.AerialConstructorIcon = { fg = p.syntax.entity }
  groups.AerialEnumIcon = { fg = p.syntax.entity }
  groups.AerialEnumMemberIcon = { fg = p.syntax.constant }
  groups.AerialEventIcon = { fg = p.syntax.variable }
  groups.AerialFieldIcon = { fg = p.syntax.variable }
  groups.AerialFileIcon = { fg = p.fg.default }
  groups.AerialFunctionIcon = { fg = p.syntax.func }
  groups.AerialInterfaceIcon = { fg = p.syntax.entity }
  groups.AerialKeyIcon = { fg = p.syntax.keyword }
  groups.AerialMethodIcon = { fg = p.syntax.func }
  groups.AerialModuleIcon = { fg = p.syntax.keyword }
  groups.AerialNamespaceIcon = { fg = p.syntax.keyword }
  groups.AerialNullIcon = { fg = p.syntax.constant }
  groups.AerialNumberIcon = { fg = p.syntax.constant }
  groups.AerialObjectIcon = { fg = p.syntax.entity }
  groups.AerialOperatorIcon = { fg = p.fg.default }
  groups.AerialPackageIcon = { fg = p.syntax.keyword }
  groups.AerialPropertyIcon = { fg = p.syntax.variable }
  groups.AerialStringIcon = { fg = p.syntax.string }
  groups.AerialStructIcon = { fg = p.syntax.entity }
  groups.AerialTypeParameterIcon = { fg = p.syntax.variable }
  groups.AerialVariableIcon = { fg = p.syntax.variable }

  -- ============================================================
  -- flash.nvim
  -- ============================================================

  groups.FlashBackdrop = { fg = p.fg.subtle }
  groups.FlashMatch = { fg = p.fg.default, bg = p.accent.muted, blend = blend }
  groups.FlashCurrent = { fg = p.canvas.default, bg = p.accent.emphasis }
  groups.FlashLabel = { fg = p.fg.on_emphasis, bg = p.danger.emphasis, bold = true }
  groups.FlashPrompt = { link = 'MsgArea' }
  groups.FlashPromptIcon = { fg = p.accent.fg }
  groups.FlashCursor = { link = 'Cursor' }

  -- ============================================================
  -- grug-far.nvim
  -- ============================================================

  -- Help window
  groups.GrugFarHelpHeader = { fg = p.accent.fg, bold = true }
  groups.GrugFarHelpHeaderKey = { fg = p.attention.fg, bold = true }
  groups.GrugFarHelpWinHeader = { fg = p.accent.fg, bold = true }
  groups.GrugFarHelpWinActionPrefix = { fg = p.done.fg }
  groups.GrugFarHelpWinActionText = { fg = p.fg.default }
  groups.GrugFarHelpWinActionKey = { fg = p.attention.fg }
  groups.GrugFarHelpWinActionDescription = { fg = p.fg.muted }

  -- Input
  groups.GrugFarInputLabel = { fg = p.accent.fg, bold = true }
  groups.GrugFarInputPlaceholder = { fg = p.fg.subtle }

  -- Results header
  groups.GrugFarResultsHeader = { fg = p.accent.fg, bold = true }
  groups.GrugFarResultsStats = { fg = p.fg.muted }
  groups.GrugFarResultsActionMessage = { fg = p.success.fg }

  -- Match highlights
  groups.GrugFarResultsMatch = { fg = p.fg.on_emphasis, bg = p.attention.emphasis }
  groups.GrugFarResultsMatchAdded = { fg = p.fg.on_emphasis, bg = p.success.emphasis }
  groups.GrugFarResultsMatchRemoved = { fg = p.fg.on_emphasis, bg = p.danger.emphasis }
  groups.GrugFarResultsPath = { fg = p.accent.fg, underline = true }

  -- Line numbers
  groups.GrugFarResultsLineNr = { fg = p.fg.subtle }
  groups.GrugFarResultsCursorLineNo = { fg = p.fg.default, bold = true }
  groups.GrugFarResultsColumnNr = { fg = p.fg.subtle }
  groups.GrugFarResultsNumbersSeparator = { fg = p.fg.subtle }

  -- Indicators
  groups.GrugFarResultsChangeIndicator = { fg = p.attention.fg }
  groups.GrugFarResultsRemoveIndicator = { fg = p.danger.fg }
  groups.GrugFarResultsAddIndicator = { fg = p.success.fg }
  groups.GrugFarResultsDiffSeparatorIndicator = { fg = p.border.default }
  groups.GrugFarResultsCmdHeader = { fg = p.fg.muted }
  groups.GrugFarResultsNumberLabel = { fg = p.done.fg }
  groups.GrugFarResultsLongLineStr = { fg = p.fg.subtle }
  groups.GrugFarVisualBufrange = { bg = p.accent.muted, blend = blend }

  -- ============================================================
  -- mason.nvim
  -- ============================================================

  groups.MasonNormal = { fg = p.fg.default, bg = p.canvas.overlay }
  groups.MasonHeader = { fg = p.canvas.default, bg = p.accent.emphasis, bold = true }
  groups.MasonHeaderSecondary = { fg = p.canvas.default, bg = p.success.emphasis, bold = true }
  groups.MasonHighlight = { fg = p.accent.fg }
  groups.MasonHighlightBlock = { fg = p.canvas.default, bg = p.accent.emphasis }
  groups.MasonHighlightBlockBold = { fg = p.canvas.default, bg = p.accent.emphasis, bold = true }
  groups.MasonHighlightSecondary = { fg = p.success.fg }
  groups.MasonHighlightBlockSecondary = { fg = p.canvas.default, bg = p.success.emphasis }
  groups.MasonHighlightBlockBoldSecondary = { fg = p.canvas.default, bg = p.success.emphasis, bold = true }
  groups.MasonLink = { fg = p.accent.fg, underline = true }
  groups.MasonMuted = { fg = p.fg.muted }
  groups.MasonMutedBlock = { fg = p.fg.default, bg = p.canvas.subtle }
  groups.MasonMutedBlockBold = { fg = p.fg.default, bg = p.canvas.subtle, bold = true }
  groups.MasonError = { fg = p.danger.fg }
  groups.MasonWarning = { fg = p.attention.fg }
  groups.MasonHeading = { fg = p.fg.default, bold = true }

  -- ============================================================
  -- noice.nvim
  -- ============================================================

  -- Cmdline
  groups.NoiceCmdline = { fg = p.fg.default }
  groups.NoiceCmdlineIcon = { fg = p.accent.fg }
  groups.NoiceCmdlineIconSearch = { fg = p.attention.fg }
  groups.NoiceCmdlinePrompt = { fg = p.accent.fg, bold = true }
  groups.NoiceCmdlinePopup = { fg = p.fg.default, bg = p.canvas.overlay }
  groups.NoiceCmdlinePopupBorder = { fg = p.accent.fg, bg = p.canvas.overlay }
  groups.NoiceCmdlinePopupTitle = { fg = p.accent.fg }
  groups.NoiceCmdlinePopupBorderSearch = { fg = p.attention.fg, bg = p.canvas.overlay }

  -- Confirm
  groups.NoiceConfirm = { fg = p.fg.default, bg = p.canvas.overlay }
  groups.NoiceConfirmBorder = { fg = p.accent.fg, bg = p.canvas.overlay }

  -- General
  groups.NoiceCursor = { link = 'Cursor' }
  groups.NoiceMini = { fg = p.fg.default, bg = p.canvas.subtle }

  -- Popup
  groups.NoicePopup = { fg = p.fg.default, bg = p.canvas.overlay }
  groups.NoicePopupBorder = { fg = p.border.default, bg = p.canvas.overlay }
  groups.NoicePopupmenu = { fg = p.fg.default, bg = p.canvas.overlay }
  groups.NoicePopupmenuBorder = { fg = p.border.default, bg = p.canvas.overlay }
  groups.NoicePopupmenuMatch = { fg = p.accent.fg, bold = true }
  groups.NoicePopupmenuSelected = { bg = p.accent.muted, blend = blend }
  groups.NoiceScrollbar = { bg = p.canvas.subtle }
  groups.NoiceScrollbarThumb = { bg = p.border.default }

  -- Split
  groups.NoiceSplit = { fg = p.fg.default, bg = p.canvas.overlay }
  groups.NoiceSplitBorder = { fg = p.border.default, bg = p.canvas.overlay }

  -- Virtual text
  groups.NoiceVirtualText = { fg = p.accent.fg }

  -- Format
  groups.NoiceFormatProgressDone = { fg = p.fg.on_emphasis, bg = p.accent.emphasis }
  groups.NoiceFormatProgressTodo = { bg = p.canvas.subtle }
  groups.NoiceFormatEvent = { fg = p.fg.subtle }
  groups.NoiceFormatKind = { fg = p.fg.subtle }
  groups.NoiceFormatDate = { fg = p.accent.fg }
  groups.NoiceFormatConfirm = { bg = p.canvas.subtle }
  groups.NoiceFormatConfirmDefault = { bg = p.accent.muted, blend = blend }
  groups.NoiceFormatTitle = { fg = p.accent.fg, bold = true }

  -- Format levels
  groups.NoiceFormatLevelDebug = { fg = p.fg.subtle }
  groups.NoiceFormatLevelTrace = { fg = p.fg.subtle }
  groups.NoiceFormatLevelOff = { fg = p.fg.subtle }
  groups.NoiceFormatLevelInfo = { fg = p.accent.fg }
  groups.NoiceFormatLevelWarn = { fg = p.attention.fg }
  groups.NoiceFormatLevelError = { fg = p.danger.fg }

  -- LSP progress
  groups.NoiceLspProgressSpinner = { fg = p.accent.fg }
  groups.NoiceLspProgressTitle = { fg = p.fg.muted }
  groups.NoiceLspProgressClient = { fg = p.accent.fg, bold = true }

  -- ============================================================
  -- nvim-navic
  -- ============================================================

  groups.NavicText = { fg = p.fg.default }
  groups.NavicSeparator = { fg = p.fg.subtle }

  -- Navic symbol icons
  groups.NavicIconsArray = { fg = p.syntax.variable }
  groups.NavicIconsBoolean = { fg = p.syntax.constant }
  groups.NavicIconsClass = { fg = p.syntax.entity }
  groups.NavicIconsConstant = { fg = p.syntax.constant }
  groups.NavicIconsConstructor = { fg = p.syntax.entity }
  groups.NavicIconsEnum = { fg = p.syntax.entity }
  groups.NavicIconsEnumMember = { fg = p.syntax.constant }
  groups.NavicIconsEvent = { fg = p.syntax.variable }
  groups.NavicIconsField = { fg = p.syntax.variable }
  groups.NavicIconsFile = { fg = p.fg.default }
  groups.NavicIconsFunction = { fg = p.syntax.func }
  groups.NavicIconsInterface = { fg = p.syntax.entity }
  groups.NavicIconsKey = { fg = p.syntax.keyword }
  groups.NavicIconsMethod = { fg = p.syntax.func }
  groups.NavicIconsModule = { fg = p.syntax.keyword }
  groups.NavicIconsNamespace = { fg = p.syntax.keyword }
  groups.NavicIconsNull = { fg = p.syntax.constant }
  groups.NavicIconsNumber = { fg = p.syntax.constant }
  groups.NavicIconsObject = { fg = p.syntax.entity }
  groups.NavicIconsOperator = { fg = p.fg.default }
  groups.NavicIconsPackage = { fg = p.syntax.keyword }
  groups.NavicIconsProperty = { fg = p.syntax.variable }
  groups.NavicIconsString = { fg = p.syntax.string }
  groups.NavicIconsStruct = { fg = p.syntax.entity }
  groups.NavicIconsTypeParameter = { fg = p.syntax.variable }
  groups.NavicIconsVariable = { fg = p.syntax.variable }

  -- ============================================================
  -- todo-comments.nvim
  -- ============================================================

  -- FIX/FIXME/BUG
  groups.TodoFgFIX = { fg = p.danger.fg }
  groups.TodoBgFIX = { fg = p.fg.on_emphasis, bg = p.danger.emphasis, bold = true }
  groups.TodoSignFIX = { fg = p.danger.fg }

  -- TODO
  groups.TodoFgTODO = { fg = p.accent.fg }
  groups.TodoBgTODO = { fg = p.fg.on_emphasis, bg = p.accent.emphasis, bold = true }
  groups.TodoSignTODO = { fg = p.accent.fg }

  -- HACK
  groups.TodoFgHACK = { fg = p.attention.fg }
  groups.TodoBgHACK = { fg = p.canvas.default, bg = p.attention.emphasis, bold = true }
  groups.TodoSignHACK = { fg = p.attention.fg }

  -- WARN/WARNING
  groups.TodoFgWARN = { fg = p.attention.fg }
  groups.TodoBgWARN = { fg = p.canvas.default, bg = p.attention.emphasis, bold = true }
  groups.TodoSignWARN = { fg = p.attention.fg }

  -- PERF/OPTIM/PERFORMANCE/OPTIMIZE
  groups.TodoFgPERF = { fg = p.done.fg }
  groups.TodoBgPERF = { fg = p.fg.on_emphasis, bg = p.done.emphasis, bold = true }
  groups.TodoSignPERF = { fg = p.done.fg }

  -- NOTE/INFO
  groups.TodoFgNOTE = { fg = p.success.fg }
  groups.TodoBgNOTE = { fg = p.fg.on_emphasis, bg = p.success.emphasis, bold = true }
  groups.TodoSignNOTE = { fg = p.success.fg }

  -- TEST
  groups.TodoFgTEST = { fg = p.done.fg }
  groups.TodoBgTEST = { fg = p.fg.on_emphasis, bg = p.done.emphasis, bold = true }
  groups.TodoSignTEST = { fg = p.done.fg }

  -- ============================================================
  -- trouble.nvim
  -- ============================================================

  groups.TroubleNormal = { fg = p.fg.default, bg = p.canvas.overlay }
  groups.TroubleNormalNC = { link = 'TroubleNormal' }
  groups.TroubleText = { fg = p.fg.default }
  groups.TroublePreview = { bg = p.accent.muted, blend = blend }
  groups.TroubleCount = { fg = p.fg.on_emphasis, bg = p.accent.emphasis, bold = true }
  groups.TroublePos = { fg = p.fg.subtle }
  groups.TroubleSource = { fg = p.fg.muted }
  groups.TroubleCode = { fg = p.fg.muted }
  groups.TroubleFilename = { fg = p.accent.fg }
  groups.TroubleBasename = { fg = p.accent.fg, bold = true }
  groups.TroubleDirectory = { fg = p.fg.muted }
  groups.TroubleIconDirectory = { fg = p.accent.fg }

  -- Indent guides
  groups.TroubleIndent = { fg = p.border.muted }
  groups.TroubleIndentFoldClosed = { fg = p.fg.default }
  groups.TroubleIndentFoldOpen = { fg = p.border.muted }
  groups.TroubleIndentTop = { link = 'TroubleIndent' }
  groups.TroubleIndentMiddle = { link = 'TroubleIndent' }
  groups.TroubleIndentLast = { link = 'TroubleIndent' }
  groups.TroubleIndentWs = { link = 'TroubleIndent' }

  -- Trouble symbol icons
  groups.TroubleIconArray = { fg = p.syntax.variable }
  groups.TroubleIconBoolean = { fg = p.syntax.constant }
  groups.TroubleIconClass = { fg = p.syntax.entity }
  groups.TroubleIconConstant = { fg = p.syntax.constant }
  groups.TroubleIconConstructor = { fg = p.syntax.entity }
  groups.TroubleIconEnum = { fg = p.syntax.entity }
  groups.TroubleIconEnumMember = { fg = p.syntax.constant }
  groups.TroubleIconEvent = { fg = p.syntax.variable }
  groups.TroubleIconField = { fg = p.syntax.variable }
  groups.TroubleIconFile = { fg = p.fg.default }
  groups.TroubleIconFunction = { fg = p.syntax.func }
  groups.TroubleIconInterface = { fg = p.syntax.entity }
  groups.TroubleIconKey = { fg = p.syntax.keyword }
  groups.TroubleIconMethod = { fg = p.syntax.func }
  groups.TroubleIconModule = { fg = p.syntax.keyword }
  groups.TroubleIconNamespace = { fg = p.syntax.keyword }
  groups.TroubleIconNull = { fg = p.syntax.constant }
  groups.TroubleIconNumber = { fg = p.syntax.constant }
  groups.TroubleIconObject = { fg = p.syntax.entity }
  groups.TroubleIconOperator = { fg = p.fg.default }
  groups.TroubleIconPackage = { fg = p.syntax.keyword }
  groups.TroubleIconProperty = { fg = p.syntax.variable }
  groups.TroubleIconString = { fg = p.syntax.string }
  groups.TroubleIconStruct = { fg = p.syntax.entity }
  groups.TroubleIconTypeParameter = { fg = p.syntax.variable }
  groups.TroubleIconVariable = { fg = p.syntax.variable }

  -- ============================================================
  -- nvim-treesitter-context
  -- ============================================================

  groups.TreesitterContext = { bg = p.canvas.subtle }
  groups.TreesitterContextLineNumber = { fg = p.fg.subtle, bg = p.canvas.subtle }
  groups.TreesitterContextLineNumberBottom = { fg = p.fg.subtle, bg = p.canvas.subtle, underline = true }
  groups.TreesitterContextBottom = { underline = true, sp = p.border.default }
  groups.TreesitterContextSeparator = { fg = p.border.default }

  -- ============================================================
  -- mini.nvim
  -- ============================================================

  -- mini.files
  groups.MiniFilesBorder = { link = 'FloatBorder' }
  groups.MiniFilesBorderModified = { fg = p.attention.fg, bg = p.canvas.overlay }
  groups.MiniFilesCursorLine = { link = 'CursorLine' }
  groups.MiniFilesDirectory = { fg = p.accent.fg }
  groups.MiniFilesFile = { fg = p.fg.default }
  groups.MiniFilesNormal = { link = 'NormalFloat' }
  groups.MiniFilesTitle = { link = 'FloatTitle' }
  groups.MiniFilesTitleFocused = { fg = p.accent.fg, bg = p.canvas.overlay, bold = true }

  -- mini.pick
  groups.MiniPickBorder = { link = 'FloatBorder' }
  groups.MiniPickBorderBusy = { fg = p.attention.fg, bg = p.canvas.overlay }
  groups.MiniPickBorderText = { fg = p.fg.muted, bg = p.canvas.overlay }
  groups.MiniPickCursor = { link = 'Cursor' }
  groups.MiniPickIconDirectory = { fg = p.accent.fg }
  groups.MiniPickIconFile = { fg = p.fg.default }
  groups.MiniPickHeader = { fg = p.accent.fg, bold = true }
  groups.MiniPickMatchCurrent = { bg = p.accent.muted, blend = blend }
  groups.MiniPickMatchMarked = { fg = p.success.fg, bg = p.success.muted }
  groups.MiniPickMatchRanges = { fg = p.accent.fg, bold = true }
  groups.MiniPickNormal = { link = 'NormalFloat' }
  groups.MiniPickPreviewLine = { link = 'CursorLine' }
  groups.MiniPickPreviewRegion = { link = 'Visual' }
  groups.MiniPickPrompt = { fg = p.accent.fg, bg = p.canvas.overlay }
  groups.MiniPickPromptCaret = { fg = p.accent.fg }
  groups.MiniPickPromptPrefix = { fg = p.accent.fg }

  -- mini.hipatterns
  groups.MiniHipatternsFixme = { fg = p.fg.on_emphasis, bg = p.danger.emphasis, bold = true }
  groups.MiniHipatternsHack = { fg = p.canvas.default, bg = p.attention.emphasis, bold = true }
  groups.MiniHipatternsTodo = { fg = p.fg.on_emphasis, bg = p.accent.emphasis, bold = true }
  groups.MiniHipatternsNote = { fg = p.fg.on_emphasis, bg = p.success.emphasis, bold = true }

  -- mini.statusline
  groups.MiniStatuslineModeNormal = { fg = p.fg.on_emphasis, bg = p.accent.emphasis, bold = true }
  groups.MiniStatuslineModeInsert = { fg = p.fg.on_emphasis, bg = p.success.emphasis, bold = true }
  groups.MiniStatuslineModeVisual = { fg = p.fg.on_emphasis, bg = p.done.emphasis, bold = true }
  groups.MiniStatuslineModeReplace = { fg = p.fg.on_emphasis, bg = p.danger.emphasis, bold = true }
  groups.MiniStatuslineModeCommand = { fg = p.canvas.default, bg = p.attention.emphasis, bold = true }
  groups.MiniStatuslineModeOther = { fg = p.fg.default, bg = p.canvas.subtle, bold = true }
  groups.MiniStatuslineDevinfo = { fg = p.fg.default, bg = p.canvas.subtle }
  groups.MiniStatuslineFilename = { fg = p.fg.muted, bg = p.canvas.inset }
  groups.MiniStatuslineFileinfo = { fg = p.fg.default, bg = p.canvas.subtle }
  groups.MiniStatuslineInactive = { fg = p.fg.subtle, bg = p.canvas.inset }

  -- mini.notify
  groups.MiniNotifyBorder = { link = 'FloatBorder' }
  groups.MiniNotifyNormal = { link = 'NormalFloat' }
  groups.MiniNotifyTitle = { link = 'FloatTitle' }

  -- mini.diff
  groups.MiniDiffSignAdd = { fg = p.success.fg }
  groups.MiniDiffSignChange = { fg = p.attention.fg }
  groups.MiniDiffSignDelete = { fg = p.danger.fg }
  groups.MiniDiffOverAdd = { bg = p.success.muted }
  groups.MiniDiffOverChange = { bg = p.attention.muted }
  groups.MiniDiffOverChangeBuf = { bg = p.attention.muted }
  groups.MiniDiffOverContext = { bg = p.canvas.subtle }
  groups.MiniDiffOverContextBuf = { bg = p.canvas.subtle }
  groups.MiniDiffOverDelete = { bg = p.danger.muted }

  -- mini.indentscope
  groups.MiniIndentscopeSymbol = { fg = p.border.default }
  groups.MiniIndentscopeSymbolOff = { fg = p.border.muted }

  -- mini.jump
  groups.MiniJump = { fg = p.fg.on_emphasis, bg = p.accent.emphasis }

  -- mini.clue
  groups.MiniClueBorder = { link = 'FloatBorder' }
  groups.MiniClueDescGroup = { fg = p.done.fg }
  groups.MiniClueDescSingle = { fg = p.fg.default }
  groups.MiniClueNextKey = { fg = p.accent.fg }
  groups.MiniClueNextKeyWithPostkeys = { fg = p.attention.fg }
  groups.MiniClueSeparator = { fg = p.border.muted }
  groups.MiniClueTitle = { link = 'FloatTitle' }

  -- mini.tabline
  groups.MiniTablineCurrent = { fg = p.fg.default, bg = p.canvas.default, bold = true }
  groups.MiniTablineVisible = { fg = p.fg.muted, bg = p.canvas.subtle }
  groups.MiniTablineHidden = { fg = p.fg.muted, bg = p.canvas.inset }
  groups.MiniTablineModifiedCurrent = { fg = p.attention.fg, bg = p.canvas.default, bold = true }
  groups.MiniTablineModifiedVisible = { fg = p.attention.fg, bg = p.canvas.subtle }
  groups.MiniTablineModifiedHidden = { fg = p.attention.fg, bg = p.canvas.inset }
  groups.MiniTablineFill = { bg = p.canvas.inset }
  groups.MiniTablineTabpagesection = { fg = p.fg.on_emphasis, bg = p.accent.emphasis, bold = true }
  groups.MiniTablineTrunc = { fg = p.fg.muted, bg = p.canvas.inset }

  -- mini.starter
  groups.MiniStarterCurrent = { bold = true }
  groups.MiniStarterFooter = { fg = p.fg.muted, italic = true }
  groups.MiniStarterHeader = { fg = p.accent.fg }
  groups.MiniStarterInactive = { fg = p.fg.subtle }
  groups.MiniStarterItem = { fg = p.fg.default }
  groups.MiniStarterItemBullet = { fg = p.border.default }
  groups.MiniStarterItemPrefix = { fg = p.attention.fg }
  groups.MiniStarterSection = { fg = p.accent.fg, bold = true }
  groups.MiniStarterQuery = { fg = p.accent.fg, bold = true }

  -- mini.cursorword
  groups.MiniCursorword = { underline = true }
  groups.MiniCursorwordCurrent = { underline = true }

  return groups
end

--- Build terminal colors from a palette
---@param p table The palette table
---@return table terminal The terminal color table
function M.build_terminal(p)
  return {
    [0] = p.ansi.black,
    [1] = p.ansi.red,
    [2] = p.ansi.green,
    [3] = p.ansi.yellow,
    [4] = p.ansi.blue,
    [5] = p.ansi.magenta,
    [6] = p.ansi.cyan,
    [7] = p.ansi.white,
    [8] = p.ansi.bright_black,
    [9] = p.ansi.bright_red,
    [10] = p.ansi.bright_green,
    [11] = p.ansi.bright_yellow,
    [12] = p.ansi.bright_blue,
    [13] = p.ansi.bright_magenta,
    [14] = p.ansi.bright_cyan,
    [15] = p.ansi.bright_white,
  }
end

return M
