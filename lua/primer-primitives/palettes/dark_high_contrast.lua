-- Primer Dark High Contrast palette from Primer Primitives
-- https://primer.style/primitives

return {
  name = 'primer_dark_high_contrast',
  background = 'dark',
  blend = 75,

  -- Foreground
  fg = {
    default = '#ffffff',
    muted = '#b7bdc8',
    subtle = '#9198a1',
    on_emphasis = '#ffffff',
  },

  -- Canvas (backgrounds)
  canvas = {
    default = '#010409',
    inset = '#010409',
    subtle = '#0a0c10',
    overlay = '#151b23',
  },

  -- Border
  border = {
    default = '#b7bdc8',
    muted = '#b7bdc8',
  },

  -- Accent
  accent = {
    fg = '#74b9ff',
    emphasis = '#194fb1',
    muted = '#194fb1',
  },

  -- Semantic: Danger
  danger = {
    fg = '#ff9492',
    emphasis = '#ad0f17',
    muted = '#4c0014',
  },

  -- Semantic: Success
  success = {
    fg = '#4ae168',
    emphasis = '#006222',
    muted = '#002d11',
  },

  -- Semantic: Attention/Warning
  attention = {
    fg = '#f0b72f',
    emphasis = '#744500',
    muted = '#3b2300',
  },

  -- Semantic: Severe
  severe = {
    fg = '#fe9a58',
    emphasis = '#8f3c00',
    muted = '#471700',
  },

  -- Semantic: Done
  done = {
    fg = '#b780ff',
    emphasis = '#5c35c4',
    muted = '#271052',
  },

  -- Color scales
  scale = {
    black = '#010409',
    white = '#ffffff',
  },

  -- Syntax highlighting
  syntax = {
    comment = '#b7bdc8',
    constant = '#91cbff',
    entity = '#dbb7ff',
    keyword = '#ff9492',
    string = '#b7e4ff',
    variable = '#ffb77c',
    func = '#dbb7ff',
    tag = '#72e883',
  },

  -- ANSI colors
  ansi = {
    black = '#5a626b',
    red = '#ff9492',
    green = '#4ae168',
    yellow = '#f0b72f',
    blue = '#74b9ff',
    magenta = '#b780ff',
    cyan = '#52e4f2',
    white = '#b7bdc8',
    bright_black = '#6e7681',
    bright_red = '#ffb4af',
    bright_green = '#6eec85',
    bright_yellow = '#f4d561',
    bright_blue = '#97caff',
    bright_magenta = '#d0a8ff',
    bright_cyan = '#7aecf6',
    bright_white = '#ffffff',
  },
}
