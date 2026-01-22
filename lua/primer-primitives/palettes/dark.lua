-- Primer Dark palette from Primer Primitives
-- https://primer.style/primitives

return {
  name = 'primer_dark',
  background = 'dark',
  blend = 85,

  -- Foreground
  fg = {
    default = '#f0f6fc',
    muted = '#9198a1',
    subtle = '#6e7681',
    on_emphasis = '#ffffff',
  },

  -- Canvas (backgrounds)
  canvas = {
    default = '#0d1117',
    inset = '#010409',
    subtle = '#151b23',
    overlay = '#151b23',
  },

  -- Border
  border = {
    default = '#3d444d',
    muted = '#3d444d',
  },

  -- Accent
  accent = {
    fg = '#4493f8',
    emphasis = '#1f6feb',
    muted = '#388bfd',
  },

  -- Semantic: Danger
  danger = {
    fg = '#f85149',
    emphasis = '#da3633',
    muted = '#490202',
  },

  -- Semantic: Success
  success = {
    fg = '#3fb950',
    emphasis = '#238636',
    muted = '#04260f',
  },

  -- Semantic: Attention/Warning
  attention = {
    fg = '#d29922',
    emphasis = '#9e6a03',
    muted = '#3b2300',
  },

  -- Semantic: Severe
  severe = {
    fg = '#db6d28',
    emphasis = '#bd561d',
    muted = '#471700',
  },

  -- Semantic: Done
  done = {
    fg = '#a371f7',
    emphasis = '#8957e5',
    muted = '#2e1461',
  },

  -- Color scales
  scale = {
    black = '#010409',
    white = '#f0f6fc',
  },

  -- Syntax highlighting
  syntax = {
    comment = '#9198a1',
    constant = '#79c0ff',
    entity = '#d2a8ff',
    keyword = '#ff7b72',
    string = '#a5d6ff',
    variable = '#ffa657',
    func = '#d2a8ff',
    tag = '#7ee787',
  },

  -- ANSI colors
  ansi = {
    black = '#484f58',
    red = '#ff7b72',
    green = '#3fb950',
    yellow = '#d29922',
    blue = '#58a6ff',
    magenta = '#bc8cff',
    cyan = '#39c5cf',
    white = '#b1bac4',
    bright_black = '#6e7681',
    bright_red = '#ffa198',
    bright_green = '#56d364',
    bright_yellow = '#e3b341',
    bright_blue = '#79c0ff',
    bright_magenta = '#d2a8ff',
    bright_cyan = '#56d4dd',
    bright_white = '#f0f6fc',
  },
}
