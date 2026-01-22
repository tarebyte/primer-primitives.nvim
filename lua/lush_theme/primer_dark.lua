--
-- Primer Dark theme for Neovim
-- Built with Lush (https://github.com/rktjmp/lush.nvim)
-- Based on Primer Primitives (https://primer.style/primitives)
--

local lush = require("lush")
local hsl = lush.hsl

-- Primer Dark palette from Primer Primitives
local p = {
  -- Foreground
  fg = {
    default = "#f0f6fc",
    muted = "#9198a1",
    subtle = "#6e7681",
    on_emphasis = "#ffffff",
  },
  -- Canvas (backgrounds)
  canvas = {
    default = "#0d1117",
    inset = "#010409",
    subtle = "#151b23",
    overlay = "#151b23",
  },
  -- Border
  border = {
    default = "#3d444d",
    muted = "#3d444d80",
  },
  -- Accent
  accent = {
    fg = "#4493f8",
    emphasis = "#1f6feb",
    muted = "#388bfd26",
  },
  -- Semantic: Danger
  danger = {
    fg = "#f85149",
    emphasis = "#da3633",
    muted = "#490202",
  },
  -- Semantic: Success
  success = {
    fg = "#3fb950",
    emphasis = "#238636",
    muted = "#04260f",
  },
  -- Semantic: Attention/Warning
  attention = {
    fg = "#d29922",
    emphasis = "#9e6a03",
    muted = "#3b2300",
  },
  -- Semantic: Severe
  severe = {
    fg = "#db6d28",
    emphasis = "#bd561d",
    muted = "#471700",
  },
  -- Semantic: Done
  done = {
    fg = "#a371f7",
    emphasis = "#8957e5",
    muted = "#2e1461",
  },
  -- Color scales
  scale = {
    black = "#010409",
    white = "#f0f6fc",
    gray = { "#f0f6fc", "#c9d1d9", "#b1bac4", "#8b949e", "#6e7681", "#484f58", "#30363d", "#21262d", "#161b22", "#0d1117" },
    blue = { "#cae8ff", "#a5d6ff", "#79c0ff", "#58a6ff", "#388bfd", "#1f6feb", "#1158c7", "#0d419d", "#0c2d6b", "#051d4d" },
    green = { "#aff5b4", "#7ee787", "#56d364", "#3fb950", "#2ea043", "#238636", "#196c2e", "#0f5323", "#033a16", "#04260f" },
    yellow = { "#f8e3a1", "#f2cc60", "#e3b341", "#d29922", "#bb8009", "#9e6a03", "#845306", "#693e00", "#4b2900", "#341a00" },
    orange = { "#ffdfb6", "#ffc680", "#ffa657", "#f0883e", "#db6d28", "#bd561d", "#9b4215", "#762d0a", "#5a1e02", "#3d1300" },
    red = { "#ffdcd7", "#ffc1ba", "#ffa198", "#ff7b72", "#f85149", "#da3633", "#b62324", "#8e1519", "#67060c", "#490202" },
    purple = { "#eddeff", "#e2c5ff", "#d2a8ff", "#bc8cff", "#a371f7", "#8957e5", "#6e40c9", "#553098", "#3c1e70", "#271052" },
    pink = { "#ffdaec", "#ffbedd", "#ff9bce", "#f778ba", "#db61a2", "#bf4b8a", "#9e3670", "#7d2457", "#5e103e", "#42062a" },
    coral = { "#ffddd2", "#ffc2b2", "#ffa28b", "#f78166", "#ea6045", "#cf462d", "#ac3220", "#872012", "#640d04", "#460701" },
  },
  -- Syntax highlighting
  syntax = {
    comment = "#9198a1",
    constant = "#79c0ff",
    entity = "#d2a8ff",
    keyword = "#ff7b72",
    string = "#a5d6ff",
    variable = "#ffa657",
    func = "#d2a8ff",
    tag = "#7ee787",
  },
  -- ANSI colors
  ansi = {
    black = "#484f58",
    red = "#ff7b72",
    green = "#3fb950",
    yellow = "#d29922",
    blue = "#58a6ff",
    magenta = "#bc8cff",
    cyan = "#39c5cf",
    white = "#b1bac4",
    bright_black = "#6e7681",
    bright_red = "#ffa198",
    bright_green = "#56d364",
    bright_yellow = "#e3b341",
    bright_blue = "#79c0ff",
    bright_magenta = "#d2a8ff",
    bright_cyan = "#56d4dd",
    bright_white = "#f0f6fc",
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

    -- Cursor
    Cursor          { fg = p.canvas.default, bg = p.fg.default },
    lCursor         { Cursor },
    CursorIM        { Cursor },
    TermCursor      { Cursor },
    TermCursorNC    { fg = p.canvas.default, bg = p.fg.muted },

    -- Line numbers
    LineNr          { fg = p.fg.subtle },
    CursorLineNr    { fg = p.fg.default, gui = "bold" },
    SignColumn      { fg = p.fg.subtle, bg = p.canvas.default },
    FoldColumn      { fg = p.fg.subtle, bg = p.canvas.default },

    -- Cursor line/column
    CursorLine      { bg = p.canvas.subtle },
    CursorColumn    { CursorLine },
    ColorColumn     { bg = p.canvas.subtle },

    -- Visual selection
    Visual          { bg = p.accent.muted },
    VisualNOS       { Visual },

    -- Search
    Search          { fg = p.scale.black, bg = p.attention.emphasis },
    IncSearch       { fg = p.canvas.default, bg = p.accent.emphasis },
    CurSearch       { IncSearch },
    Substitute      { fg = p.canvas.default, bg = p.danger.emphasis },

    -- Diff
    DiffAdd         { bg = p.success.muted },
    DiffChange      { bg = p.attention.muted },
    DiffDelete      { bg = p.danger.muted },
    DiffText        { bg = p.attention.emphasis },

    -- Spelling
    SpellBad        { sp = p.danger.fg, gui = "undercurl" },
    SpellCap        { sp = p.attention.fg, gui = "undercurl" },
    SpellLocal      { sp = p.accent.fg, gui = "undercurl" },
    SpellRare       { sp = p.done.fg, gui = "undercurl" },

    -- Popup menu
    Pmenu           { fg = p.fg.default, bg = p.canvas.overlay },
    PmenuSel        { fg = p.fg.default, bg = p.accent.muted },
    PmenuSbar       { bg = p.canvas.subtle },
    PmenuThumb      { bg = p.border.default },

    -- Status line
    StatusLine      { fg = p.fg.muted, bg = p.canvas.inset },
    StatusLineNC    { fg = p.fg.subtle, bg = p.canvas.inset },

    -- Tab line
    TabLine         { fg = p.fg.muted, bg = p.canvas.inset },
    TabLineFill     { bg = p.canvas.inset },
    TabLineSel      { fg = p.fg.default, bg = p.canvas.default },

    -- Window
    WinSeparator    { fg = p.border.default },
    VertSplit       { WinSeparator },

    -- Folding
    Folded          { fg = p.fg.muted, bg = p.canvas.subtle },

    -- Messages
    ModeMsg         { fg = p.fg.default, gui = "bold" },
    MsgArea         { fg = p.fg.default },
    MsgSeparator    { fg = p.border.default },
    MoreMsg         { fg = p.success.fg, gui = "bold" },
    Question        { fg = p.accent.fg },
    ErrorMsg        { fg = p.danger.fg },
    WarningMsg      { fg = p.attention.fg },

    -- Misc UI
    Conceal         { fg = p.fg.subtle },
    Directory       { fg = p.accent.fg },
    EndOfBuffer     { fg = p.fg.subtle },
    MatchParen      { bg = p.accent.muted, gui = "bold" },
    NonText         { fg = p.fg.subtle },
    SpecialKey      { fg = p.fg.subtle },
    Title           { fg = p.accent.fg, gui = "bold" },
    Whitespace      { fg = p.fg.subtle },
    WildMenu        { PmenuSel },

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

    -- ============================================================
    -- Treesitter
    -- ============================================================

    sym"@text"                    { fg = p.fg.default },
    sym"@text.literal"            { String },
    sym"@text.reference"          { fg = p.accent.fg },
    sym"@text.title"              { Title },
    sym"@text.uri"                { fg = p.accent.fg, gui = "underline" },
    sym"@text.underline"          { gui = "underline" },
    sym"@text.todo"               { Todo },

    sym"@comment"                 { Comment },
    sym"@punctuation"             { fg = p.fg.default },
    sym"@punctuation.bracket"     { fg = p.fg.default },
    sym"@punctuation.delimiter"   { fg = p.fg.default },
    sym"@punctuation.special"     { fg = p.syntax.keyword },

    sym"@constant"                { Constant },
    sym"@constant.builtin"        { fg = p.syntax.constant },
    sym"@constant.macro"          { Macro },

    sym"@define"                  { Define },
    sym"@macro"                   { Macro },

    sym"@string"                  { String },
    sym"@string.escape"           { fg = p.syntax.constant },
    sym"@string.special"          { fg = p.syntax.constant },
    sym"@string.regex"            { fg = p.syntax.string },

    sym"@character"               { Character },
    sym"@character.special"       { SpecialChar },
    sym"@number"                  { Number },
    sym"@boolean"                 { Boolean },
    sym"@float"                   { Float },

    sym"@function"                { Function },
    sym"@function.builtin"        { fg = p.syntax.func },
    sym"@function.macro"          { Macro },
    sym"@function.call"           { Function },

    sym"@parameter"               { fg = p.fg.default },
    sym"@method"                  { Function },
    sym"@method.call"             { Function },
    sym"@field"                   { fg = p.syntax.variable },
    sym"@property"                { fg = p.syntax.variable },

    sym"@constructor"             { fg = p.syntax.entity },
    sym"@conditional"             { Conditional },
    sym"@repeat"                  { Repeat },
    sym"@label"                   { Label },
    sym"@operator"                { Operator },
    sym"@keyword"                 { Keyword },
    sym"@keyword.function"        { Keyword },
    sym"@keyword.operator"        { Keyword },
    sym"@keyword.return"          { Keyword },
    sym"@exception"               { Exception },

    sym"@variable"                { fg = p.fg.default },
    sym"@variable.builtin"        { fg = p.syntax.constant },
    sym"@type"                    { Type },
    sym"@type.builtin"            { fg = p.syntax.constant },
    sym"@type.qualifier"          { Keyword },
    sym"@type.definition"         { Type },

    sym"@storageclass"            { StorageClass },
    sym"@structure"               { Structure },
    sym"@namespace"               { fg = p.syntax.variable },
    sym"@include"                 { Include },
    sym"@preproc"                 { PreProc },

    sym"@debug"                   { Debug },
    sym"@tag"                     { Tag },
    sym"@tag.attribute"           { fg = p.syntax.variable },
    sym"@tag.delimiter"           { fg = p.fg.default },

    sym"@attribute"               { fg = p.syntax.entity },
    sym"@error"                   { Error },
    sym"@warning"                 { fg = p.attention.fg },
    sym"@info"                    { fg = p.accent.fg },
    sym"@hint"                    { fg = p.success.fg },

    -- ============================================================
    -- LSP Semantic Tokens
    -- ============================================================

    sym"@lsp.type.class"          { fg = p.syntax.entity },
    sym"@lsp.type.decorator"      { fg = p.syntax.entity },
    sym"@lsp.type.enum"           { fg = p.syntax.entity },
    sym"@lsp.type.enumMember"     { fg = p.syntax.constant },
    sym"@lsp.type.function"       { Function },
    sym"@lsp.type.interface"      { fg = p.syntax.entity },
    sym"@lsp.type.keyword"        { Keyword },
    sym"@lsp.type.method"         { Function },
    sym"@lsp.type.namespace"      { fg = p.syntax.variable },
    sym"@lsp.type.parameter"      { fg = p.fg.default },
    sym"@lsp.type.property"       { fg = p.syntax.variable },
    sym"@lsp.type.struct"         { fg = p.syntax.entity },
    sym"@lsp.type.type"           { Type },
    sym"@lsp.type.variable"       { fg = p.fg.default },

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

    DiagnosticUnderlineError    { sp = p.danger.fg, gui = "undercurl" },
    DiagnosticUnderlineWarn     { sp = p.attention.fg, gui = "undercurl" },
    DiagnosticUnderlineInfo     { sp = p.accent.fg, gui = "undercurl" },
    DiagnosticUnderlineHint     { sp = p.success.fg, gui = "undercurl" },

    DiagnosticFloatingError     { fg = p.danger.fg },
    DiagnosticFloatingWarn      { fg = p.attention.fg },
    DiagnosticFloatingInfo      { fg = p.accent.fg },
    DiagnosticFloatingHint      { fg = p.success.fg },

    DiagnosticSignError         { fg = p.danger.fg },
    DiagnosticSignWarn          { fg = p.attention.fg },
    DiagnosticSignInfo          { fg = p.accent.fg },
    DiagnosticSignHint          { fg = p.success.fg },

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
