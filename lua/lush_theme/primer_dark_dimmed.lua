--
-- Primer Dark Dimmed theme for Neovim
-- Built with Lush (https://github.com/rktjmp/lush.nvim)
-- Based on Primer Primitives (https://primer.style/primitives)
--

local lush = require("lush")
local hsl = lush.hsl

-- Primer Dark Dimmed palette from Primer Primitives
local p = {
  -- Foreground
  fg = {
    default = "#d1d7e0",
    muted = "#9198a1",
    subtle = "#768390",
    on_emphasis = "#ffffff",
  },
  -- Canvas (backgrounds)
  canvas = {
    default = "#212830",
    inset = "#151b23",
    subtle = "#262c36",
    overlay = "#262c36",
  },
  -- Border
  border = {
    default = "#3d444d",
    muted = "#3d444d",
  },
  -- Accent
  accent = {
    fg = "#478be6",
    emphasis = "#316dca",
    muted = "#316dca",
  },
  -- Semantic: Danger
  danger = {
    fg = "#f47067",
    emphasis = "#c93c37",
    muted = "#5d0f12",
  },
  -- Semantic: Success
  success = {
    fg = "#57ab5a",
    emphasis = "#347d39",
    muted = "#122117",
  },
  -- Semantic: Attention/Warning
  attention = {
    fg = "#c69026",
    emphasis = "#966600",
    muted = "#3d2e00",
  },
  -- Semantic: Severe
  severe = {
    fg = "#e5534b",
    emphasis = "#cc6b2c",
    muted = "#4a2100",
  },
  -- Semantic: Done
  done = {
    fg = "#986ee2",
    emphasis = "#8256d0",
    muted = "#2b1a4f",
  },
  -- Color scales
  scale = {
    black = "#151b23",
    white = "#d1d7e0",
    gray = { "#d1d7e0", "#adbac7", "#909dab", "#768390", "#636e7b", "#545d68", "#444c56", "#373e47", "#2d333b", "#22272e" },
    blue = { "#c6e6ff", "#96d0ff", "#6cb6ff", "#539bf5", "#4184e4", "#316dca", "#255ab2", "#1b4b91", "#143d79", "#0f2d5c" },
    green = { "#b4f1b4", "#8ddb8c", "#6bc46d", "#57ab5a", "#46954a", "#347d39", "#2b6a30", "#245829", "#1b4721", "#113417" },
    yellow = { "#fbe090", "#eac55f", "#daaa3f", "#c69026", "#ae7c14", "#966600", "#7a5300", "#614200", "#4d3400", "#3d2a00" },
    orange = { "#ffddb0", "#ffbc6f", "#f69d50", "#e0823d", "#cc6b2c", "#ae5622", "#94471b", "#7f3913", "#682d0f", "#4d210c" },
    red = { "#ffd8d3", "#ffb8b0", "#ff938a", "#f47067", "#e5534b", "#c93c37", "#ad2e2c", "#8c2220", "#6c1716", "#4c0d0e" },
    purple = { "#eedcff", "#dcbdfb", "#dcbdfb", "#b083f0", "#986ee2", "#8256d0", "#6b44bc", "#5936a2", "#472c82", "#352160" },
    pink = { "#ffd7eb", "#ffb3d8", "#fc8dc7", "#e275ad", "#c96198", "#ae4c82", "#983b6e", "#7e325a", "#69264a", "#551639" },
    coral = { "#ffdacf", "#ffb9a5", "#f79981", "#ec775c", "#de5b41", "#c2442d", "#a63725", "#8a2c1c", "#6f2318", "#551913" },
  },
  -- Syntax highlighting
  syntax = {
    comment = "#768390",
    constant = "#6cb6ff",
    entity = "#dcbdfb",
    keyword = "#f47067",
    string = "#96d0ff",
    variable = "#f69d50",
    func = "#dcbdfb",
    tag = "#8ddb8c",
  },
  -- ANSI colors
  ansi = {
    black = "#545d68",
    red = "#f47067",
    green = "#57ab5a",
    yellow = "#c69026",
    blue = "#539bf5",
    magenta = "#b083f0",
    cyan = "#39c5cf",
    white = "#909dab",
    bright_black = "#636e7b",
    bright_red = "#ff938a",
    bright_green = "#6bc46d",
    bright_yellow = "#daaa3f",
    bright_blue = "#6cb6ff",
    bright_magenta = "#dcbdfb",
    bright_cyan = "#56d4dd",
    bright_white = "#d1d7e0",
  },
}

---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym

  return {
    -- ============================================================
    -- Editor UI
    -- ============================================================

    Normal          { fg = p.fg.default, bg = p.canvas.default },
    NormalFloat     { fg = p.fg.default, bg = p.canvas.overlay },
    NormalNC        { fg = p.fg.default, bg = p.canvas.default },
    FloatBorder     { fg = p.border.default, bg = p.canvas.overlay },
    FloatTitle      { fg = p.fg.default, bg = p.canvas.overlay, gui = "bold" },
    FloatFooter     { fg = p.fg.muted, bg = p.canvas.overlay },

    Cursor          { fg = p.canvas.default, bg = p.fg.default },
    lCursor         { Cursor },
    CursorIM        { Cursor },
    TermCursor      { Cursor },
    TermCursorNC    { fg = p.canvas.default, bg = p.fg.muted },

    LineNr          { fg = p.fg.subtle },
    LineNrAbove     { fg = p.fg.subtle },
    LineNrBelow     { fg = p.fg.subtle },
    CursorLineNr    { fg = p.fg.default, gui = "bold" },
    CursorLineFold  { fg = p.fg.subtle },
    CursorLineSign  { bg = p.canvas.subtle },
    SignColumn      { fg = p.fg.subtle, bg = p.canvas.default },
    FoldColumn      { fg = p.fg.subtle, bg = p.canvas.default },

    CursorLine      { bg = p.canvas.subtle },
    CursorColumn    { CursorLine },
    ColorColumn     { bg = p.canvas.subtle },

    Visual          { bg = p.accent.muted },
    VisualNOS       { Visual },

    Search          { fg = p.scale.black, bg = p.attention.emphasis },
    IncSearch       { fg = p.canvas.default, bg = p.accent.emphasis },
    CurSearch       { IncSearch },
    Substitute      { fg = p.canvas.default, bg = p.danger.emphasis },

    DiffAdd         { bg = p.success.muted },
    DiffChange      { bg = p.attention.muted },
    DiffDelete      { bg = p.danger.muted },
    DiffText        { bg = p.attention.emphasis },

    SpellBad        { sp = p.danger.fg, gui = "undercurl" },
    SpellCap        { sp = p.attention.fg, gui = "undercurl" },
    SpellLocal      { sp = p.accent.fg, gui = "undercurl" },
    SpellRare       { sp = p.done.fg, gui = "undercurl" },

    Pmenu           { fg = p.fg.default, bg = p.canvas.overlay },
    PmenuSel        { fg = p.fg.default, bg = p.accent.muted },
    PmenuKind       { fg = p.fg.muted, bg = p.canvas.overlay },
    PmenuKindSel    { fg = p.fg.muted, bg = p.accent.muted },
    PmenuExtra      { fg = p.fg.subtle, bg = p.canvas.overlay },
    PmenuExtraSel   { fg = p.fg.subtle, bg = p.accent.muted },
    PmenuSbar       { bg = p.canvas.subtle },
    PmenuThumb      { bg = p.border.default },
    PmenuMatch      { fg = p.accent.fg, bg = p.canvas.overlay, gui = "bold" },
    PmenuMatchSel   { fg = p.accent.fg, bg = p.accent.muted, gui = "bold" },

    ComplMatchIns   { fg = p.accent.fg },

    StatusLine      { fg = p.fg.muted, bg = p.canvas.inset },
    StatusLineNC    { fg = p.fg.subtle, bg = p.canvas.inset },
    StatusLineTerm  { fg = p.fg.muted, bg = p.canvas.inset },
    StatusLineTermNC { fg = p.fg.subtle, bg = p.canvas.inset },

    TabLine         { fg = p.fg.muted, bg = p.canvas.inset },
    TabLineFill     { bg = p.canvas.inset },
    TabLineSel      { fg = p.fg.default, bg = p.canvas.default },

    WinSeparator    { fg = p.border.default },
    VertSplit       { WinSeparator },
    WinBar          { fg = p.fg.default, bg = p.canvas.default, gui = "bold" },
    WinBarNC        { fg = p.fg.muted, bg = p.canvas.default },

    Folded          { fg = p.fg.muted, bg = p.canvas.subtle },

    ModeMsg         { fg = p.fg.default, gui = "bold" },
    MsgArea         { fg = p.fg.default },
    MsgSeparator    { fg = p.border.default },
    MoreMsg         { fg = p.success.fg, gui = "bold" },
    Question        { fg = p.accent.fg },
    ErrorMsg        { fg = p.danger.fg },
    WarningMsg      { fg = p.attention.fg },

    Conceal         { fg = p.fg.subtle },
    Directory       { fg = p.accent.fg },
    EndOfBuffer     { fg = p.fg.subtle },
    MatchParen      { bg = p.accent.muted, gui = "bold" },
    NonText         { fg = p.fg.subtle },
    SpecialKey      { fg = p.fg.subtle },
    Title           { fg = p.accent.fg, gui = "bold" },
    Whitespace      { fg = p.fg.subtle },
    WildMenu        { PmenuSel },
    QuickFixLine    { bg = p.accent.muted },
    SnippetTabstop  { bg = p.canvas.subtle },

    -- ============================================================
    -- Syntax Highlighting
    -- ============================================================

    Comment         { fg = p.syntax.comment, gui = "italic" },

    Constant        { fg = p.syntax.constant },
    String          { fg = p.syntax.string },
    Character       { fg = p.syntax.string },
    Number          { fg = p.syntax.constant },
    Boolean         { fg = p.syntax.constant },
    Float           { fg = p.syntax.constant },

    Identifier      { fg = p.fg.default },
    Function        { fg = p.syntax.func },

    Statement       { fg = p.syntax.keyword },
    Conditional     { fg = p.syntax.keyword },
    Repeat          { fg = p.syntax.keyword },
    Label           { fg = p.syntax.keyword },
    Operator        { fg = p.fg.default },
    Keyword         { fg = p.syntax.keyword },
    Exception       { fg = p.syntax.keyword },

    PreProc         { fg = p.syntax.keyword },
    Include         { fg = p.syntax.keyword },
    Define          { fg = p.syntax.keyword },
    Macro           { fg = p.syntax.constant },
    PreCondit       { fg = p.syntax.keyword },

    Type            { fg = p.syntax.variable },
    StorageClass    { fg = p.syntax.keyword },
    Structure       { fg = p.syntax.keyword },
    Typedef         { fg = p.syntax.keyword },

    Special         { fg = p.syntax.constant },
    SpecialChar     { fg = p.syntax.string },
    Tag             { fg = p.syntax.tag },
    Delimiter       { fg = p.fg.default },
    SpecialComment  { fg = p.syntax.comment, gui = "italic,bold" },
    Debug           { fg = p.attention.fg },

    Underlined      { fg = p.accent.fg, gui = "underline" },
    Ignore          { fg = p.fg.subtle },
    Error           { fg = p.danger.fg },
    Todo            { fg = p.attention.fg, gui = "bold" },

    Added           { fg = p.success.fg },
    Changed         { fg = p.attention.fg },
    Removed         { fg = p.danger.fg },

    -- ============================================================
    -- Treesitter
    -- ============================================================

    -- Identifiers
    sym"@variable"                { fg = p.fg.default },
    sym"@variable.builtin"        { fg = p.syntax.constant },
    sym"@variable.parameter"      { fg = p.fg.default },
    sym"@variable.member"         { fg = p.syntax.variable },

    -- Constants
    sym"@constant"                { Constant },
    sym"@constant.builtin"        { fg = p.syntax.constant },
    sym"@constant.macro"          { Macro },

    -- Modules/Namespaces
    sym"@module"                  { fg = p.syntax.variable },
    sym"@module.builtin"          { fg = p.syntax.constant },
    sym"@label"                   { Label },

    -- Strings
    sym"@string"                  { String },
    sym"@string.documentation"    { String },
    sym"@string.escape"           { fg = p.syntax.constant },
    sym"@string.regexp"           { fg = p.syntax.string },
    sym"@string.special"          { fg = p.syntax.constant },
    sym"@string.special.symbol"   { fg = p.syntax.constant },
    sym"@string.special.path"     { fg = p.accent.fg },
    sym"@string.special.url"      { fg = p.accent.fg, gui = "underline" },

    -- Characters
    sym"@character"               { Character },
    sym"@character.special"       { SpecialChar },

    -- Booleans/Numbers
    sym"@boolean"                 { Boolean },
    sym"@number"                  { Number },
    sym"@number.float"            { Float },

    -- Types
    sym"@type"                    { Type },
    sym"@type.builtin"            { fg = p.syntax.constant },
    sym"@type.definition"         { Type },
    sym"@type.qualifier"          { Keyword },

    -- Attributes/Properties
    sym"@attribute"               { fg = p.syntax.entity },
    sym"@attribute.builtin"       { fg = p.syntax.entity },
    sym"@property"                { fg = p.syntax.variable },

    -- Functions
    sym"@function"                { Function },
    sym"@function.builtin"        { fg = p.syntax.func },
    sym"@function.call"           { Function },
    sym"@function.macro"          { Macro },
    sym"@function.method"         { Function },
    sym"@function.method.call"    { Function },

    -- Constructors
    sym"@constructor"             { fg = p.syntax.entity },

    -- Operators
    sym"@operator"                { Operator },

    -- Keywords
    sym"@keyword"                 { Keyword },
    sym"@keyword.conditional"     { Conditional },
    sym"@keyword.conditional.ternary" { Operator },
    sym"@keyword.coroutine"       { Keyword },
    sym"@keyword.debug"           { Debug },
    sym"@keyword.directive"       { PreProc },
    sym"@keyword.directive.define" { Define },
    sym"@keyword.exception"       { Exception },
    sym"@keyword.function"        { Keyword },
    sym"@keyword.import"          { Include },
    sym"@keyword.modifier"        { Keyword },
    sym"@keyword.operator"        { Keyword },
    sym"@keyword.repeat"          { Repeat },
    sym"@keyword.return"          { Keyword },
    sym"@keyword.type"            { Keyword },

    -- Punctuation
    sym"@punctuation"             { fg = p.fg.default },
    sym"@punctuation.bracket"     { fg = p.fg.default },
    sym"@punctuation.delimiter"   { fg = p.fg.default },
    sym"@punctuation.special"     { fg = p.syntax.keyword },

    -- Comments
    sym"@comment"                 { Comment },
    sym"@comment.documentation"   { Comment },
    sym"@comment.error"           { fg = p.danger.fg, gui = "bold" },
    sym"@comment.warning"         { fg = p.attention.fg, gui = "bold" },
    sym"@comment.todo"            { Todo },
    sym"@comment.note"            { fg = p.accent.fg, gui = "bold" },

    -- Markup
    sym"@markup.strong"           { gui = "bold" },
    sym"@markup.italic"           { gui = "italic" },
    sym"@markup.strikethrough"    { gui = "strikethrough" },
    sym"@markup.underline"        { gui = "underline" },
    sym"@markup.heading"          { Title },
    sym"@markup.heading.1"        { fg = p.accent.fg, gui = "bold" },
    sym"@markup.heading.2"        { fg = p.accent.fg, gui = "bold" },
    sym"@markup.heading.3"        { fg = p.accent.fg, gui = "bold" },
    sym"@markup.heading.4"        { fg = p.accent.fg, gui = "bold" },
    sym"@markup.heading.5"        { fg = p.accent.fg, gui = "bold" },
    sym"@markup.heading.6"        { fg = p.accent.fg, gui = "bold" },
    sym"@markup.quote"            { fg = p.fg.muted, gui = "italic" },
    sym"@markup.math"             { fg = p.syntax.constant },
    sym"@markup.link"             { fg = p.accent.fg },
    sym"@markup.link.label"       { fg = p.accent.fg },
    sym"@markup.link.url"         { fg = p.accent.fg, gui = "underline" },
    sym"@markup.raw"              { fg = p.syntax.string },
    sym"@markup.raw.block"        { fg = p.syntax.string },
    sym"@markup.list"             { fg = p.fg.default },
    sym"@markup.list.checked"     { fg = p.success.fg },
    sym"@markup.list.unchecked"   { fg = p.fg.muted },

    -- Diff
    sym"@diff.plus"               { fg = p.success.fg },
    sym"@diff.minus"              { fg = p.danger.fg },
    sym"@diff.delta"              { fg = p.attention.fg },

    -- Tags (HTML/XML)
    sym"@tag"                     { Tag },
    sym"@tag.attribute"           { fg = p.syntax.variable },
    sym"@tag.builtin"             { Tag },
    sym"@tag.delimiter"           { fg = p.fg.default },

    -- Legacy Treesitter captures (for compatibility)
    sym"@text"                    { fg = p.fg.default },
    sym"@text.literal"            { String },
    sym"@text.reference"          { fg = p.accent.fg },
    sym"@text.title"              { Title },
    sym"@text.uri"                { fg = p.accent.fg, gui = "underline" },
    sym"@text.underline"          { gui = "underline" },
    sym"@text.todo"               { Todo },
    sym"@define"                  { Define },
    sym"@macro"                   { Macro },
    sym"@string.regex"            { fg = p.syntax.string },
    sym"@float"                   { Float },
    sym"@parameter"               { fg = p.fg.default },
    sym"@method"                  { Function },
    sym"@method.call"             { Function },
    sym"@field"                   { fg = p.syntax.variable },
    sym"@conditional"             { Conditional },
    sym"@repeat"                  { Repeat },
    sym"@exception"               { Exception },
    sym"@storageclass"            { StorageClass },
    sym"@structure"               { Structure },
    sym"@namespace"               { fg = p.syntax.variable },
    sym"@include"                 { Include },
    sym"@preproc"                 { PreProc },
    sym"@debug"                   { Debug },
    sym"@error"                   { Error },
    sym"@warning"                 { fg = p.attention.fg },
    sym"@info"                    { fg = p.accent.fg },
    sym"@hint"                    { fg = p.success.fg },

    -- ============================================================
    -- LSP Semantic Tokens
    -- ============================================================

    -- Types
    sym"@lsp.type.class"          { fg = p.syntax.entity },
    sym"@lsp.type.comment"        { Comment },
    sym"@lsp.type.decorator"      { fg = p.syntax.entity },
    sym"@lsp.type.enum"           { fg = p.syntax.entity },
    sym"@lsp.type.enumMember"     { fg = p.syntax.constant },
    sym"@lsp.type.event"          { fg = p.syntax.entity },
    sym"@lsp.type.function"       { Function },
    sym"@lsp.type.interface"      { fg = p.syntax.entity },
    sym"@lsp.type.keyword"        { Keyword },
    sym"@lsp.type.macro"          { Macro },
    sym"@lsp.type.method"         { Function },
    sym"@lsp.type.modifier"       { Keyword },
    sym"@lsp.type.namespace"      { fg = p.syntax.variable },
    sym"@lsp.type.number"         { Number },
    sym"@lsp.type.operator"       { Operator },
    sym"@lsp.type.parameter"      { fg = p.fg.default },
    sym"@lsp.type.property"       { fg = p.syntax.variable },
    sym"@lsp.type.regexp"         { fg = p.syntax.string },
    sym"@lsp.type.string"         { String },
    sym"@lsp.type.struct"         { fg = p.syntax.entity },
    sym"@lsp.type.type"           { Type },
    sym"@lsp.type.typeParameter"  { fg = p.syntax.variable },
    sym"@lsp.type.variable"       { fg = p.fg.default },

    -- Modifiers
    sym"@lsp.mod.abstract"        { gui = "italic" },
    sym"@lsp.mod.async"           { gui = "bold" },
    sym"@lsp.mod.declaration"     { },
    sym"@lsp.mod.defaultLibrary"  { fg = p.syntax.constant },
    sym"@lsp.mod.definition"      { },
    sym"@lsp.mod.deprecated"      { gui = "strikethrough" },
    sym"@lsp.mod.documentation"   { },
    sym"@lsp.mod.modification"    { },
    sym"@lsp.mod.readonly"        { },
    sym"@lsp.mod.static"          { gui = "bold" },

    -- ============================================================
    -- LSP Highlights
    -- ============================================================

    LspReferenceText            { bg = p.accent.muted },
    LspReferenceRead            { bg = p.accent.muted },
    LspReferenceWrite           { bg = p.attention.muted },
    LspReferenceTarget          { bg = p.accent.muted },

    LspCodeLens                 { fg = p.fg.subtle },
    LspCodeLensSeparator        { fg = p.fg.subtle },
    LspSignatureActiveParameter { fg = p.accent.fg, gui = "bold,underline" },
    LspInlayHint                { fg = p.fg.subtle, bg = p.canvas.subtle },

    -- ============================================================
    -- Diagnostics
    -- ============================================================

    DiagnosticError             { fg = p.danger.fg },
    DiagnosticWarn              { fg = p.attention.fg },
    DiagnosticInfo              { fg = p.accent.fg },
    DiagnosticHint              { fg = p.success.fg },
    DiagnosticOk                { fg = p.success.fg },

    DiagnosticVirtualTextError  { fg = p.danger.fg, bg = p.danger.muted },
    DiagnosticVirtualTextWarn   { fg = p.attention.fg, bg = p.attention.muted },
    DiagnosticVirtualTextInfo   { fg = p.accent.fg, bg = p.accent.muted },
    DiagnosticVirtualTextHint   { fg = p.success.fg, bg = p.success.muted },
    DiagnosticVirtualTextOk     { fg = p.success.fg, bg = p.success.muted },

    DiagnosticUnderlineError    { sp = p.danger.fg, gui = "undercurl" },
    DiagnosticUnderlineWarn     { sp = p.attention.fg, gui = "undercurl" },
    DiagnosticUnderlineInfo     { sp = p.accent.fg, gui = "undercurl" },
    DiagnosticUnderlineHint     { sp = p.success.fg, gui = "undercurl" },
    DiagnosticUnderlineOk       { sp = p.success.fg, gui = "undercurl" },

    DiagnosticFloatingError     { fg = p.danger.fg },
    DiagnosticFloatingWarn      { fg = p.attention.fg },
    DiagnosticFloatingInfo      { fg = p.accent.fg },
    DiagnosticFloatingHint      { fg = p.success.fg },
    DiagnosticFloatingOk        { fg = p.success.fg },

    DiagnosticSignError         { fg = p.danger.fg },
    DiagnosticSignWarn          { fg = p.attention.fg },
    DiagnosticSignInfo          { fg = p.accent.fg },
    DiagnosticSignHint          { fg = p.success.fg },
    DiagnosticSignOk            { fg = p.success.fg },

    DiagnosticDeprecated        { gui = "strikethrough", sp = p.fg.subtle },
    DiagnosticUnnecessary       { fg = p.fg.subtle },

    -- ============================================================
    -- Git Signs
    -- ============================================================

    GitSignsAdd                 { fg = p.success.fg },
    GitSignsChange              { fg = p.attention.fg },
    GitSignsDelete              { fg = p.danger.fg },
    GitSignsAddNr               { fg = p.success.fg },
    GitSignsChangeNr            { fg = p.attention.fg },
    GitSignsDeleteNr            { fg = p.danger.fg },
    GitSignsAddLn               { bg = p.success.muted },
    GitSignsChangeLn            { bg = p.attention.muted },
    GitSignsDeleteLn            { bg = p.danger.muted },

    -- ============================================================
    -- Telescope
    -- ============================================================

    TelescopeNormal             { NormalFloat },
    TelescopeBorder             { FloatBorder },
    TelescopeTitle              { FloatTitle },
    TelescopePromptNormal       { fg = p.fg.default, bg = p.canvas.overlay },
    TelescopePromptBorder       { fg = p.border.default, bg = p.canvas.overlay },
    TelescopePromptTitle        { fg = p.fg.default, bg = p.canvas.overlay, gui = "bold" },
    TelescopePromptPrefix       { fg = p.accent.fg },
    TelescopeResultsNormal      { fg = p.fg.default, bg = p.canvas.overlay },
    TelescopeResultsBorder      { fg = p.border.default, bg = p.canvas.overlay },
    TelescopeResultsTitle       { fg = p.fg.default, bg = p.canvas.overlay },
    TelescopePreviewNormal      { fg = p.fg.default, bg = p.canvas.overlay },
    TelescopePreviewBorder      { fg = p.border.default, bg = p.canvas.overlay },
    TelescopePreviewTitle       { fg = p.fg.default, bg = p.canvas.overlay },
    TelescopeSelection          { PmenuSel },
    TelescopeSelectionCaret     { fg = p.accent.fg },
    TelescopeMultiSelection     { fg = p.fg.default, bg = p.accent.muted },
    TelescopeMatching           { fg = p.accent.fg, gui = "bold" },

    -- ============================================================
    -- nvim-cmp
    -- ============================================================

    CmpItemAbbr                 { fg = p.fg.default },
    CmpItemAbbrDeprecated       { fg = p.fg.subtle, gui = "strikethrough" },
    CmpItemAbbrMatch            { fg = p.accent.fg, gui = "bold" },
    CmpItemAbbrMatchFuzzy       { fg = p.accent.fg },
    CmpItemMenu                 { fg = p.fg.muted },
    CmpItemKind                 { fg = p.fg.muted },
    CmpItemKindDefault          { fg = p.fg.muted },
    CmpItemKindKeyword          { fg = p.syntax.keyword },
    CmpItemKindVariable         { fg = p.syntax.variable },
    CmpItemKindConstant         { fg = p.syntax.constant },
    CmpItemKindReference        { fg = p.syntax.variable },
    CmpItemKindValue            { fg = p.syntax.constant },
    CmpItemKindFunction         { fg = p.syntax.func },
    CmpItemKindMethod           { fg = p.syntax.func },
    CmpItemKindConstructor      { fg = p.syntax.entity },
    CmpItemKindClass            { fg = p.syntax.entity },
    CmpItemKindInterface        { fg = p.syntax.entity },
    CmpItemKindStruct           { fg = p.syntax.entity },
    CmpItemKindEvent            { fg = p.syntax.entity },
    CmpItemKindEnum             { fg = p.syntax.entity },
    CmpItemKindUnit             { fg = p.syntax.constant },
    CmpItemKindModule           { fg = p.syntax.variable },
    CmpItemKindProperty         { fg = p.syntax.variable },
    CmpItemKindField            { fg = p.syntax.variable },
    CmpItemKindTypeParameter    { fg = p.syntax.variable },
    CmpItemKindEnumMember       { fg = p.syntax.constant },
    CmpItemKindOperator         { fg = p.fg.default },
    CmpItemKindSnippet          { fg = p.done.fg },
    CmpItemKindText             { fg = p.fg.default },
    CmpItemKindFile             { fg = p.fg.default },
    CmpItemKindFolder           { fg = p.accent.fg },
    CmpItemKindColor            { fg = p.syntax.constant },

    -- ============================================================
    -- Indent Blankline
    -- ============================================================

    IndentBlanklineChar               { fg = p.border.muted },
    IndentBlanklineContextChar        { fg = p.border.default },
    IndentBlanklineContextStart       { sp = p.border.default, gui = "underline" },
    IndentBlanklineSpaceChar          { fg = p.border.muted },
    IndentBlanklineSpaceCharBlankline { fg = p.border.muted },

    IblIndent                         { fg = p.border.muted },
    IblScope                          { fg = p.border.default },
    IblWhitespace                     { fg = p.border.muted },

    -- ============================================================
    -- nvim-tree
    -- ============================================================

    NvimTreeNormal              { fg = p.fg.default, bg = p.canvas.inset },
    NvimTreeEndOfBuffer         { fg = p.canvas.inset },
    NvimTreeRootFolder          { fg = p.fg.muted, gui = "bold" },
    NvimTreeGitDirty            { fg = p.attention.fg },
    NvimTreeGitNew              { fg = p.success.fg },
    NvimTreeGitDeleted          { fg = p.danger.fg },
    NvimTreeSpecialFile         { fg = p.accent.fg },
    NvimTreeIndentMarker        { fg = p.border.muted },
    NvimTreeImageFile           { fg = p.fg.default },
    NvimTreeSymlink             { fg = p.accent.fg },
    NvimTreeFolderIcon          { fg = p.accent.fg },
    NvimTreeFolderName          { fg = p.fg.default },
    NvimTreeOpenedFolderName    { fg = p.fg.default },
    NvimTreeEmptyFolderName     { fg = p.fg.muted },

    -- ============================================================
    -- Neo-tree
    -- ============================================================

    NeoTreeNormal               { fg = p.fg.default, bg = p.canvas.inset },
    NeoTreeNormalNC             { fg = p.fg.default, bg = p.canvas.inset },
    NeoTreeEndOfBuffer          { fg = p.canvas.inset },
    NeoTreeRootName             { fg = p.fg.muted, gui = "bold" },
    NeoTreeGitAdded             { fg = p.success.fg },
    NeoTreeGitConflict          { fg = p.danger.fg },
    NeoTreeGitDeleted           { fg = p.danger.fg },
    NeoTreeGitIgnored           { fg = p.fg.subtle },
    NeoTreeGitModified          { fg = p.attention.fg },
    NeoTreeGitUnstaged          { fg = p.attention.fg },
    NeoTreeGitUntracked         { fg = p.success.fg },
    NeoTreeGitStaged            { fg = p.success.fg },
    NeoTreeIndentMarker         { fg = p.border.muted },
    NeoTreeDirectoryIcon        { fg = p.accent.fg },
    NeoTreeDirectoryName        { fg = p.fg.default },
    NeoTreeFileName             { fg = p.fg.default },
    NeoTreeFileIcon             { fg = p.fg.default },

    -- ============================================================
    -- Lazy.nvim
    -- ============================================================

    LazyNormal                  { NormalFloat },
    LazyButton                  { fg = p.fg.default, bg = p.canvas.subtle },
    LazyButtonActive            { fg = p.fg.on_emphasis, bg = p.accent.emphasis },
    LazyH1                      { fg = p.fg.on_emphasis, bg = p.accent.emphasis, gui = "bold" },
    LazyH2                      { fg = p.accent.fg, gui = "bold" },
    LazySpecial                 { fg = p.accent.fg },
    LazyCommit                  { fg = p.fg.muted },
    LazyCommitType              { fg = p.success.fg },
    LazyReasonPlugin            { fg = p.done.fg },
    LazyReasonEvent             { fg = p.attention.fg },
    LazyReasonCmd               { fg = p.accent.fg },
    LazyReasonFt                { fg = p.success.fg },
    LazyReasonKeys              { fg = p.done.fg },
    LazyReasonStart             { fg = p.danger.fg },

    -- ============================================================
    -- Which-key
    -- ============================================================

    WhichKey                    { fg = p.accent.fg },
    WhichKeyGroup               { fg = p.done.fg },
    WhichKeyDesc                { fg = p.fg.default },
    WhichKeySeparator           { fg = p.fg.subtle },
    WhichKeyFloat               { NormalFloat },
    WhichKeyBorder              { FloatBorder },
    WhichKeyValue               { fg = p.fg.muted },
  }
end)

return theme

-- vi:nowrap
