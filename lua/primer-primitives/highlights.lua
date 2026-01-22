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
