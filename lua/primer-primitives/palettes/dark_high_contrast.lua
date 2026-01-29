-- Primer Dark High Contrast palette
-- Auto-generated from @primer/primitives
-- https://github.com/primer/primitives

return {
  name = 'primer_dark_high_contrast',
  background = 'dark',
  blend = 85,

  -- Foreground
  fg = {
    default = '#ffffff',
    muted = '#b7bdc8',
    subtle = '#b7bdc8',
    on_emphasis = '#ffffff',
    on_inverse = '#010409',
    disabled = '#656c76',
    link = '#74b9ff',
    neutral = '#d1d7e0',
    black = '#010409',
    white = '#ffffff',
  },

  -- Canvas (backgrounds)
  canvas = {
    default = '#010409',
    inset = '#010409',
    subtle = '#151b23',
    overlay = '#010409',
    disabled = '#262c36',
    emphasis = '#3d444d',
    inverse = '#ffffff',
  },

  -- Border
  border = {
    default = '#b7bdc8',
    muted = '#b7bdc8',
    emphasis = '#b7bdc8',
    disabled = '#0b0f14',
    translucent = '#9198a1',
  },

  -- Accent
  accent = {
    fg = '#74b9ff',
    emphasis = '#194fb1',
    muted = '#0a1522',
    border_emphasis = '#409eff',
    border_muted = '#5cacff',
  },

  -- Semantic: Danger
  danger = {
    fg = '#ff9492',
    emphasis = '#ad0116',
    muted = '#1b1115',
    border_emphasis = '#ff6a69',
    border_muted = '#ff8080',
  },

  -- Semantic: Success
  success = {
    fg = '#2bd853',
    emphasis = '#006222',
    muted = '#022111',
    border_emphasis = '#09b43a',
    border_muted = '#0ac740',
  },

  -- Semantic: Attention/Warning
  attention = {
    fg = '#f0b72f',
    emphasis = '#7b4900',
    muted = '#241d0d',
    border_emphasis = '#e09b13',
    border_muted = '#edaa27',
  },

  -- Semantic: Severe
  severe = {
    fg = '#fe9a2d',
    emphasis = '#8f3c00',
    muted = '#1a120c',
    border_emphasis = '#e7811d',
    border_muted = '#f48b25',
  },

  -- Semantic: Done
  done = {
    fg = '#d3abff',
    emphasis = '#6921d7',
    muted = '#1d192e',
    border_emphasis = '#b87fff',
    border_muted = '#bf8fff',
  },

  -- Semantic: Open
  open = {
    fg = '#2bd853',
    emphasis = '#006222',
    muted = '#022111',
    border_emphasis = '#09b43a',
    border_muted = '#0ac740',
  },

  -- Semantic: Closed
  closed = {
    fg = '#ff9492',
    emphasis = '#ad0116',
    muted = '#1b1115',
    border_emphasis = '#ff6a69',
    border_muted = '#ff8080',
  },

  -- Semantic: Draft
  draft = {
    fg = '#d1d7e0',
    emphasis = '#3d444d',
    muted = '#212830',
    border_emphasis = '#b7bdc8',
    border_muted = '#b7bdc8',
  },

  -- Semantic: Neutral
  neutral = {
    fg = '#d1d7e0',
    emphasis = '#3d444d',
    muted = '#212830',
    border_emphasis = '#b7bdc8',
    border_muted = '#b7bdc8',
  },

  -- Semantic: Sponsors
  sponsors = {
    fg = '#ff90c8',
    emphasis = '#9c1d6a',
    muted = '#1a101b',
    border_emphasis = '#ef6eb1',
    border_muted = '#f87cbd',
  },

  -- Semantic: Upsell
  upsell = {
    fg = '#d3abff',
    emphasis = '#6921d7',
    muted = '#1d192e',
    border_emphasis = '#b87fff',
    border_muted = '#bf8fff',
  },

  -- Color scales
  scale = {
    black = '#010409',
    white = '#ffffff',
  },

  -- Syntax highlighting
  syntax = {
    comment = '#9198a1',
    constant = '#91cbff',
    constant_other_reference_link = '#addcff',
    entity = '#dbb7ff',
    keyword = '#ff9492',
    string = '#addcff',
    string_regexp = '#72f088',
    variable = '#ffb757',
    func = '#dbb7ff',
    tag = '#72f088',
    storage_modifier_import = '#f0f6fc',
    bracket_highlighter_angle = '#9198a1',
    bracket_highlighter_unmatched = '#ff8080',
    carriage_return_bg = '#ff4445',
    carriage_return_text = '#f0f6fc',
    invalid_illegal_bg = '#1b1115',
    invalid_illegal_text = '#ff9492',
    markup_bold = '#f0f6fc',
    markup_italic = '#f0f6fc',
    markup_heading = '#409eff',
    markup_list = '#fbd669',
    markup_inserted_bg = '#007728',
    markup_inserted_text = '#acf7b6',
    markup_deleted_bg = '#cc1421',
    markup_deleted_text = '#ffdedb',
    markup_changed_bg = '#a74c00',
    markup_changed_text = '#ffe1b4',
    markup_ignored_bg = '#318bf8',
    markup_ignored_text = '#f0f6fc',
    meta_diff_range = '#dbb7ff',
    sublimelinter_gutter_mark = '#3d444d',
  },

  -- CodeMirror editor colors
  codemirror = {
    bg = '#010409',
    fg = '#ffffff',
    cursor = '#ffffff',
    selection_bg = '#25476b',
    activeline_bg = '#212830',
    matching_bracket = '#ffffff',
    gutters_bg = '#010409',
    line_number = '#b7bdc8',
    gutter_marker_default = '#010409',
    gutter_marker_muted = '#b7bdc8',
    syntax_comment = '#656c76',
    syntax_constant = '#91cbff',
    syntax_entity = '#dbb7ff',
    syntax_keyword = '#ff9492',
    syntax_storage = '#ff9492',
    syntax_string = '#addcff',
    syntax_support = '#91cbff',
    syntax_variable = '#ffb757',
  },

  -- Diff colors
  diff = {
    addition_line_bg = '#032b14',
    addition_line_fg = '#ffffff',
    addition_num_bg = '#0d441f',
    addition_num_fg = '#ffffff',
    addition_word_bg = '#006222',
    addition_word_fg = '#ffffff',
    deletion_line_bg = '#341d21',
    deletion_line_fg = '#ffffff',
    deletion_num_bg = '#4e292d',
    deletion_num_fg = '#ffffff',
    deletion_word_bg = '#ad0116',
    deletion_word_fg = '#ffffff',
    hunk_line_bg = '#13263a',
    hunk_line_fg = '#b7bdc8',
    hunk_num_bg = '#5cacff',
    hunk_num_fg = '#ffffff',
    hunk_num_bg_hover = '#194fb1',
    hunk_num_fg_hover = '#ffffff',
    empty_line_bg = '#151b23',
    empty_num_bg = '#151b23',
    expander_icon = '#ffffff',
  },

  -- Display scale colors (0-9)
  scales = {
    auburn = { '#271817', '#3a2422', '#543331', '#6d4340', '#87534f', '#a86f6b', '#bf9592', '#c6a19f', '#d4b7b5', '#dfcac8' },
    blue = { '#001a47', '#002766', '#00378a', '#0046a8', '#005bd1', '#0576ff', '#4da0ff', '#61adff', '#85c2ff', '#a3d3ff' },
    brown = { '#241c14', '#342a1d', '#483a28', '#5d4a32', '#755e3e', '#94774c', '#b69a6d', '#bfa77d', '#cdbb98', '#dbceb3' },
    coral = { '#351008', '#51180b', '#72220d', '#902a0e', '#b3350f', '#e1430e', '#f7794b', '#fa8c61', '#fdaa86', '#ffc0a3' },
    cyan = { '#001f29', '#002e3d', '#014156', '#02536f', '#036a8c', '#0587b3', '#07ace4', '#09b7f1', '#45cbf7', '#80dbf9' },
    gray = { '#1c1c1c', '#2a2b2d', '#393d41', '#474e57', '#576270', '#6e7f96', '#92a1b5', '#9babbf', '#b3c0d1', '#c4cfde' },
    green = { '#122117', '#182f1f', '#214529', '#285830', '#2f6f37', '#388f3f', '#41b445', '#46c144', '#75d36f', '#99e090' },
    indigo = { '#1b183f', '#25215f', '#312c90', '#3935c0', '#514ed4', '#7070e1', '#9899ec', '#a2a5f1', '#b7baf6', '#c8cbf9' },
    lemon = { '#291d00', '#372901', '#4f3c02', '#614c05', '#786008', '#977b0c', '#ba9b12', '#c4a717', '#d7bc1d', '#e3d04f' },
    lime = { '#141f0f', '#1f3116', '#2c441d', '#375421', '#496c28', '#5f892f', '#7dae37', '#89ba36', '#9fcc3e', '#bcda67' },
    olive = { '#171e0b', '#252d10', '#374115', '#485219', '#5e681d', '#7a8321', '#a2a626', '#b2af24', '#cbc025', '#e2d04b' },
    orange = { '#311708', '#43200a', '#632f0d', '#7b3c0e', '#984b10', '#c46212', '#ed8326', '#f1933b', '#f6b06a', '#fac68f' },
    pine = { '#082119', '#0b3224', '#0e4430', '#115a3e', '#14714c', '#18915e', '#1bb673', '#1ac176', '#1bda81', '#3eea97' },
    pink = { '#2d1524', '#451c35', '#65244a', '#842a5d', '#ac2f74', '#d34591', '#e57bb2', '#ec8dbd', '#f4a9cd', '#f9bed9' },
    plum = { '#2a0e3f', '#40125e', '#5c1688', '#7517ab', '#9518d8', '#b643ef', '#d07ef7', '#d889fa', '#e4a5fd', '#edbdff' },
    purple = { '#211047', '#31146b', '#481a9e', '#5b1cca', '#7730e8', '#975bf1', '#b687f7', '#c398fb', '#d2affd', '#e1c7ff' },
    red = { '#3c0614', '#58091a', '#790c20', '#990f24', '#c31328', '#eb3342', '#f27d83', '#f48b8d', '#f7adab', '#f9c1be' },
    teal = { '#041f25', '#073036', '#0a464d', '#0c555a', '#106c70', '#158a8a', '#1cb0ab', '#1fbdb2', '#24d6c4', '#5fe3d1' },
    yellow = { '#2e1a00', '#3d2401', '#5a3702', '#6d4403', '#895906', '#aa7109', '#d3910d', '#df9e11', '#edb431', '#f0ca6a' },
  },

  -- ANSI colors
  ansi = {
    black = '#2f3742',
    red = '#ff9492',
    green = '#28d751',
    yellow = '#f0b72f',
    blue = '#71b7ff',
    magenta = '#cb9eff',
    cyan = '#39c5cf',
    white = '#f0f6fc',
    gray = '#656c76',
    bright_black = '#656c76',
    bright_red = '#ffb1af',
    bright_green = '#4ae168',
    bright_yellow = '#f7c843',
    bright_blue = '#91cbff',
    bright_magenta = '#dbb7ff',
    bright_cyan = '#56d4dd',
    bright_white = '#ffffff',
  },
}

