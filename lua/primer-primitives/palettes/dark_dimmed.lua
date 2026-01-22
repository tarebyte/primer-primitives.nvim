-- Primer Dark Dimmed palette from Primer Primitives
-- https://primer.style/primitives

return {
  name = 'primer_dark_dimmed',
  background = 'dark',
  blend = 75,

  -- Foreground
  fg = {
    default = '#d1d7e0',
    muted = '#9198a1',
    subtle = '#768390',
    on_emphasis = '#ffffff',
  },

  -- Canvas (backgrounds)
  canvas = {
    default = '#212830',
    inset = '#151b23',
    subtle = '#262c36',
    overlay = '#262c36',
  },

  -- Border
  border = {
    default = '#3d444d',
    muted = '#3d444d',
  },

  -- Accent
  accent = {
    fg = '#478be6',
    emphasis = '#316dca',
    muted = '#316dca',
  },

  -- Semantic: Danger
  danger = {
    fg = '#f47067',
    emphasis = '#c93c37',
    muted = '#5d0f12',
  },

  -- Semantic: Success
  success = {
    fg = '#57ab5a',
    emphasis = '#347d39',
    muted = '#122117',
  },

  -- Semantic: Attention/Warning
  attention = {
    fg = '#c69026',
    emphasis = '#966600',
    muted = '#3d2e00',
  },

  -- Semantic: Severe
  severe = {
    fg = '#e5534b',
    emphasis = '#cc6b2c',
    muted = '#4a2100',
  },

  -- Semantic: Done
  done = {
    fg = '#986ee2',
    emphasis = '#8256d0',
    muted = '#2b1a4f',
  },

  -- Color scales
  scale = {
    black = '#151b23',
    white = '#d1d7e0',
  },

  -- Syntax highlighting
  syntax = {
    comment = '#768390',
    constant = '#6cb6ff',
    entity = '#dcbdfb',
    keyword = '#f47067',
    string = '#96d0ff',
    variable = '#f69d50',
    func = '#dcbdfb',
    tag = '#8ddb8c',
  },

  -- ANSI colors
  ansi = {
    black = '#545d68',
    red = '#f47067',
    green = '#57ab5a',
    yellow = '#c69026',
    blue = '#539bf5',
    magenta = '#b083f0',
    cyan = '#39c5cf',
    white = '#909dab',
    bright_black = '#636e7b',
    bright_red = '#ff938a',
    bright_green = '#6bc46d',
    bright_yellow = '#daaa3f',
    bright_blue = '#6cb6ff',
    bright_magenta = '#dcbdfb',
    bright_cyan = '#56d4dd',
    bright_white = '#d1d7e0',
  },
}
