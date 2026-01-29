-- Primer Dark Dimmed palette
-- Auto-generated from @primer/primitives
-- https://github.com/primer/primitives

return {
  name = 'primer_dark_dimmed',
  background = 'dark',
  blend = 85,

  -- Foreground
  fg = {
    default = '#d1d7e0',
    muted = '#9198a1',
    subtle = '#9198a1',
    on_emphasis = '#f0f6fc',
    on_inverse = '#010409',
    disabled = '#656c76',
    link = '#478be6',
    neutral = '#9198a1',
    black = '#010409',
    white = '#cdd9e5',
  },

  -- Canvas (backgrounds)
  canvas = {
    default = '#212830',
    inset = '#151b23',
    subtle = '#262c36',
    overlay = '#2a313c',
    disabled = '#2a313c',
    emphasis = '#3d444d',
    inverse = '#cdd9e5',
  },

  -- Border
  border = {
    default = '#3d444d',
    muted = '#353c44',
    emphasis = '#656c76',
    disabled = '#282f37',
    translucent = '#3b424b',
  },

  -- Accent
  accent = {
    fg = '#478be6',
    emphasis = '#316dca',
    muted = '#243142',
    border_emphasis = '#316dca',
    border_muted = '#2e4d78',
  },

  -- Semantic: Danger
  danger = {
    fg = '#e5534b',
    emphasis = '#c93c37',
    muted = '#352c33',
    border_emphasis = '#c93c37',
    border_muted = '#6f393b',
  },

  -- Semantic: Success
  success = {
    fg = '#57ab5a',
    emphasis = '#347d39',
    muted = '#273834',
    border_emphasis = '#347d39',
    border_muted = '#30543a',
  },

  -- Semantic: Attention/Warning
  attention = {
    fg = '#c69026',
    emphasis = '#966600',
    muted = '#36352c',
    border_emphasis = '#966600',
    border_muted = '#594a25',
  },

  -- Semantic: Severe
  severe = {
    fg = '#cc6b2c',
    emphasis = '#ae5622',
    muted = '#322f30',
    border_emphasis = '#ae5622',
    border_muted = '#65432e',
  },

  -- Semantic: Done
  done = {
    fg = '#986ee2',
    emphasis = '#8256d0',
    muted = '#33324b',
    border_emphasis = '#8256d0',
    border_muted = '#514477',
  },

  -- Semantic: Open
  open = {
    fg = '#57ab5a',
    emphasis = '#347d39',
    muted = '#273834',
    border_emphasis = '#347d39',
    border_muted = '#30543a',
  },

  -- Semantic: Closed
  closed = {
    fg = '#e5534b',
    emphasis = '#c93c37',
    muted = '#352c33',
    border_emphasis = '#c93c37',
    border_muted = '#6f393b',
  },

  -- Semantic: Draft
  draft = {
    fg = '#9198a1',
    emphasis = '#656c76',
    muted = '#2f363e',
    border_emphasis = '#656c76',
    border_muted = '#353c44',
  },

  -- Semantic: Neutral
  neutral = {
    fg = '#9198a1',
    emphasis = '#656c76',
    muted = '#2f363e',
    border_emphasis = '#656c76',
    border_muted = '#353c44',
  },

  -- Semantic: Sponsors
  sponsors = {
    fg = '#c96198',
    emphasis = '#ae4c82',
    muted = '#322e3b',
    border_emphasis = '#ae4c82',
    border_muted = '#643f5a',
  },

  -- Semantic: Upsell
  upsell = {
    fg = '#986ee2',
    emphasis = '#8256d0',
    muted = '#33324b',
    border_emphasis = '#8256d0',
    border_muted = '#514477',
  },

  -- Color scales
  scale = {
    black = '#010409',
    white = '#cdd9e5',
  },

  -- Syntax highlighting
  syntax = {
    comment = '#9198a1',
    constant = '#6cb6ff',
    constant_other_reference_link = '#96d0ff',
    entity = '#dcbdfb',
    keyword = '#f47067',
    string = '#96d0ff',
    string_regexp = '#8ddb8c',
    variable = '#f69d50',
    func = '#dcbdfb',
    tag = '#8ddb8c',
    storage_modifier_import = '#f0f6fc',
    bracket_highlighter_angle = '#9198a1',
    bracket_highlighter_unmatched = '#e5534b',
    carriage_return_bg = '#ad2e2c',
    carriage_return_text = '#f0f6fc',
    invalid_illegal_bg = '#352c33',
    invalid_illegal_text = '#e5534b',
    markup_bold = '#f0f6fc',
    markup_italic = '#f0f6fc',
    markup_heading = '#316dca',
    markup_list = '#eac55f',
    markup_inserted_bg = '#1b4721',
    markup_inserted_text = '#b4f1b4',
    markup_deleted_bg = '#78191b',
    markup_deleted_text = '#ffd8d3',
    markup_changed_bg = '#682d0f',
    markup_changed_text = '#ffddb0',
    markup_ignored_bg = '#255ab2',
    markup_ignored_text = '#f0f6fc',
    meta_diff_range = '#dcbdfb',
    sublimelinter_gutter_mark = '#3d444d',
  },

  -- CodeMirror editor colors
  codemirror = {
    bg = '#212830',
    fg = '#d1d7e0',
    cursor = '#d1d7e0',
    selection_bg = '#2e4d78',
    activeline_bg = '#2f363e',
    matching_bracket = '#d1d7e0',
    gutters_bg = '#212830',
    line_number = '#9198a1',
    gutter_marker_default = '#212830',
    gutter_marker_muted = '#9198a1',
    syntax_comment = '#656c76',
    syntax_constant = '#6cb6ff',
    syntax_entity = '#dcbdfb',
    syntax_keyword = '#f47067',
    syntax_storage = '#f47067',
    syntax_string = '#96d0ff',
    syntax_support = '#6cb6ff',
    syntax_variable = '#f69d50',
  },

  -- Diff colors
  diff = {
    addition_line_bg = '#273834',
    addition_line_fg = '#d1d7e0',
    addition_num_bg = '#31503d',
    addition_num_fg = '#d1d7e0',
    addition_word_bg = '#30543a',
    addition_word_fg = '#d1d7e0',
    deletion_line_bg = '#352c33',
    deletion_line_fg = '#d1d7e0',
    deletion_num_bg = '#5c3538',
    deletion_num_fg = '#d1d7e0',
    deletion_word_bg = '#6f393b',
    deletion_word_fg = '#d1d7e0',
    hunk_line_bg = '#243142',
    hunk_line_fg = '#9198a1',
    hunk_num_bg = '#143d79',
    hunk_num_fg = '#d1d7e0',
    hunk_num_bg_hover = '#316dca',
    hunk_num_fg_hover = '#f0f6fc',
    empty_line_bg = '#262c36',
    empty_num_bg = '#262c36',
    expander_icon = '#9198a1',
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
    red = '#f47067',
    green = '#57ab5a',
    yellow = '#c69026',
    blue = '#539bf5',
    magenta = '#b083f0',
    cyan = '#39c5cf',
    white = '#f0f6fc',
    gray = '#656c76',
    bright_black = '#656c76',
    bright_red = '#ff938a',
    bright_green = '#6bc46d',
    bright_yellow = '#daaa3f',
    bright_blue = '#6cb6ff',
    bright_magenta = '#dcbdfb',
    bright_cyan = '#56d4dd',
    bright_white = '#cdd9e5',
  },
}

