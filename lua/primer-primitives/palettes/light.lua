-- Primer Light palette
-- Auto-generated from @primer/primitives
-- https://github.com/primer/primitives

return {
  name = 'primer_light',
  background = 'light',
  blend = 60,

  -- Foreground
  fg = {
    default = '#1f2328',
    muted = '#59636e',
    subtle = '#59636e',
    on_emphasis = '#ffffff',
    on_inverse = '#ffffff',
    disabled = '#818b98',
    link = '#0969da',
    neutral = '#59636e',
    black = '#1f2328',
    white = '#ffffff',
  },

  -- Canvas (backgrounds)
  canvas = {
    default = '#ffffff',
    inset = '#f6f8fa',
    subtle = '#f6f8fa',
    overlay = '#ffffff',
    disabled = '#eff2f5',
    emphasis = '#25292e',
    inverse = '#25292e',
  },

  -- Border
  border = {
    default = '#d1d9e0',
    muted = '#dfe4e9',
    emphasis = '#818b98',
    disabled = '#f2f3f4',
    translucent = '#dededf',
  },

  -- Accent
  accent = {
    fg = '#0969da',
    emphasis = '#0969da',
    muted = '#ddf4ff',
    border_emphasis = '#0969da',
    border_muted = '#bbdfff',
  },

  -- Semantic: Danger
  danger = {
    fg = '#d1242f',
    emphasis = '#cf222e',
    muted = '#ffebe9',
    border_emphasis = '#cf222e',
    border_muted = '#ffcdcd',
  },

  -- Semantic: Success
  success = {
    fg = '#1a7f37',
    emphasis = '#1f883d',
    muted = '#dafbe1',
    border_emphasis = '#1a7f37',
    border_muted = '#b7e7c4',
  },

  -- Semantic: Attention/Warning
  attention = {
    fg = '#9a6700',
    emphasis = '#9a6700',
    muted = '#fff8c5',
    border_emphasis = '#9a6700',
    border_muted = '#eedcab',
  },

  -- Semantic: Severe
  severe = {
    fg = '#bc4c00',
    emphasis = '#bc4c00',
    muted = '#fff1e5',
    border_emphasis = '#bc4c00',
    border_muted = '#fdd2b4',
  },

  -- Semantic: Done
  done = {
    fg = '#8250df',
    emphasis = '#8250df',
    muted = '#fbefff',
    border_emphasis = '#8250df',
    border_muted = '#e7d5ff',
  },

  -- Semantic: Open
  open = {
    fg = '#1a7f37',
    emphasis = '#1f883d',
    muted = '#dafbe1',
    border_emphasis = '#1a7f37',
    border_muted = '#b7e7c4',
  },

  -- Semantic: Closed
  closed = {
    fg = '#d1242f',
    emphasis = '#cf222e',
    muted = '#ffebe9',
    border_emphasis = '#cf222e',
    border_muted = '#ffcdcd',
  },

  -- Semantic: Draft
  draft = {
    fg = '#59636e',
    emphasis = '#59636e',
    muted = '#f0f1f2',
    border_emphasis = '#59636e',
    border_muted = '#dfe4e9',
  },

  -- Semantic: Neutral
  neutral = {
    fg = '#59636e',
    emphasis = '#59636e',
    muted = '#f0f1f2',
    border_emphasis = '#59636e',
    border_muted = '#dfe4e9',
  },

  -- Semantic: Sponsors
  sponsors = {
    fg = '#bf3989',
    emphasis = '#bf3989',
    muted = '#ffeff7',
    border_emphasis = '#bf3989',
    border_muted = '#ffcce9',
  },

  -- Semantic: Upsell
  upsell = {
    fg = '#8250df',
    emphasis = '#8250df',
    muted = '#fbefff',
    border_emphasis = '#8250df',
    border_muted = '#e7d5ff',
  },

  -- Color scales
  scale = {
    black = '#1f2328',
    white = '#ffffff',
  },

  -- Syntax highlighting
  syntax = {
    comment = '#59636e',
    constant = '#0550ae',
    constant_other_reference_link = '#0a3069',
    entity = '#6639ba',
    keyword = '#cf222e',
    string = '#0a3069',
    string_regexp = '#116329',
    variable = '#953800',
    func = '#6639ba',
    tag = '#0550ae',
    storage_modifier_import = '#1f2328',
    bracket_highlighter_angle = '#59636e',
    bracket_highlighter_unmatched = '#82071e',
    carriage_return_bg = '#cf222e',
    carriage_return_text = '#f6f8fa',
    invalid_illegal_bg = '#ffebe9',
    invalid_illegal_text = '#d1242f',
    markup_bold = '#1f2328',
    markup_italic = '#1f2328',
    markup_heading = '#0550ae',
    markup_list = '#3b2300',
    markup_inserted_bg = '#dafbe1',
    markup_inserted_text = '#116329',
    markup_deleted_bg = '#ffebe9',
    markup_deleted_text = '#82071e',
    markup_changed_bg = '#ffd8b5',
    markup_changed_text = '#953800',
    markup_ignored_bg = '#0550ae',
    markup_ignored_text = '#d1d9e0',
    meta_diff_range = '#8250df',
    sublimelinter_gutter_mark = '#818b98',
  },

  -- CodeMirror editor colors
  codemirror = {
    bg = '#ffffff',
    fg = '#1f2328',
    cursor = '#1f2328',
    selection_bg = '#bbdfff',
    activeline_bg = '#f0f1f2',
    matching_bracket = '#1f2328',
    gutters_bg = '#ffffff',
    line_number = '#59636e',
    gutter_marker_default = '#ffffff',
    gutter_marker_muted = '#59636e',
    syntax_comment = '#1f2328',
    syntax_constant = '#0550ae',
    syntax_entity = '#8250df',
    syntax_keyword = '#cf222e',
    syntax_storage = '#cf222e',
    syntax_string = '#0a3069',
    syntax_support = '#0550ae',
    syntax_variable = '#953800',
  },

  -- Diff colors
  diff = {
    addition_line_bg = '#dafbe1',
    addition_line_fg = '#1f2328',
    addition_num_bg = '#aceebb',
    addition_num_fg = '#1f2328',
    addition_word_bg = '#aceebb',
    addition_word_fg = '#1f2328',
    deletion_line_bg = '#ffebe9',
    deletion_line_fg = '#1f2328',
    deletion_num_bg = '#ffcecb',
    deletion_num_fg = '#1f2328',
    deletion_word_bg = '#ffcecb',
    deletion_word_fg = '#1f2328',
    hunk_line_bg = '#ddf4ff',
    hunk_line_fg = '#59636e',
    hunk_num_bg = '#b6e3ff',
    hunk_num_fg = '#1f2328',
    hunk_num_bg_hover = '#0969da',
    hunk_num_fg_hover = '#ffffff',
    empty_line_bg = '#f6f8fa',
    empty_num_bg = '#f6f8fa',
    expander_icon = '#59636e',
  },

  -- Display scale colors (0-9)
  scales = {
    auburn = { '#f2e9e9', '#e6d6d5', '#d4b7b5', '#c59e9b', '#b4827e', '#9d615c', '#8a5551', '#744744', '#5d3937', '#432928' },
    blue = { '#d1f0ff', '#ade1ff', '#75c8ff', '#47afff', '#0f8fff', '#006edb', '#005fcc', '#004db3', '#003d99', '#002b75' },
    brown = { '#eeeae2', '#dfd7c8', '#cbbda4', '#b8a484', '#a68b64', '#856d4c', '#755f43', '#64513a', '#51412f', '#3a2e22' },
    coral = { '#ffe5db', '#fecebe', '#fcab92', '#f88768', '#f25f3a', '#d43511', '#ba2e12', '#9b2712', '#7e2011', '#5d180e' },
    cyan = { '#bdf4ff', '#7ae9ff', '#00d0fa', '#00b7db', '#0099b8', '#007b94', '#006a80', '#00596b', '#004857', '#003742' },
    gray = { '#e8ecf2', '#d2dae4', '#b4c0cf', '#9ba9bb', '#808fa3', '#647182', '#5c6570', '#4e535a', '#424448', '#303031' },
    green = { '#caf7ca', '#9ceda0', '#54d961', '#31bf46', '#30a147', '#2c8141', '#2b6e3f', '#285c3b', '#254b34', '#1d3528' },
    indigo = { '#e5e9ff', '#d2d7fe', '#b1b9fb', '#979ff7', '#7a82f0', '#5a61e7', '#494edf', '#393cd5', '#2d2db4', '#25247b' },
    lemon = { '#f7eea1', '#f0db3d', '#d8bd0e', '#c2a60a', '#a68c07', '#866e04', '#786002', '#654f01', '#523f00', '#3d2e00' },
    lime = { '#e3f2b5', '#c7e580', '#9bd039', '#80b530', '#6c9d2f', '#527a29', '#476c28', '#3a5b25', '#2f4a21', '#213319' },
    olive = { '#f0f0ad', '#dbe170', '#b9c832', '#9bae32', '#819532', '#64762d', '#56682c', '#495a2b', '#3b4927', '#2a331f' },
    orange = { '#ffe7d1', '#fecfaa', '#fbaf74', '#f68c41', '#eb670f', '#b8500f', '#a24610', '#8d3c11', '#70300f', '#54230d' },
    pine = { '#bff8db', '#80efb9', '#1dd781', '#1dbf76', '#1aa267', '#167e53', '#156f4b', '#135d41', '#114b36', '#0d3627' },
    pink = { '#ffe5f1', '#fdc9e2', '#f8a5cf', '#f184bc', '#e55da5', '#ce2c85', '#b12f79', '#8e2e66', '#6e2b53', '#4d233d' },
    plum = { '#f8e5ff', '#f0cdfe', '#e2a7fb', '#d487f7', '#c264f2', '#a830e8', '#961edc', '#7d1eb8', '#651d96', '#471769' },
    purple = { '#f1e5ff', '#e6d2fe', '#d1b1fc', '#bc91f8', '#a672f3', '#894ceb', '#783ae4', '#6223d7', '#4f21ab', '#391b79' },
    red = { '#ffe2e0', '#fecdcd', '#fda5a7', '#fb8389', '#f85461', '#df0c24', '#c50d28', '#a60c29', '#880c27', '#610a20' },
    teal = { '#c7f5ef', '#89ebe1', '#22d3c7', '#1db9b4', '#179b9b', '#127e81', '#106e75', '#0d5b63', '#0a4852', '#073740' },
    yellow = { '#ffec9e', '#ffd642', '#ebb400', '#d19d00', '#b88700', '#946a00', '#805900', '#704d00', '#5c3d00', '#422b00' },
  },

  -- ANSI colors
  ansi = {
    black = '#1f2328',
    red = '#cf222e',
    green = '#116329',
    yellow = '#4d2d00',
    blue = '#0969da',
    magenta = '#8250df',
    cyan = '#1b7c83',
    white = '#59636e',
    gray = '#59636e',
    bright_black = '#393f46',
    bright_red = '#a40e26',
    bright_green = '#1a7f37',
    bright_yellow = '#633c01',
    bright_blue = '#218bff',
    bright_magenta = '#a475f9',
    bright_cyan = '#3192aa',
    bright_white = '#818b98',
  },
}

